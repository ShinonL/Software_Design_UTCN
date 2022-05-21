package api.backend_app.controllers;

import api.backend_app.dtos.FacilityDTO;
import api.backend_app.response.ApiResponse;
import api.backend_app.services.FacilityService;
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
@RequestMapping("/public")
public class PublicController {
    @Autowired
    private FacilityService facilityService;

    private final Logger logger = LoggerFactory.getLogger(PublicController.class);

    @GetMapping("/find-facilities")
    public ResponseEntity<ApiResponse> findFacilities() {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "EmployeeController::createFacility");

        try {
            logger.info("Retrieving all facilities.");
            List<FacilityDTO> facilityDTOS = facilityService.findFacilities();

            logger.info("Successfully retrieved all facilities");
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(),
                    "Successfully retrieved all facilities")
                    .withHttpHeader(httpHeaders)
                    .withData(facilityDTOS)
                    .build();

        } catch (Exception ex) {
            logger.info("Error retrieving all facilities");
            logger.error(ex.getMessage());
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }
}
