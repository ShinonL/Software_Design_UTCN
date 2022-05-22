package api.backend_app.dtos;

import api.backend_app.common.enums.AppointmentState;
import api.backend_app.entities.Facility;
import api.backend_app.entities.Pet;
import api.backend_app.entities.Result;
import api.backend_app.entities.Review;
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
    private List<Facility> facilities;
    private List<Result> results;
    private List<Review> reviews;
}
