package sd.assignment.backend_app.validators;

import sd.assignment.backend_app.common.exceptions.InvalidDataException;
import sd.assignment.backend_app.dtos.RestaurantDTO;
import sd.assignment.backend_app.entities.Restaurant;
import sd.assignment.backend_app.repositories.RestaurantRepository;

public class RestaurantValidator {
    public static void isRestaurantValid(RestaurantDTO restaurantDTO, RestaurantRepository restaurantRepository) throws Exception {
        isValidName(restaurantDTO.getName(), restaurantRepository);
        isValidLocation(restaurantDTO.getLocation(), restaurantRepository);
    }

    public static void isValidName(String name, RestaurantRepository restaurantRepository) throws InvalidDataException {
        if (name == null || name.isEmpty())
            throw new InvalidDataException("Please insert a name.");

        if (name.length() < 3)
            throw new InvalidDataException("Please insert a name with at least 3 characters.");

        Restaurant restaurant = restaurantRepository.findByName(name);
        if (restaurant != null)
            throw new InvalidDataException("This restaurant name already exists.");
    }

    public static void isValidLocation(String location, RestaurantRepository restaurantRepository) throws InvalidDataException {
        if (location == null || location.isEmpty())
            throw new InvalidDataException("Please insert a location.");

        if (location.length() < 3)
            throw new InvalidDataException("Please insert a location with at least 3 characters.");

        Restaurant restaurant = restaurantRepository.findByLocation(location);
        if (restaurant != null)
            throw new InvalidDataException("Location already exists.");
    }
}
