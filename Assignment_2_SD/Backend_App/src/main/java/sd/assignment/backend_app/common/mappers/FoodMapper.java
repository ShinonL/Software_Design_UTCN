package sd.assignment.backend_app.common.mappers;

import sd.assignment.backend_app.dtos.FoodDTO;
import sd.assignment.backend_app.entities.Food;
import sd.assignment.backend_app.repositories.RestaurantRepository;

public class FoodMapper {
    public static Food convertToEntity(FoodDTO foodDTO, RestaurantRepository restaurantRepository) {
        Food food = new Food();

        food.setId(foodDTO.getId());
        food.setName(foodDTO.getName());
        food.setDescription(foodDTO.getDescription());
        food.setPrice(foodDTO.getPrice());
        food.setCategory(foodDTO.getCategory());
        food.setRestaurant(restaurantRepository.findByName(foodDTO.getRestaurantName()));

        return food;
    }

    public static FoodDTO convertToDTO(Food food) {
        FoodDTO foodDTO = new FoodDTO();

        foodDTO.setId(food.getId());
        foodDTO.setName(food.getName());
        foodDTO.setDescription(food.getDescription());
        foodDTO.setPrice(food.getPrice());
        foodDTO.setCategory(food.getCategory());
        foodDTO.setRestaurantName(food.getRestaurant().getName());

        return foodDTO;
    }
}
