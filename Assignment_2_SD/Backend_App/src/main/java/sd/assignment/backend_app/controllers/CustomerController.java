package sd.assignment.backend_app.controllers;

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

@RestController
@RequestMapping("/customer")
public class CustomerController {
    @Autowired
    private CustomerFacade customerFacade;

    @PostMapping("/add-to-cart")
    public ResponseEntity<ApiResponse> addToCart(@RequestBody CartDTO cartDTO) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "CustomerController::addToCart");

        try {
            customerFacade.addToCart(cartDTO);

            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully added to cart")
                    .withHttpHeader(httpHeaders)
                    .build();

        } catch (Exception ex) {
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
            customerFacade.deleteCartByUsername(username);

            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully emptied cart")
                    .withHttpHeader(httpHeaders)
                    .build();

        } catch (Exception ex) {
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
            List<CartDTO> cart = customerFacade.getCartByUsername(username);

            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully retrieved cart products")
                    .withHttpHeader(httpHeaders)
                    .withData(cart)
                    .build();

        } catch (Exception ex) {
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
            customerFacade.createOrder(orderDTO);

            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully added new order")
                    .withHttpHeader(httpHeaders)
                    .build();

        } catch (Exception ex) {
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
            List<OrderDTO> orders = customerFacade.getOrdersByUsername(username);

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

    @GetMapping("/get-restaurants-by-zone/{zoneId}")
    public ResponseEntity<ApiResponse> getRestaurantsByZone(@PathVariable String zoneId) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "CustomerController::getRestaurantsByZone");

        try {
            List<RestaurantDTO> restaurants = customerFacade.getRestaurantsByZone(zoneId);

            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully retrieved restaurants")
                    .withHttpHeader(httpHeaders)
                    .withData(restaurants)
                    .build();

        } catch (Exception ex) {
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
            List<RestaurantDTO> restaurants = customerFacade.getRestaurantsByNameAndZone(restaurantDTO.getName(), zoneId);

            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully retrieved restaurants")
                    .withHttpHeader(httpHeaders)
                    .withData(restaurants)
                    .build();
        } catch (Exception ex) {
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }
}
