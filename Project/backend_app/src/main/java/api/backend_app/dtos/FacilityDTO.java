package api.backend_app.dtos;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class FacilityDTO {
    private String id;
    private String name;
    private String description;
    private Double price;
    private Double score;
    private int noAppointments;
    private List<String> appointmentIds;
    private List<ReviewDTO> reviews;
}
