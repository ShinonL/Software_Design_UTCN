package api.backend_app.controllers;

import api.backend_app.dtos.FacilityDTO;
import api.backend_app.dtos.HealthReferenceDTO;
import api.backend_app.dtos.PetTypeDTO;
import api.backend_app.response.ApiResponse;
import api.backend_app.services.FacilityService;
import api.backend_app.services.HealthReferenceService;
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
@RequestMapping("/public")
public class PublicController {
    @Autowired
    private FacilityService facilityService;
    @Autowired
    private PetService petService;
    @Autowired
    private HealthReferenceService healthReferenceService;

    private final Logger logger = LoggerFactory.getLogger(PublicController.class);

    @GetMapping("/find-facilities")
    public ResponseEntity<ApiResponse> findFacilities() {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "PublicController::findFacilities");

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

    @GetMapping("/find-pet-types")
    public ResponseEntity<ApiResponse> findPetTypes() {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "PublicController::findPetTypes");

        try {
            logger.info("Retrieving all pet types.");
            List<PetTypeDTO> petTypeDTOS = petService.findPetTypes();

            logger.info("Successfully retrieved all pet types");
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(),
                    "Successfully retrieved all pet types")
                    .withHttpHeader(httpHeaders)
                    .withData(petTypeDTOS)
                    .build();

        } catch (Exception ex) {
            logger.info("Error retrieving all pet types");
            logger.error(ex.getMessage());
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }

    @GetMapping("/find-health-references/{petTypeId}")
    public ResponseEntity<ApiResponse> findHealthReferencesByPetType(@PathVariable String petTypeId) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "PublicController::findHealthReferencesByPetType");

        try {
            logger.info("Retrieving all health references for a specific pet type.");
            List<HealthReferenceDTO> healthReferenceDTOS = healthReferenceService.findHealthReferencesByPetType(petTypeId);

            logger.info("Successfully retrieved all health references for a specific pet type.");
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(),
                    "Successfully retrieved all health references for a specific pet type.")
                    .withHttpHeader(httpHeaders)
                    .withData(healthReferenceDTOS)
                    .build();

        } catch (Exception ex) {
            logger.info("Error retrieving all health references for a specific pet type.");
            logger.error(ex.getMessage());
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }
}
