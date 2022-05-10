package sd.assignment.backend_app.controllers;

import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import sd.assignment.backend_app.dtos.CartDTO;
import sd.assignment.backend_app.dtos.OrderDTO;
import sd.assignment.backend_app.dtos.RestaurantDTO;
import sd.assignment.backend_app.response.ApiResponse;
import sd.assignment.backend_app.services.CustomerFacade;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/customer")
public class CustomerController {
    @Autowired
    private CustomerFacade customerFacade;

    private final Logger logger = LoggerFactory.getLogger(CustomerController.class);

    @PostMapping("/add-to-cart")
    public ResponseEntity<ApiResponse> addToCart(@RequestBody CartDTO cartDTO) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "CustomerController::addToCart");

        try {
            logger.info("Adding foods to cart for" + cartDTO.getUsername());
            customerFacade.addToCart(cartDTO);

            logger.info("Successfully added foods to cart for" + cartDTO.getUsername());
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully added to cart")
                    .withHttpHeader(httpHeaders)
                    .build();

        } catch (Exception ex) {
            logger.error("Error adding foods to cart for" + cartDTO.getUsername());
            logger.error(ex.getMessage());
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }

    @DeleteMapping("/delete-cart/{username}")
    public ResponseEntity<ApiResponse> deleteCartByUsername(@PathVariable String username) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "CustomerController::deleteCartByUsername");

        try {
            logger.info("Deleting foods from cart for" + username);
            customerFacade.deleteCartByUsername(username);

            logger.info("Successfully deleted foods from cart for" + username);
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully emptied cart")
                    .withHttpHeader(httpHeaders)
                    .build();

        } catch (Exception ex) {
            logger.error("Error deleting foods from cart for" + username);
            logger.error(ex.getMessage());
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }

    @GetMapping("/get-cart-by-username/{username}")
    public ResponseEntity<ApiResponse> getCartByUsername(@PathVariable String username) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "CustomerController::getCartByUsername");

        try {
            logger.info("Retrieving foods from cart for" + username);
            List<CartDTO> cart = customerFacade.getCartByUsername(username);

            logger.info("Successfully retrieved foods from cart for" + username);
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully retrieved cart products")
                    .withHttpHeader(httpHeaders)
                    .withData(cart)
                    .build();

        } catch (Exception ex) {
            logger.error("Error retrieving foods from cart for" + username);
            logger.error(ex.getMessage());
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }

    @PostMapping("/create-order")
    public ResponseEntity<ApiResponse> createOrder(@RequestBody OrderDTO orderDTO) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "CustomerController::createOrder");

        try {
            logger.info("Creating order for " + orderDTO.getUsername());
            customerFacade.createOrder(orderDTO);

            logger.info("Successfully created order for " + orderDTO.getUsername());
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully added new order")
                    .withHttpHeader(httpHeaders)
                    .build();

        } catch (Exception ex) {
            logger.error("Error creating order for " + orderDTO.getUsername());
            logger.error(ex.getMessage());
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }

    @GetMapping("/get-orders-by-user/{username}")
    public ResponseEntity<ApiResponse> getOrdersByUsername(@PathVariable String username) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "CustomerController::getOrdersByUsername");

        try {
            logger.info("Retrieving orders for " + username);
            List<OrderDTO> orders = customerFacade.getOrdersByUsername(username);

            logger.info("Successfully retrieved order for " + username);
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully retrieved orders")
                    .withHttpHeader(httpHeaders)
                    .withData(orders)
                    .build();

        } catch (Exception ex) {
            logger.error("Error retrieving orders for " + username);
            logger.error(ex.getMessage());
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }

    @GetMapping("/get-restaurants-by-zone/{zoneId}")
    public ResponseEntity<ApiResponse> getRestaurantsByZone(@PathVariable String zoneId) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "CustomerController::getRestaurantsByZone");

        try {
            logger.info("Retrieving restaurants for zone " + zoneId);
            List<RestaurantDTO> restaurants = customerFacade.getRestaurantsByZone(zoneId);

            logger.info("Successfully retrieved restaurants for zone " + zoneId);
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully retrieved restaurants")
                    .withHttpHeader(httpHeaders)
                    .withData(restaurants)
                    .build();

        } catch (Exception ex) {
            logger.error("Error retrieving restaurants for zone " + zoneId);
            logger.error(ex.getMessage());
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }

    @PostMapping("/get-restaurant-by-name/{zoneId}")
    public ResponseEntity<ApiResponse> getRestaurantsByNameAndZone(
            @RequestBody RestaurantDTO restaurantDTO,
            @PathVariable String zoneId
    ) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "CustomerController::getRestaurantsByNameAndZone");

        try {
            logger.info("Retrieving restaurants for zone " + zoneId + " by name " + restaurantDTO.getName());
            List<RestaurantDTO> restaurants = customerFacade.getRestaurantsByNameAndZone(restaurantDTO.getName(), zoneId);

            logger.info("Successfully retrieved restaurants for zone " + zoneId + " by name " + restaurantDTO.getName());
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully retrieved restaurants")
                    .withHttpHeader(httpHeaders)
                    .withData(restaurants)
                    .build();
        } catch (Exception ex) {
            logger.error("Error retrieving restaurants for zone " + zoneId + " by name " + restaurantDTO.getName());
            logger.error(ex.getMessage());
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }
}
