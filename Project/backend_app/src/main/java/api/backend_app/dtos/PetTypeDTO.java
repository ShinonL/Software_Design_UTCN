package api.backend_app.dtos;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class PetTypeDTO {
    private String id;
    private String type;
    private List<String> petIds;
    private List<HealthReferenceDTO> healthReferences;
}
