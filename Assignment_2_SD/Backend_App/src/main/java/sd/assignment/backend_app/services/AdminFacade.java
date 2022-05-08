package sd.assignment.backend_app.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sd.assignment.backend_app.dtos.FoodDTO;
import sd.assignment.backend_app.dtos.OrderDTO;
import sd.assignment.backend_app.dtos.RestaurantDTO;
import sd.assignment.backend_app.dtos.UserDTO;

import java.util.List;

@Service
public class AdminFacade {
    @Autowired
    private AdminService adminService;
    @Autowired
    private RestaurantService restaurantService;
    @Autowired
    private FoodService foodService;
    @Autowired
    private OrderService orderService;

    public void createAdmin(UserDTO userDTO) throws Exception {
        adminService.createAdmin(userDTO);
    }

    public void createRestaurant(RestaurantDTO restaurantDTO) throws Exception {
        restaurantService.createRestaurant(restaurantDTO);
    }

    public void createFood(FoodDTO foodDTO) throws Exception {
        foodService.createFood(foodDTO);
    }

    public List<FoodDTO> getFoodsByRestaurant(String restaurantId) throws Exception {
        return foodService.getFoodsByRestaurant(restaurantId);
    }

    public List<OrderDTO> getOrdersByRestaurant(String restaurantId) throws Exception {
        return orderService.getOrdersByRestaurant(restaurantId);
    }

    public OrderDTO changeOrderStatus(OrderDTO orderDTO) throws Exception {
        return orderService.changeOrderStatus(orderDTO);
    }

    public List<OrderDTO> filterOrdersByStatusAndRestaurant(String orderState, String restaurantId) throws Exception {
        return orderService.filterOrdersByStatusAndRestaurant(orderState, restaurantId);
    }

    public List<RestaurantDTO> getRestaurantsByUsername(String username) throws Exception {
        return restaurantService.getRestaurantsByUsername(username);
    }
}
