package api.backend_app.common.mappers;

import api.backend_app.dtos.FacilityDTO;
import api.backend_app.entities.Appointment;
import api.backend_app.entities.Facility;
import api.backend_app.entities.Review;

import java.util.List;
import java.util.stream.Collectors;

public class FacilityMapper {
    public static Facility convertToEntity(
            FacilityDTO facilityDTO,
            List<Appointment> appointments,
            List<Review> reviews
    ) {
        Facility facility = new Facility();

        facility.setId(facilityDTO.getId());
        facility.setName(facilityDTO.getName());
        facility.setDescription(facilityDTO.getDescription());
        facility.setPrice(facilityDTO.getPrice());
        facility.setScore(facilityDTO.getScore() == null ? 0 : facilityDTO.getScore());
        facility.setNoAppointments(facilityDTO.getNoAppointments());
        facility.setAppointments(appointments);
        facility.setReviews(reviews);

        return facility;
    }

    public static FacilityDTO convertToDTO(Facility facility) {
        FacilityDTO facilityDTO = new FacilityDTO();

        facilityDTO.setId(facility.getId());
        facilityDTO.setName(facility.getName());
        facilityDTO.setDescription(facility.getDescription());
        facilityDTO.setPrice(facility.getPrice());
        facilityDTO.setScore(facility.getScore());
        facilityDTO.setNoAppointments(facility.getNoAppointments());
        facilityDTO.setAppointmentIds(
                facility.getAppointments().stream()
                        .map(Appointment::getId).collect(Collectors.toList())
        );
        facilityDTO.setReviews(
                facility.getReviews().stream()
                        .map(ReviewMapper::convertToDTO)
                        .collect(Collectors.toList())
        );

        return facilityDTO;
    }
}
