package sd.assignment.backend.controllers;

import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import sd.assignment.backend.dtos.ZoneDTO;
import sd.assignment.backend.response.ApiResponse;
import sd.assignment.backend.services.ZoneService;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/common")
public class CommonController {
    @Autowired
    private ZoneService zoneService;

    private final Logger logger = LoggerFactory.getLogger(CommonController.class);

    @GetMapping("/get-zones")
    public ResponseEntity<ApiResponse> getZones() {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "CustomerController::getZones");

        try {
            logger.info("Retrieving delivery zones");
            List<ZoneDTO> zones = zoneService.getZones();

            logger.info("Successfully retrievd delivery zones");
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully retrieved zones.")
                    .withHttpHeader(httpHeaders)
                    .withData(zones)
                    .build();

        } catch (Exception ex) {
            logger.error("Error retrieving delivery zones");
            logger.error(ex.getMessage());
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }
}
