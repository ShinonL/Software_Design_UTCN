package sd.assignment.backend_app.services;

import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sd.assignment.backend_app.common.enums.OrderState;
import sd.assignment.backend_app.common.exceptions.InvalidDataException;
import sd.assignment.backend_app.common.exceptions.NotFoundException;
import sd.assignment.backend_app.common.mappers.OrderMapper;
import sd.assignment.backend_app.dtos.OrderDTO;
import sd.assignment.backend_app.entities.*;
import sd.assignment.backend_app.repositories.*;
import sd.assignment.backend_app.validators.OrderValidator;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Slf4j
@Service
public class OrderService {
    @Autowired
    private OrderRepository orderRepository;
    @Autowired
    private OrderDetailsRepository orderDetailsRepository;
    @Autowired
    private ZoneRepository zoneRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private FoodRepository foodRepository;
    @Autowired
    private CartService cartService;
    @Autowired
    private RestaurantRepository restaurantRepository;

    private final Logger logger = LoggerFactory.getLogger(OrderService.class);

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
