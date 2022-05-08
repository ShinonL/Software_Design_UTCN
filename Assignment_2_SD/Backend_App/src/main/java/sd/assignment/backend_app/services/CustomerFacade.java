package sd.assignment.backend_app.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sd.assignment.backend_app.common.enums.Role;
import sd.assignment.backend_app.dtos.*;

import java.util.List;

@Service
public class CustomerFacade {
    @Autowired
    private UserService userService;
    @Autowired
    private RestaurantService restaurantService;
    @Autowired
    private CartService cartService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private ZoneService zoneService;

    public void createUser(UserDTO userDTO) throws Exception {
        userDTO.setRole(Role.ROLE_CUSTOMER);
        userService.createUser(userDTO);
    }

    public List<RestaurantDTO> getRestaurantsByZone(String zoneId) throws Exception {
        return restaurantService.getRestaurantsByZone(zoneId);
    }

    public List<RestaurantDTO> getRestaurantsByNameAndZone(String restaurantName, String zoneId) throws Exception {
        return restaurantService.getRestaurantsByNameAndZone(restaurantName, zoneId);
    }

    public void addToCart(CartDTO cartDTO) throws Exception {
        cartService.addToCart(cartDTO);
    }

    public void deleteCartByUsername(String username) throws Exception {
        cartService.deleteCartByUsername(username);
    }

    public List<CartDTO> getCartByUsername(String username) throws Exception {
        return cartService.getCartByUsername(username);
    }

    public void createOrder(OrderDTO orderDTO) throws Exception {
        orderService.createOrder(orderDTO);
    }

    public List<OrderDTO> getOrdersByUsername(String username) throws Exception {
        return orderService.getOrdersByUsername(username);
    }
}
