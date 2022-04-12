package sd.assignment.backend_app.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import sd.assignment.backend_app.dtos.FoodDTO;
import sd.assignment.backend_app.response.ApiResponse;
import sd.assignment.backend_app.services.AdminFacade;

import java.util.List;

@RestController
@RequestMapping("/food")
public class FoodController {
    @Autowired
    private AdminFacade adminFacade;

    @PostMapping("/createFood")
    public ResponseEntity<ApiResponse> createFood(@RequestBody FoodDTO foodDTO) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "FoodController::createFood");

        try {
            adminFacade.addNewFood(foodDTO);

            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully added new food " + foodDTO.getName())
                    .withHttpHeader(httpHeaders)
                    .build();
        } catch (Exception ex) {
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }

    @GetMapping("/getFoods/{restaurantId}")
    public ResponseEntity<ApiResponse> getFoods(@PathVariable String restaurantId) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "FoodController::getFoods");

        try {
            List<FoodDTO> foods = adminFacade.getFoods(restaurantId);

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
}
