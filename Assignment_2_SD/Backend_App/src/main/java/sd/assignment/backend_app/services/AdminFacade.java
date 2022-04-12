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

    public void addNewRestaurant(RestaurantDTO restaurantDTO) throws Exception {
        restaurantService.addNew(restaurantDTO);
    }

    public void addNewFood(FoodDTO foodDTO) throws Exception {
        foodService.addNew(foodDTO);
    }

    public List<FoodDTO> getFoods(String restaurantId) throws Exception {
        return foodService.getFoods(restaurantId);
    }

    public List<OrderDTO> getOrdersByRestaurant(String restaurantId) throws Exception {
        return orderService.getAllByRestaurant(restaurantId);
    }

    public OrderDTO changeStatus(OrderDTO orderDTO) throws Exception {
        return orderService.changeOrderStatus(orderDTO);
    }

    public List<OrderDTO> filterByStatus(String orderState, String restaurantId) throws Exception {
        return orderService.getByState(orderState, restaurantId);
    }

    public List<RestaurantDTO> getRestaurants(String username) throws Exception {
        return restaurantService.getRestaurants(username);
    }
}