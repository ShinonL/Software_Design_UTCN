package api.backend_app.dtos;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ResultDTO {
    private String id;
    private String observation;
    private String details;
    private String appointmentId;
}
