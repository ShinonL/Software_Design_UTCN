package api.backend_app.services;

import api.backend_app.common.enums.AppointmentState;
import api.backend_app.common.exceptions.InvalidDataException;
import api.backend_app.common.exceptions.NotFoundException;
import api.backend_app.common.mappers.AppointmentMapper;
import api.backend_app.common.mappers.PetMapper;
import api.backend_app.dtos.AppointmentDTO;
import api.backend_app.dtos.PetDTO;
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

    /**
     * Retrieve all appointments for a specific user
     * @param username the username of the pet owner
     * @return a list with all appointments of that user
     * @throws Exception if there is any problem with the DB connection
     */
    public List<AppointmentDTO> findAppointmentByUsername(String username) throws Exception {
        logger.info("Retrieving all appointments for user " + username);
        return appointmentRepository.findByUsername(username)
                .stream()
                .map(AppointmentMapper::convertToDTO)
                .collect(Collectors.toList());
    }

    /**
     * Retrieve all appointments for a specific facility id
     * @param facilityId the id of the facility we are looking for
     * @return a list with all appointments of that facility
     * @throws Exception if there is any problem with the DB connection
     */
    public List<AppointmentDTO> findAppointmentByFacility(String facilityId) throws Exception {
        logger.info("Retrieving all appointments for facility " + facilityId);
        return appointmentRepository.findByFacility(facilityId)
                .stream()
                .map(AppointmentMapper::convertToDTO)
                .collect(Collectors.toList());
    }

    /**
     * Change the state of a given appointment
     * @param appointmentDTO the appointment whose state has to be changed
     * @return the appointment with a new state
     * @throws Exception if the appointment details are invalid or the DB couldn't be accessed
     */
    public AppointmentDTO changeAppointmentState(AppointmentDTO appointmentDTO) throws Exception {
        logger.info("Validating appointment details");
        Optional<Appointment> appointment = appointmentRepository.findById(appointmentDTO.getId());
        if (appointment.isEmpty()) {
            logger.error("Appointment " + appointmentDTO.getId() + "was not found");
            throw new NotFoundException("Appointment was not found.");
        }

        logger.info("Updating the state");
        Appointment updatedAppointment = appointment.get();
        updatedAppointment.setAppointmentState(
                getNextState(updatedAppointment.getAppointmentState(), appointmentDTO.isToDecline())
        );

        logger.info("Saving the new state");
        appointmentRepository.save(updatedAppointment);

        return AppointmentMapper.convertToDTO(updatedAppointment);
    }

    private AppointmentState getNextState(AppointmentState appointmentState, boolean decline) throws Exception {
        switch (appointmentState) {
            case PENDING:
                if (decline)
                    return AppointmentState.DECLINED;
                else return AppointmentState.CONFIRMED;
            case CONFIRMED: return AppointmentState.IN_PROGRESS;
            case IN_PROGRESS: return AppointmentState.FINISHED;
            default: throw new InvalidDataException("Cannot change this status.");
        }
    }
}
