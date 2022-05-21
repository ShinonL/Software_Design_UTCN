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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("/employee")
public class EmployeeController {
    @Autowired
    private FacilityService facilityService;

    private final Logger logger = LoggerFactory.getLogger(EmployeeController.class);

    @PostMapping("/create-facility")
    public ResponseEntity<ApiResponse> createFacility(@RequestBody FacilityDTO facilityDTO) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "EmployeeController::createFacility");

        try {
            logger.info("Creating facility " + facilityDTO.getName());
            facilityService.createFacility(facilityDTO);

            logger.info("Successfully created restaurant " + facilityDTO.getName());
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(),
                    "Successfully added new restaurant " + facilityDTO.getName())
                    .withHttpHeader(httpHeaders)
                    .build();

        } catch (Exception ex) {
            logger.info("Error creating restaurant " + facilityDTO.getName());
            logger.error(ex.getMessage());
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }
}
