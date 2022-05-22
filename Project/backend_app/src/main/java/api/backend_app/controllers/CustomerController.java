package api.backend_app.controllers;

import api.backend_app.dtos.FacilityDTO;
import api.backend_app.dtos.PetDTO;
import api.backend_app.dtos.PetTypeDTO;
import api.backend_app.response.ApiResponse;
import api.backend_app.services.AppointmentService;
import api.backend_app.services.PetService;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/customer")
public class CustomerController {
    @Autowired
    private PetService petService;

    private final Logger logger = LoggerFactory.getLogger(CustomerController.class);

    @GetMapping("/find-pet/{username}")
    public ResponseEntity<ApiResponse> findPetByUsername(@PathVariable String username) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "CustomerController::findPetByUsername");

        try {
            logger.info("Retrieving all pets for user " + username);
            List<PetDTO> petDTOS = petService.findPetByUsername(username);

            logger.info("Successfully retrieved all pet for user " + username);
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(),
                    "Successfully retrieved all pet for user " + username)
                    .withHttpHeader(httpHeaders)
                    .withData(petDTOS)
                    .build();

        } catch (Exception ex) {
            logger.info("Error retrieving all pet for user " + username);
            logger.error(ex.getMessage());
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }
}
