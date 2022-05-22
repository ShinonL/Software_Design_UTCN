package api.backend_app.controllers;

import api.backend_app.dtos.*;
import api.backend_app.response.ApiResponse;
import api.backend_app.services.AppointmentService;
import api.backend_app.services.FacilityService;
import api.backend_app.services.PetService;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/customer")
public class CustomerController {
    @Autowired
    private PetService petService;
    @Autowired
    private AppointmentService appointmentService;
    @Autowired
    private FacilityService facilityService;

    private final Logger logger = LoggerFactory.getLogger(CustomerController.class);

    @GetMapping("/find-pet/{username}")
    public ResponseEntity<ApiResponse> findPetByUsername(@PathVariable String username) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "CustomerController::findPetByUsername");

        try {
            logger.info("Retrieving all pets for user " + username);
            List<PetDTO> petDTOS = petService.findPetByUsername(username);

            logger.info("Successfully retrieved all pets for user " + username);
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(),
                    "Successfully retrieved all pets for user " + username)
                    .withHttpHeader(httpHeaders)
                    .withData(petDTOS)
                    .build();

        } catch (Exception ex) {
            logger.info("Error retrieving all pets for user " + username);
            logger.error(ex.getMessage());
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }

    @PostMapping("/create-appointment")
    public ResponseEntity<ApiResponse> createAppointment(@RequestBody AppointmentDTO appointmentDTO) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "CustomerController::createAppointment");

        try {
            logger.info("Creating appointment");
            appointmentService.createAppointment(appointmentDTO);

            logger.info("Successfully created appointment");
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(),
                    "Successfully created appointment")
                    .withHttpHeader(httpHeaders)
                    .build();

        } catch (Exception ex) {
            logger.info("Error creating appointment");
            logger.error(ex.getMessage());
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }

    @GetMapping("/find-appointments/{username}")
    public ResponseEntity<ApiResponse> findAppointmentByUsername(@PathVariable String username) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "CustomerController::findAppointmentByUsername");

        try {
            logger.info("Retrieving all appointments for user " + username);
            List<AppointmentDTO> appointmentDTOS = appointmentService.findAppointmentByUsername(username);

            logger.info("Successfully retrieved all appointments for user " + username);
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(),
                    "Successfully retrieved all appointments for user " + username)
                    .withHttpHeader(httpHeaders)
                    .withData(appointmentDTOS)
                    .build();

        } catch (Exception ex) {
            logger.info("Error retrieving all appointments for user " + username);
            logger.error(ex.getMessage());
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }

    @PostMapping("/add-review")
    public ResponseEntity<ApiResponse> addReviewToFacility(@RequestBody ReviewDTO reviewDTO) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "CustomerController::addReviewToFacility");

        try {
            logger.info("Adding review for facility " + reviewDTO.getFacilityId());
            facilityService.addReviewToFacility(reviewDTO);

            logger.info("Successfully added review for facility " + reviewDTO.getFacilityId());
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully added review.")
                    .withHttpHeader(httpHeaders)
                    .build();

        } catch (Exception ex) {
            logger.error("Error adding review for facility " + reviewDTO.getFacilityId());
            logger.error(ex.getMessage());
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }
}
