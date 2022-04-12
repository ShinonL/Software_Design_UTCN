package sd.assignment.backend_app.services;

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

    public void createOrder(OrderDTO orderDTO) throws Exception {
        OrderValidator.isOrderValid(orderDTO, zoneRepository);

        User user = userRepository.findByUsername(orderDTO.getUsername());
        if (user == null)
            throw new NotFoundException("User not found.");

        if (user.getCarts().isEmpty())
            throw new InvalidDataException("The cart is empty.");

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
        cartService.deleteAll(orderDTO.getUsername());

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

    public List<OrderDTO> getAll(String username) throws Exception {
        User user = userRepository.findByUsername(username);
        if (user == null)
            throw new NotFoundException("User not found.");

        return orderRepository.findByUser(user)
                .stream()
                .map(OrderMapper::convertToDTO)
                .collect(Collectors.toList());
    }

    public List<OrderDTO> getAllByRestaurant(String restaurantId) throws Exception {
        Optional<Restaurant> restaurant = restaurantRepository.findById(restaurantId);
        if (restaurant.isEmpty())
            throw new NotFoundException("restaurant not found.");

        return orderRepository.findByRestaurant(restaurantId)
                .stream()
                .map(OrderMapper::convertToDTO)
                .collect(Collectors.toList());
    }

    public List<OrderDTO> getByState(String state, String restaurantId) throws Exception {
        OrderState orderState;

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
            default: throw new InvalidDataException("That is not a valid order status.");
        }

        return orderRepository.findByOrderStateAndRestaurantId(orderState, restaurantId)
                .stream()
                .map(OrderMapper::convertToDTO)
                .collect(Collectors.toList());
    }

    public OrderDTO changeOrderStatus(OrderDTO orderDTO) throws Exception {
        Optional<Order> order = orderRepository.findById(orderDTO.getId());
        if (order.isEmpty())
            throw new NotFoundException("Order was not found.");

        Order updatedOrder = order.get();
        updatedOrder.setOrderState(getNext(updatedOrder.getOrderState(), orderDTO.isToDecline()));
        orderRepository.save(updatedOrder);

        return OrderMapper.convertToDTO(updatedOrder);
    }

    private OrderState getNext(OrderState orderState, boolean decline) throws Exception {
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
