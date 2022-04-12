package sd.assignment.backend_app.validators;

import sd.assignment.backend_app.common.exceptions.InvalidDataException;
import sd.assignment.backend_app.dtos.FoodDTO;

public class FoodValidator {
    public static void isFoodValid(FoodDTO foodDTO) throws Exception {
        isValidName(foodDTO.getName());
        isValidPrice(foodDTO.getPrice());
    }

    public static void isValidName(String name) throws InvalidDataException {
        if (name == null || name.isEmpty())
            throw new InvalidDataException("Please insert a name.");

        if (name.length() < 3)
            throw new InvalidDataException("Please insert a name with at least 3 characters.");
    }

    public static void isValidPrice(Double price) throws InvalidDataException {
        if (price == null)
            throw new InvalidDataException("Please insert a name.");

        if (price <= 0.0)
            throw new InvalidDataException("Please insert a positive number as a price.");
    }
}
