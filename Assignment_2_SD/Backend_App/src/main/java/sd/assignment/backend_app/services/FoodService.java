package sd.assignment.backend_app.services;

import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sd.assignment.backend_app.common.exceptions.NotFoundException;
import sd.assignment.backend_app.common.mappers.FoodMapper;
import sd.assignment.backend_app.dtos.FoodDTO;
import sd.assignment.backend_app.entities.Restaurant;
import sd.assignment.backend_app.repositories.FoodRepository;
import sd.assignment.backend_app.repositories.RestaurantRepository;
import sd.assignment.backend_app.validators.FoodValidator;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Slf4j
@Service
public class FoodService {
    @Autowired
    private FoodRepository foodRepository;
    @Autowired
    private RestaurantRepository restaurantRepository;

    private final Logger logger = LoggerFactory.getLogger(FoodService.class);

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
