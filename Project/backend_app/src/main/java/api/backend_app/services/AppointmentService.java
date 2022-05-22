package api.backend_app.services;

import api.backend_app.common.mappers.AppointmentMapper;
import api.backend_app.common.mappers.FacilityMapper;
import api.backend_app.dtos.AppointmentDTO;
import api.backend_app.dtos.FacilityDTO;
import api.backend_app.entities.Appointment;
import api.backend_app.entities.Facility;
import api.backend_app.repositories.AppointmentRepository;
import api.backend_app.validators.AppointmentValidator;
import api.backend_app.validators.FacilityValidator;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;

/**
 * This Service deals with methods specific to the `appointment` entity
 */
@Slf4j
@Service
public class AppointmentService {
    /**
     * The appointment repository deals with running sql commands specific to the `appointment` table
     */
    @Autowired
    private AppointmentRepository appointmentRepository;
    /**
     * Used for logging the steps taken.
     */
    private final Logger logger = LoggerFactory.getLogger(AppointmentService.class);

    /**
     * Create a new appointment with the given details
     * @param appointmentDTO the details of the new facility
     * @throws Exception if any o the details are invalid or if it couldn't access the DB
     */
    public void createAppointment(AppointmentDTO appointmentDTO) throws Exception {
        logger.info("Validating the facility details");
        AppointmentValidator.isAppointmentValid(appointmentDTO);



        Appointment appointment = AppointmentMapper.convertToEntity(appointmentDTO, null);

        logger.info("Saving the facility details");
        appointmentRepository.save(appointment);
    }
}
