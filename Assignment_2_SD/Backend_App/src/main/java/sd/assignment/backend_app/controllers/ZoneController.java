package sd.assignment.backend_app.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import sd.assignment.backend_app.dtos.RestaurantDTO;
import sd.assignment.backend_app.dtos.ZoneDTO;
import sd.assignment.backend_app.response.ApiResponse;
import sd.assignment.backend_app.services.CustomerFacade;

import java.util.List;

@RestController
@RequestMapping("/zone")
public class ZoneController {
    @Autowired
    private CustomerFacade customerFacade;

    @GetMapping("/getAll")
    public ResponseEntity<ApiResponse> getAll() {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "ZoneController::getAll");

        try {
            List<ZoneDTO> zones = customerFacade.getAllZones();

            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully retrieved zones.")
                    .withHttpHeader(httpHeaders)
                    .withData(zones)
                    .build();

        } catch (Exception ex) {
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }
}
