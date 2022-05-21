package api.backend_app.dtos;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class HealthReferenceDTO {
    private String id;
    private String title;
    private String text;
    private String petTypeId;
}
