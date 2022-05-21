package api.backend_app.common.mappers;

import api.backend_app.dtos.AppointmentDTO;
import api.backend_app.dtos.HealthReferenceDTO;
import api.backend_app.entities.Appointment;
import api.backend_app.entities.HealthReference;
import api.backend_app.entities.PetType;

public class HealthReferenceMapper {
    public static HealthReference convertToEntity(HealthReferenceDTO healthReferenceDTO, PetType petType) {
        HealthReference healthReference = new HealthReference();

        healthReference.setId(healthReferenceDTO.getId());
        healthReference.setPetType(petType);
        healthReference.setTitle(healthReferenceDTO.getTitle());
        healthReference.setText(healthReferenceDTO.getText());

        return healthReference;
    }

    public static HealthReferenceDTO convertToDTO(HealthReference healthReference) {
        HealthReferenceDTO healthReferenceDTO = new HealthReferenceDTO();

        healthReferenceDTO.setId(healthReference.getId());
        healthReferenceDTO.setPetTypeId(healthReference.getPetType().getId());
        healthReferenceDTO.setText(healthReference.getText());
        healthReferenceDTO.setTitle(healthReference.getTitle());

        return healthReferenceDTO;
    }
}
