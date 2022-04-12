package sd.assignment.backend_app.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import sd.assignment.backend_app.dtos.OrderDTO;
import sd.assignment.backend_app.response.ApiResponse;
import sd.assignment.backend_app.services.AdminFacade;
import sd.assignment.backend_app.services.CustomerFacade;

import java.util.List;

@RestController
@RequestMapping("/order")
public class OrderController {
    @Autowired
    private CustomerFacade customerFacade;
    @Autowired
    private AdminFacade adminFacade;

    @PostMapping("/createOrder")
    public ResponseEntity<ApiResponse> createOrder(@RequestBody OrderDTO orderDTO) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "OrderController::createOrder");

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

    @GetMapping("/getOrders/user/{username}")
    public ResponseEntity<ApiResponse> getOrders(@PathVariable String username) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "OrderController::getOrders");

        try {
            List<OrderDTO> orders = customerFacade.getOrders(username);

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

    @GetMapping("/getOrders/restaurant/{restaurantId}")
    public ResponseEntity<ApiResponse> getOrdersByRestaurant(@PathVariable String restaurantId) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "OrderController::getOrdersByRestaurant");

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

    @PostMapping("/changeOrderStatus")
    public ResponseEntity<ApiResponse> changeStatus(@RequestBody OrderDTO orderDTO) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "OrderController::changeStatus");

        try {
            OrderDTO order = adminFacade.changeStatus(orderDTO);

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

    @GetMapping("/filterByStatus/{orderState}/{restaurantId}")
    public ResponseEntity<ApiResponse> filterByStatus(@PathVariable String orderState, @PathVariable String restaurantId) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "OrderController::filterByStatus");

        try {
            List<OrderDTO> orders = adminFacade.filterByStatus(orderState, restaurantId);

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
}
