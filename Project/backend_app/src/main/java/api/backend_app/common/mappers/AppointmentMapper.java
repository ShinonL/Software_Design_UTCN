package api.backend_app.common.mappers;

import api.backend_app.dtos.AppointmentDTO;
import api.backend_app.entities.*;

import java.util.List;
import java.util.stream.Collectors;

public class AppointmentMapper {
    public static Appointment convertToEntity(
            AppointmentDTO appointmentDTO,
            Pet pet,
            List<Facility> facilities,
            List<Result> results,
            List<Review> reviews
    ) {
        Appointment appointment = new Appointment();

        appointment.setId(appointmentDTO.getId());
        appointment.setAppointmentState(appointmentDTO.getAppointmentState());
        appointment.setDateTime(appointmentDTO.getDateTime());
        appointment.setFacilities(facilities);
        appointment.setPet(pet);
        appointment.setResults(results);
        appointment.setReviews(reviews);

        return appointment;
    }

    public static AppointmentDTO convertToDTO(Appointment appointment) {
        AppointmentDTO appointmentDTO = new AppointmentDTO();

        appointmentDTO.setId(appointment.getId());
        appointmentDTO.setAppointmentState(appointment.getAppointmentState());
        appointmentDTO.setDateTime(appointment.getDateTime());
        appointmentDTO.setFacilities(
                appointment.getFacilities().stream()
                        .map(FacilityMapper::convertToDTO)
                        .collect(Collectors.toList())
        );
        appointmentDTO.setPetId(appointment.getPet().getId());
        appointmentDTO.setResults(
                appointment.getResults().stream()
                        .map(ResultMapper::convertToDTO)
                        .collect(Collectors.toList())
        );
        appointmentDTO.setReviews(
                appointment.getReviews().stream()
                        .map(ReviewMapper::convertToDTO)
                        .collect(Collectors.toList())
        );

        return appointmentDTO;
    }
}
