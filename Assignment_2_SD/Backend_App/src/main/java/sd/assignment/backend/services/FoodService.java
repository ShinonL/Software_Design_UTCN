package sd.assignment.backend.services;

import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sd.assignment.backend.common.exceptions.NotFoundException;
import sd.assignment.backend.common.mappers.FoodMapper;
import sd.assignment.backend.dtos.FoodDTO;
import sd.assignment.backend.entities.Restaurant;
import sd.assignment.backend.repositories.FoodRepository;
import sd.assignment.backend.repositories.RestaurantRepository;
import sd.assignment.backend.validators.FoodValidator;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * This Service deals with methods specific to the `food` entity
 */
@Slf4j
@Service
public class FoodService {
    /**
     * The food repository deals with running sql commands specific to the `food` table
     */
    @Autowired
    private FoodRepository foodRepository;

    /**
     * The restaurant repository deals with running sql commands specific to the `restaurant` table
     */
    @Autowired
    private RestaurantRepository restaurantRepository;

    /**
     * Used for logging the steps taken.
     */
    private final Logger logger = LoggerFactory.getLogger(FoodService.class);

    /**
     * Validate and create a food item for a specific restaurant
     * @param foodDTO Contains details about the food and its restaurant
     * @throws Exception if the details are invalid or the save couln't be done
     */
    public void createFood(FoodDTO foodDTO) throws Exception {
        logger.info("Validating food details for " + foodDTO.getName());
        FoodValidator.isFoodValid(foodDTO);

        logger.info("Validating restaurant " + foodDTO.getRestaurantName());
        Restaurant restaurant = restaurantRepository.findByName(foodDTO.getRestaurantName());
        if (restaurant == null) {
            logger.error("Restaurant " + foodDTO.getRestaurantName() + " was not found.");
            throw new NotFoundException("Restaurant " + foodDTO.getRestaurantName() + " was not found.");
        }

        logger.info("Saving the food");
        foodDTO.setRestaurantName(restaurant.getName());
        foodRepository.save(FoodMapper.convertToEntity(foodDTO, restaurantRepository));
    }

    /**
     * Retrieved the foods for a specific restaurant
     * @param restaurantId The DB id of a specific restaurant
     * @return The foods that are associated with the given restaurant id
     * @throws Exception if the restaurant does not exist or if the foods couldn't be accessed
     */
    public List<FoodDTO> getFoodsByRestaurant(String restaurantId) throws Exception {
        logger.info("Validating restaurant " + restaurantId);
        Optional<Restaurant> restaurant = restaurantRepository.findById(restaurantId);
        if (restaurant.isEmpty()) {
            logger.error("Restaurant " + restaurantId + " was not found.");
            throw new NotFoundException("Restaurant was not found.");
        }

        logger.info("Retrieving foods for " + restaurantId);
        return foodRepository.findByRestaurant(restaurant.get())
                .stream()
                .map(FoodMapper::convertToDTO)
                .collect(Collectors.toList());
    }
}
