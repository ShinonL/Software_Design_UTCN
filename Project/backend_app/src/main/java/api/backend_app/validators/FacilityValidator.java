package api.backend_app.validators;

import api.backend_app.common.exceptions.InvalidDataException;
import api.backend_app.dtos.FacilityDTO;
import api.backend_app.entities.Facility;
import api.backend_app.repositories.FacilityRepository;

public class FacilityValidator {
    public static void isFacilityValid(FacilityDTO facilityDTO, FacilityRepository facilityRepository) throws Exception {
        isValidName(facilityDTO.getName(), facilityRepository);
        isValidDescription(facilityDTO.getDescription());
        isValidPrice(facilityDTO.getPrice());
    }

    public static void isValidName(String name, FacilityRepository facilityRepository) throws InvalidDataException {
        if (name == null || name.isEmpty())
            throw new InvalidDataException("Please insert a name.");

        if (name.length() < 3)
            throw new InvalidDataException("Please insert a name with at least 3 characters.");

        Facility facility = facilityRepository.findByName(name);
        if (facility != null)
            throw new InvalidDataException("This facility name already exists.");
    }

    public static void isValidDescription(String description) throws InvalidDataException {
        if (description == null || description.isEmpty())
            throw new InvalidDataException("Please insert a description.");

        if (description.length() < 3)
            throw new InvalidDataException("Please insert a description with at least 3 characters.");
    }

    public static void isValidPrice(Double price) throws InvalidDataException {
        if (price == null)
            throw new InvalidDataException("Please insert a name.");

        if (price <= 0.0)
            throw new InvalidDataException("Please insert a positive number as a price.");
    }
}
