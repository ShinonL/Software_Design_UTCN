package sd.assignment.backend_app.controllers;

import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import sd.assignment.backend_app.dtos.*;
import sd.assignment.backend_app.response.ApiResponse;
import sd.assignment.backend_app.services.AdminFacade;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminFacade adminFacade;

    private final Logger logger = LoggerFactory.getLogger(AdminController.class);

    @PostMapping("/create-food")
    public ResponseEntity<ApiResponse> createFood(@RequestBody FoodDTO foodDTO) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "AdminController::createFood");

        try {
            logger.info("Creating food" + foodDTO.getName());

            adminFacade.createFood(foodDTO);

            logger.info("Successfully created food" + foodDTO.getName());
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully added new food " + foodDTO.getName())
                    .withHttpHeader(httpHeaders)
                    .build();
        } catch (Exception ex) {
            logger.error("Error creating food " + foodDTO.getName());
            logger.error(ex.getMessage());
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
            logger.info("Retrieving foods for " + restaurantId);
            List<FoodDTO> foods = adminFacade.getFoodsByRestaurant(restaurantId);

            logger.info("Successfully retrieved " + foods.size() + " items");
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully retrieved foods")
                    .withData(foods)
                    .withHttpHeader(httpHeaders)
                    .build();

        } catch (Exception ex) {
            logger.error("Error retrieving foods for " + restaurantId);
            logger.error(ex.getMessage());
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
            logger.info("Retrieving orders for " + restaurantId);
            List<OrderDTO> orders = adminFacade.getOrdersByRestaurant(restaurantId);

            logger.info("Successfully retrieved " + orders.size() + " items");
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully retrieved orders")
                    .withHttpHeader(httpHeaders)
                    .withData(orders)
                    .build();

        } catch (Exception ex) {
            logger.error("Error retrieving orders for " + restaurantId);
            logger.error(ex.getMessage());
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
            logger.info("Changing status for order " + orderDTO.getId());
            OrderDTO order = adminFacade.changeOrderStatus(orderDTO);

            logger.info("Successfully changed status for order " + orderDTO.getId());
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully changed status.")
                    .withHttpHeader(httpHeaders)
                    .withData(order)
                    .build();

        } catch (Exception ex) {
            logger.error("Error changing status for order " + orderDTO.getId());
            logger.error(ex.getMessage());
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
            logger.info("Filtering orders for " + restaurantId + " by " + orderState);
            List<OrderDTO> orders = adminFacade.filterOrdersByStatusAndRestaurant(orderState, restaurantId);

            logger.info("Successfully filtered orders for " + restaurantId + " by " + orderState);
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully retrieved orders")
                    .withHttpHeader(httpHeaders)
                    .withData(orders)
                    .build();

        } catch (Exception ex) {
            logger.info("Error filtering orders for " + restaurantId + " by " + orderState);
            logger.error(ex.getMessage());
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
            logger.info("Creating admin account " + userDTO.getUsername());
            adminFacade.createAdmin(userDTO);

            logger.info("Successfully created admin account " + userDTO.getUsername());
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully registered new admin " + userDTO.getUsername())
                    .withHttpHeader(httpHeaders)
                    .build();
        } catch (Exception ex) {
            logger.info("Error creating admin account " + userDTO.getUsername());
            logger.error(ex.getMessage());
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
            logger.info("Creating restaurant " + restaurantDTO.getName());
            adminFacade.createRestaurant(restaurantDTO);

            logger.info("Successfully created restaurant " + restaurantDTO.getName());
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully added new restaurant " + restaurantDTO.getName())
                    .withHttpHeader(httpHeaders)
                    .build();

        } catch (Exception ex) {
            logger.info("Error creating restaurant " + restaurantDTO.getName());
            logger.error(ex.getMessage());
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
            logger.info("Retrieving restaurants for " + username);
            List<RestaurantDTO> restaurantDTOS = adminFacade.getRestaurantsByUsername(username);

            logger.info("Successfully retrieved restaurants for " + username);
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully added retrieved restaurants")
                    .withData(restaurantDTOS)
                    .withHttpHeader(httpHeaders)
                    .build();

        } catch (Exception ex) {
            logger.info("Error retrieving restaurants for " + username);
            logger.error(ex.getMessage());
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }
}
