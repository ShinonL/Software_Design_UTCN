package api.backend_app.controllers;

import api.backend_app.dtos.PetTypeDTO;
import api.backend_app.response.ApiResponse;
import api.backend_app.services.PetService;
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
@RequestMapping("/common")
public class CommonController {
    @Autowired
    private PetService petService;

    private final Logger logger = LoggerFactory.getLogger(CustomerController.class);

    @PostMapping("/create-pet-type")
    public ResponseEntity<ApiResponse> createPetType(@RequestBody PetTypeDTO petTypeDTO) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "CommonController::createPetType");

        try {
            logger.info("Creating pet type " + petTypeDTO.getType());
            petService.createPetType(petTypeDTO);

            logger.info("Successfully created pet type " + petTypeDTO.getType());
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(),
                    "Successfully added pet type " + petTypeDTO.getType())
                    .withHttpHeader(httpHeaders)
                    .build();

        } catch (Exception ex) {
            logger.info("Error creating pet type " + petTypeDTO.getType());
            logger.error(ex.getMessage());
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }
}
