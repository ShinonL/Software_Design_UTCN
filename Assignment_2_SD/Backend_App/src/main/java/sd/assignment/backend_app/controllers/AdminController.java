package sd.assignment.backend_app.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import sd.assignment.backend_app.dtos.*;
import sd.assignment.backend_app.response.ApiResponse;
import sd.assignment.backend_app.services.AdminFacade;

import java.util.List;

@RestController
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminFacade adminFacade;

    @PostMapping("/create-food")
    public ResponseEntity<ApiResponse> createFood(@RequestBody FoodDTO foodDTO) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "AdminController::createFood");

        try {
            adminFacade.createFood(foodDTO);

            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully added new food " + foodDTO.getName())
                    .withHttpHeader(httpHeaders)
                    .build();
        } catch (Exception ex) {
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }

    @GetMapping("/get-foods/{restaurantId}")
    public ResponseEntity<ApiResponse> getFoodsByRestaurant(@PathVariable String restaurantId) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "AdminController::getFoodsByRestaurant");

        try {
            List<FoodDTO> foods = adminFacade.getFoodsByRestaurant(restaurantId);

            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully retrieved foods")
                    .withData(foods)
                    .withHttpHeader(httpHeaders)
                    .build();

        } catch (Exception ex) {
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }

    @GetMapping("/get-orders/{restaurantId}")
    public ResponseEntity<ApiResponse> getOrdersByRestaurant(@PathVariable String restaurantId) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "AdminController::getOrdersByRestaurant");

        try {
            List<OrderDTO> orders = adminFacade.getOrdersByRestaurant(restaurantId);

            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully retrieved orders")
                    .withHttpHeader(httpHeaders)
                    .withData(orders)
                    .build();

        } catch (Exception ex) {
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }

    @PostMapping("/change-order-status")
    public ResponseEntity<ApiResponse> changeOrderStatus(@RequestBody OrderDTO orderDTO) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "AdminController::changeOrderStatus");

        try {
            OrderDTO order = adminFacade.changeOrderStatus(orderDTO);

            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully changed status.")
                    .withHttpHeader(httpHeaders)
                    .withData(order)
                    .build();

        } catch (Exception ex) {
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }

    @GetMapping("/filter-order-by-status/{orderState}/{restaurantId}")
    public ResponseEntity<ApiResponse> filterOrdersByStatusAndRestaurant(@PathVariable String orderState, @PathVariable String restaurantId) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "AdminController::filterOrdersByStatusAndRestaurant");

        try {
            List<OrderDTO> orders = adminFacade.filterOrdersByStatusAndRestaurant(orderState, restaurantId);

            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully retrieved orders")
                    .withHttpHeader(httpHeaders)
                    .withData(orders)
                    .build();

        } catch (Exception ex) {
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }

    @PostMapping("/create-admin")
    public ResponseEntity<ApiResponse> createAdmin(@RequestBody UserDTO userDTO) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "AdminController::createAdmin");

        try {
            adminFacade.createAdmin(userDTO);

            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully registered new admin " + userDTO.getUsername())
                    .withHttpHeader(httpHeaders)
                    .build();
        } catch (Exception ex) {
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }

    @PostMapping("/create-restaurant")
    public ResponseEntity<ApiResponse> createRestaurant(@RequestBody RestaurantDTO restaurantDTO) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "AdminController::createRestaurant");

        try {
            adminFacade.createRestaurant(restaurantDTO);

            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully added new restaurant " + restaurantDTO.getName())
                    .withHttpHeader(httpHeaders)
                    .build();

        } catch (Exception ex) {
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }

    @GetMapping("/get-restaurants-by-username/{username}")
    public ResponseEntity<ApiResponse> getRestaurantsByUsername(@PathVariable String username) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "AdminController::getRestaurantsByUsername");

        try {
            List<RestaurantDTO> restaurantDTOS = adminFacade.getRestaurantsByUsername(username);

            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully added retrieved restaurants")
                    .withData(restaurantDTOS)
                    .withHttpHeader(httpHeaders)
                    .build();

        } catch (Exception ex) {
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }
}
