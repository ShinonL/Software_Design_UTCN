package api.backend_app.common.mappers;

import api.backend_app.dtos.AppointmentDTO;
import api.backend_app.entities.Appointment;

import java.util.stream.Collectors;

public class AppointmentMapper {
    public static Appointment convertToEntity(AppointmentDTO appointmentDTO) {
        Appointment appointment = new Appointment();

        appointment.setId(appointmentDTO.getId());
        appointment.setAppointmentState(appointmentDTO.getAppointmentState());
        appointment.setDateTime(appointmentDTO.getDateTime());
        appointment.setFacilities(appointmentDTO.getFacilities());
        appointment.setPet(appointmentDTO.getPet());
        appointment.setResults(appointmentDTO.getResults());
        appointment.setReviews(appointmentDTO.getReviews());

        return appointment;
    }

    public static AppointmentDTO convertToDTO(Appointment appointment) {
        AppointmentDTO appointmentDTO = new AppointmentDTO();

        appointmentDTO.setId(appointment.getId());
        appointmentDTO.setAppointmentState(appointment.getAppointmentState());
        appointmentDTO.setDateTime(appointment.getDateTime());
        appointmentDTO.setFacilities(appointment.getFacilities());
        appointmentDTO.setPet(appointment.getPet());
        appointmentDTO.setResults(appointment.getResults());
        appointmentDTO.setReviews(appointment.getReviews());

        return appointmentDTO;
    }
}
