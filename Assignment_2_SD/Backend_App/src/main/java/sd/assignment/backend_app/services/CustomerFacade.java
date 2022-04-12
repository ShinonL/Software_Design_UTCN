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
        userDTO.setRole(Role.CUSTOMER);
        userService.createUser(userDTO);
    }

    public void loginUser(String username, String password) throws Exception {
        userService.findUser(username, password);
    }

    public List<RestaurantDTO> getAllRestaurants(String zoneId) throws Exception {
        return restaurantService.getAll(zoneId);
    }

    public List<RestaurantDTO> getRestaurantsByName(String restaurantName, String zoneId) throws Exception {
        return restaurantService.getRestaurantsByName(restaurantName, zoneId);
    }

    public void addToCart(CartDTO cartDTO) throws Exception {
        cartService.addNew(cartDTO);
    }

    public void emptyCart(String username) throws Exception {
        cartService.deleteAll(username);
    }

    public List<CartDTO> getCart(String username) throws Exception {
        return cartService.getAll(username);
    }

    public void createOrder(OrderDTO orderDTO) throws Exception {
        orderService.createOrder(orderDTO);
    }

    public List<OrderDTO> getOrders(String username) throws Exception {
        return orderService.getAll(username);
    }

    public List<ZoneDTO> getAllZones() throws Exception {
        return zoneService.getAll();
    }
}
