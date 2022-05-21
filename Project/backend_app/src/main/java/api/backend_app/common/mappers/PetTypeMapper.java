package api.backend_app.common.mappers;

import api.backend_app.dtos.PetTypeDTO;
import api.backend_app.entities.HealthReference;
import api.backend_app.entities.Pet;
import api.backend_app.entities.PetType;

import java.util.List;
import java.util.stream.Collectors;

public class PetTypeMapper {
    public static PetType convertToEntity(PetTypeDTO petTypeDTO, List<Pet> pets, List<HealthReference> healthReferences) {
        PetType petType = new PetType();

        petType.setId(petTypeDTO.getId());
        petType.setType(petTypeDTO.getType());
        petType.setPets(pets);
        petType.setHealthReferences(healthReferences);

        return petType;
    }

    public static PetTypeDTO convertToDTO(PetType petType) {
        PetTypeDTO petTypeDTO = new PetTypeDTO();

        petTypeDTO.setId(petType.getId());
        petTypeDTO.setType(petType.getType());
        petTypeDTO.setPetIds(
                petType.getPets().stream()
                        .map(Pet::getId)
                        .collect(Collectors.toList())
        );
        petTypeDTO.setHealthReferences(
                petType.getHealthReferences().stream()
                        .map(HealthReferenceMapper::convertToDTO)
                        .collect(Collectors.toList())
        );

        return petTypeDTO;
    }
}
