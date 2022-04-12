package sd.assignment.backend_app.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import sd.assignment.backend_app.dtos.*;
import sd.assignment.backend_app.response.ApiResponse;
import sd.assignment.backend_app.services.AdminFacade;
import sd.assignment.backend_app.services.CustomerFacade;

import java.util.List;

@RestController
@RequestMapping("/restaurant")
public class RestaurantController {
    @Autowired
    private AdminFacade adminFacade;
    @Autowired
    private CustomerFacade customerFacade;

    @PostMapping("/register")
    public ResponseEntity<ApiResponse> createAdmin(@RequestBody UserDTO userDTO) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "RestaurantController::createAdmin");

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

    @GetMapping("/getAll/{zoneId}")
    public ResponseEntity<ApiResponse> getAll(@PathVariable String zoneId) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "RestaurantController::getAll");

        try {
            List<RestaurantDTO> restaurants = customerFacade.getAllRestaurants(zoneId);

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

    @PostMapping("/getByName/{zoneId}")
    public ResponseEntity<ApiResponse> getRestaurantsByName(
            @RequestBody RestaurantDTO restaurantDTO,
            @PathVariable String zoneId
    ) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "RestaurantController::getRestaurantsByName");

        try {
            List<RestaurantDTO> restaurants = customerFacade.getRestaurantsByName(restaurantDTO.getName(), zoneId);

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

    @PostMapping("/createRestaurant")
    public ResponseEntity<ApiResponse> createRestaurant(@RequestBody RestaurantDTO restaurantDTO) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "RestaurantController::createRestaurant");

        try {
            adminFacade.addNewRestaurant(restaurantDTO);

            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully added new restaurant " + restaurantDTO.getName())
                    .withHttpHeader(httpHeaders)
                    .build();

        } catch (Exception ex) {
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }

    @GetMapping("/getMyRestaurants/{username}")
    public ResponseEntity<ApiResponse> getMyRestaurants(@PathVariable String username) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "RestaurantController::getMyRestaurants");

        try {
            List<RestaurantDTO> restaurantDTOS = adminFacade.getRestaurants(username);

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
