package api.backend_app.services;

import api.backend_app.common.enums.AppointmentState;
import api.backend_app.common.exceptions.NotFoundException;
import api.backend_app.common.mappers.AppointmentMapper;
import api.backend_app.dtos.AppointmentDTO;
import api.backend_app.entities.Appointment;
import api.backend_app.entities.Facility;
import api.backend_app.entities.Pet;
import api.backend_app.repositories.AppointmentRepository;
import api.backend_app.repositories.FacilityRepository;
import api.backend_app.repositories.PetRepository;
import api.backend_app.validators.AppointmentValidator;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

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
     * The pet repository deals with running sql commands specific to the `pet` table
     */
    @Autowired
    private PetRepository petRepository;
    /**
     * The facility repository deals with running sql commands specific to the `facility` table
     */
    @Autowired
    private FacilityRepository facilityRepository;
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

        Optional<Pet> pet = petRepository.findById(appointmentDTO.getPetId());
        if (pet.isEmpty()) {
            logger.error("Pet " + appointmentDTO.getPetId() + " was not found");
            throw new NotFoundException("Pet " + appointmentDTO.getPetId() + " was not found");
        }

        List<Facility> facilities = appointmentDTO.getFacilities().stream()
                .map(f -> facilityRepository.findById(f.getId()).get())
                .collect(Collectors.toList());

        appointmentDTO.setAppointmentState(AppointmentState.PENDING);

        Appointment appointment = AppointmentMapper.convertToEntity(
                appointmentDTO, pet.get(), facilities, Collections.emptyList(), Collections.emptyList()
        );

        facilities.forEach(facility -> facility.addAppointment(appointment));

        logger.info("Saving the facility details");
        appointmentRepository.save(appointment);
    }
}
