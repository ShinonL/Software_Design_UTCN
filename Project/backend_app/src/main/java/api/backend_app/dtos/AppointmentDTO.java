package api.backend_app.dtos;

import api.backend_app.common.enums.AppointmentState;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.List;

@Getter
@Setter
public class AppointmentDTO {
    private String id;
    private LocalDateTime dateTime;
    private AppointmentState appointmentState;
    private String petId;
    private List<FacilityDTO> facilities;
    private List<ResultDTO> results;
    private List<ReviewDTO> reviews;
    private boolean toDecline;
}
