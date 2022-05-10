package sd.assignment.backend.services;

import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sd.assignment.backend.common.enums.OrderState;
import sd.assignment.backend.common.exceptions.InvalidDataException;
import sd.assignment.backend.common.exceptions.NotFoundException;
import sd.assignment.backend.common.mappers.OrderMapper;
import sd.assignment.backend.dtos.OrderDTO;
import sd.assignment.backend.entities.*;
import sd.assignment.backend.repositories.*;
import sd.assignment.backend.validators.OrderValidator;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * This Service deals with methods specific to the `order` entity
 */
@Slf4j
@Service
public class OrderService {
    /**
     * The order repository deals with running sql commands specific to the `order` table
     */
    @Autowired
    private OrderRepository orderRepository;
    /**
     * The order details repository deals with running sql commands specific to the `order_details` table
     */
    @Autowired
    private OrderDetailsRepository orderDetailsRepository;
    /**
     * The zone repository deals with running sql commands specific to the `zone` table
     */
    @Autowired
    private ZoneRepository zoneRepository;
    /**
     * The user repository deals with running sql commands specific to the `user` table
     */
    @Autowired
    private UserRepository userRepository;
    /**
     * The food repository deals with running sql commands specific to the `food` table
     */
    @Autowired
    private FoodRepository foodRepository;
    /**
     * The cart repository deals with running sql commands specific to the `cart` table
     */
    @Autowired
    private CartService cartService;
    /**
     * The restaurant repository deals with running sql commands specific to the `restaurant` table
     */
    @Autowired
    private RestaurantRepository restaurantRepository;
    /**
     * Used for logging the steps taken.
     */
    private final Logger logger = LoggerFactory.getLogger(OrderService.class);

    /**
     * Validates and creates a new order
     * @param orderDTO Contains information about the user, the restaurant and the details of the order
     * @throws Exception if any of the details are invalid, or if the DB couldn't be accessed
     */
    public void createOrder(OrderDTO orderDTO) throws Exception {
        logger.info("Validating order details");
        OrderValidator.isOrderValid(orderDTO, zoneRepository);

        logger.info("Validating user details");
        User user = userRepository.findByUsername(orderDTO.getUsername());
        if (user == null) {
            logger.error("User " + orderDTO.getUsername() + " not found.");
            throw new NotFoundException("User not found.");
        }

        logger.info("Validating cart");
        if (user.getCarts().isEmpty()) {
            logger.error("The cart is empty.");
            throw new InvalidDataException("The cart is empty.");
        }

        logger.info("Computing total amount.");
        double totalAmount = 0;
        List<OrderDetails> orderDetails = new ArrayList<>();
        for (Cart cart: user.getCarts()) {
            if (cart.getQuantity() == 0)
                continue;

            OrderDetails orderDetail = new OrderDetails();
            orderDetail.setQuantity(cart.getQuantity());
            orderDetail.setFood(cart.getFood());

            totalAmount += orderDetail.getFood().getPrice()  * cart.getQuantity();

            orderDetails.add(orderDetail);
        }
        logger.info("Deleting cart");
        cartService.deleteCartByUsername(orderDTO.getUsername());

        logger.info("Saving the order");
        orderDTO.setOrderState(OrderState.PENDING);

        Order order = OrderMapper.convertToEntity(orderDTO, userRepository, foodRepository);
        order.setOrderDetails(orderDetails);
        order.setTotalAmount(totalAmount);
        orderRepository.save(order);

        for (OrderDetails od: orderDetails) {
            od.setOrder(order);
            orderDetailsRepository.save(od);
        }
    }

    /**
     * Retrieved all orders of a specific user
     * @param username the identification token of the user
     * @return a list with his past orders
     * @throws Exception if the username is invalid or the DB couldn't be accessed
     */
    public List<OrderDTO> getOrdersByUsername(String username) throws Exception {
        logger.info("Validating the username" + username);
        User user = userRepository.findByUsername(username);
        if (user == null) {
            logger.error("User " + username + " not found.");
            throw new NotFoundException("User not found.");
        }

        logger.info("Retrieving orders for " + username);
        return orderRepository.findByUser(user)
                .stream()
                .map(OrderMapper::convertToDTO)
                .collect(Collectors.toList());
    }

    /**
     * Retrieved all orders of a specific restaurant
     * @param restaurantId the identification token of the restaurant
     * @return a list with its past orders
     * @throws Exception if the restaurant id is invalid or the DB couldn't be accessed
     */
    public List<OrderDTO> getOrdersByRestaurant(String restaurantId) throws Exception {
        logger.info("Validating the restaurant " + restaurantId);
        Optional<Restaurant> restaurant = restaurantRepository.findById(restaurantId);
        if (restaurant.isEmpty()){
            logger.error("Restaurant " + restaurantId + " not found.");
            throw new NotFoundException("Restaurant not found.");
        }

        logger.info("Retrieving restaurants for " + restaurantId);
        return orderRepository.findByRestaurant(restaurantId)
                .stream()
                .map(OrderMapper::convertToDTO)
                .collect(Collectors.toList());
    }

    /**
     * Retrieved all orders of a specific restaurant that have a specific status
     * @param state the status it is searching for
     * @param restaurantId the identification token of the restaurant
     * @return a list with its past orders with the given status
     * @throws Exception if the restaurant id or status are invalid or the DB couldn't be accessed
     */
    public List<OrderDTO> filterOrdersByStatusAndRestaurant(String state, String restaurantId) throws Exception {
        OrderState orderState;

        logger.info("Validating order status " + state);
        switch (state.toLowerCase()) {
            case "pending": {
                orderState = OrderState.PENDING;
                break;
            }
            case "declined": {
                orderState = OrderState.DECLINED;
                break;
            }
            case "accepted": {
                orderState = OrderState.ACCEPTED;
                break;
            }
            case "in_delivery": {
                orderState = OrderState.IN_DELIVERY;
                break;
            }
            case "delivered": {
                orderState = OrderState.DELIVERED;
                break;
            }
            default: {
                logger.error(state + " is not a valid order status.");
                throw new InvalidDataException("That is not a valid order status.");
            }
        }

        logger.info("Retrieving filtered orders.");
        return orderRepository.findByOrderStateAndRestaurantId(orderState, restaurantId)
                .stream()
                .map(OrderMapper::convertToDTO)
                .collect(Collectors.toList());
    }

    /**
     * Change the status of a given order
     * @param orderDTO the order whose status has to be changed
     * @return the order with a new status
     * @throws Exception if the order details are invalid or the DB couldn't be accessed
     */
    public OrderDTO changeOrderStatus(OrderDTO orderDTO) throws Exception {
        logger.info("Validating order details");
        Optional<Order> order = orderRepository.findById(orderDTO.getId());
        if (order.isEmpty()) {
            logger.error("Order " + orderDTO.getId() + "was not found");
            throw new NotFoundException("Order was not found.");
        }

        logger.info("Updating the status");
        Order updatedOrder = order.get();
        updatedOrder.setOrderState(getNextState(updatedOrder.getOrderState(), orderDTO.isToDecline()));

        logger.info("Saving the new status");
        orderRepository.save(updatedOrder);

        return OrderMapper.convertToDTO(updatedOrder);
    }

    private OrderState getNextState(OrderState orderState, boolean decline) throws Exception {
        switch (orderState) {
            case PENDING:
                if (decline)
                    return OrderState.DECLINED;
                else return OrderState.ACCEPTED;
            case ACCEPTED: return OrderState.IN_DELIVERY;
            case IN_DELIVERY: return OrderState.DELIVERED;
            default: throw new InvalidDataException("Cannot change this status.");
        }
    }
}
