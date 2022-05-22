package api.backend_app.controllers;

import api.backend_app.dtos.AppointmentDTO;
import api.backend_app.dtos.FacilityDTO;
import api.backend_app.dtos.ResultDTO;
import api.backend_app.response.ApiResponse;
import api.backend_app.services.AppointmentService;
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
@RequestMapping("/employee")
public class EmployeeController {
    @Autowired
    private FacilityService facilityService;
    @Autowired
    private AppointmentService appointmentService;

    private final Logger logger = LoggerFactory.getLogger(EmployeeController.class);

    @PostMapping("/create-facility")
    public ResponseEntity<ApiResponse> createFacility(@RequestBody FacilityDTO facilityDTO) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "EmployeeController::createFacility");

        try {
            logger.info("Creating facility " + facilityDTO.getName());
            facilityService.createFacility(facilityDTO);

            logger.info("Successfully created facility " + facilityDTO.getName());
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(),
                    "Successfully added new facility " + facilityDTO.getName())
                    .withHttpHeader(httpHeaders)
                    .build();

        } catch (Exception ex) {
            logger.info("Error creating facility " + facilityDTO.getName());
            logger.error(ex.getMessage());
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }

    @GetMapping("/find-appointments/{facilityId}")
    public ResponseEntity<ApiResponse> findAppointmentByFacility(@PathVariable String facilityId) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "CustomerController::findAppointmentByFacility");

        try {
            logger.info("Retrieving all appointments for facilityId " + facilityId);
            List<AppointmentDTO> appointmentDTOS = appointmentService.findAppointmentByFacility(facilityId);

            logger.info("Successfully retrieved all appointments for facilityId " + facilityId);
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(),
                    "Successfully retrieved all appointments for facilityId " + facilityId)
                    .withHttpHeader(httpHeaders)
                    .withData(appointmentDTOS)
                    .build();

        } catch (Exception ex) {
            logger.info("Error retrieving all appointments for facilityId " + facilityId);
            logger.error(ex.getMessage());
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }

    @PostMapping("/change-appointment-state")
    public ResponseEntity<ApiResponse> changeAppointmentState(@RequestBody AppointmentDTO appointmentDTO) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "EmployeeController::changeAppointmentState");

        try {
            logger.info("Changing state for appointment " + appointmentDTO.getId());
            AppointmentDTO appointment = appointmentService.changeAppointmentState(appointmentDTO);

            logger.info("Successfully changed state for appointment " + appointmentDTO.getId());
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully changed state.")
                    .withHttpHeader(httpHeaders)
                    .withData(appointment)
                    .build();

        } catch (Exception ex) {
            logger.error("Error changing status for appointment " + appointmentDTO.getId());
            logger.error(ex.getMessage());
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }

    @PostMapping("/add-result")
    public ResponseEntity<ApiResponse> addResultToAppointment(@RequestBody ResultDTO resultDTO) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "EmployeeController::addResultToAppointment");

        try {
            logger.info("Adding result for appointment " + resultDTO.getAppointmentId());
            appointmentService.addResultToAppointment(resultDTO);

            logger.info("Successfully added result for appointment " + resultDTO.getAppointmentId());
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully added result.")
                    .withHttpHeader(httpHeaders)
                    .build();

        } catch (Exception ex) {
            logger.error("Error adding result for appointment " + resultDTO.getAppointmentId());
            logger.error(ex.getMessage());
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }
}
