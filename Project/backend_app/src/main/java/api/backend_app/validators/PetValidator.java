package api.backend_app.validators;

import api.backend_app.common.exceptions.InvalidDataException;
import api.backend_app.dtos.PetDTO;
import api.backend_app.dtos.PetTypeDTO;
import api.backend_app.entities.PetType;
import api.backend_app.repositories.PetTypeRepository;

public class PetValidator {
    public static void isPetTypeValid(PetTypeDTO petTypeDTO, PetTypeRepository petTypeRepository) throws Exception {
        if (petTypeDTO.getType() == null || petTypeDTO.getType().isEmpty())
            throw new InvalidDataException("Please insert a type name.");

        if (petTypeDTO.getType().length() < 3)
            throw new InvalidDataException("Please insert a type with at least 3 characters.");

        PetType petType = petTypeRepository.findByType(petTypeDTO.getType());
        if (petType != null)
            throw new InvalidDataException("This pet type already exists.");
    }

    public static void isPetValid(PetDTO petDTO) throws Exception {
        isValidName(petDTO.getName());
        isValidAge(petDTO.getAge());
    }

    public static void isValidName(String name) throws InvalidDataException {
        if (name == null || name.isEmpty())
            throw new InvalidDataException("Please insert a name.");

        if (name.length() < 3)
            throw new InvalidDataException("Please insert a name with at least 3 characters.");
    }

    public static void isValidAge(int age) throws InvalidDataException {
        if (age <= 0)
            throw new InvalidDataException("Please insert a positive number as an age.");
    }
}
