package sd.assignment.backend_app.services;

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

@Service
public class FoodService {
    @Autowired
    private FoodRepository foodRepository;
    @Autowired
    private RestaurantRepository restaurantRepository;

    public void createFood(FoodDTO foodDTO) throws Exception {
        FoodValidator.isFoodValid(foodDTO);

        Restaurant restaurant = restaurantRepository.findByName(foodDTO.getRestaurantName());
        if (restaurant == null)
            throw new NotFoundException("Restaurant " + foodDTO.getRestaurantName() + " was not found.");

        foodDTO.setRestaurantName(restaurant.getName());
        foodRepository.save(FoodMapper.convertToEntity(foodDTO, restaurantRepository));
    }

    public List<FoodDTO> getFoodsByRestaurant(String restaurantId) throws Exception {
        Optional<Restaurant> restaurant = restaurantRepository.findById(restaurantId);
        if (restaurant.isEmpty())
            throw new NotFoundException("Restaurant was not found.");

        return foodRepository.findByRestaurant(restaurant.get())
                .stream()
                .map(FoodMapper::convertToDTO)
                .collect(Collectors.toList());
    }
}
