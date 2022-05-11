package sd.assignment.backend.services;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;
import sd.assignment.backend.common.mappers.FoodMapper;
import sd.assignment.backend.dtos.FoodDTO;
import sd.assignment.backend.entities.Food;
import sd.assignment.backend.entities.Restaurant;
import sd.assignment.backend.repositories.FoodRepository;
import sd.assignment.backend.repositories.RestaurantRepository;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import static org.mockito.Mockito.*;

@RunWith(MockitoJUnitRunner.class)
public class FoodServiceTest {
    @Mock
    private FoodService foodService;

    private FoodRepository foodRepository;
    private RestaurantRepository restaurantRepository;

    @Before
    public void setup() {
        foodService = new FoodService();
        foodRepository = mock(FoodRepository.class);
        restaurantRepository = mock(RestaurantRepository.class);
        foodService.setFoodRepository(foodRepository);
        foodService.setRestaurantRepository(restaurantRepository);
    }

    @Test
    public void createFood() {
        try {
            FoodDTO food = new FoodDTO();
            foodService.createFood(food);
            verify(foodRepository, times(1)).findByName(food.getName());
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }

//    @Test
//    public void getFoodsByRestaurantIdTest() {
//        ArrayList<Food> foods = new ArrayList<>();
//        foods.add(new Food());
//        foods.add(new Food());
//        foods.add(new Food());
//
//        Restaurant restaurant = new Restaurant();
//        restaurant.setId("2c9b05197ffaf796017ffaf8f7e40004");
//        when(restaurantRepository.save(restaurant)).thenReturn(restaurant);
//
//        when(foodRepository.findByRestaurantId("2c9b05197ffaf796017ffaf8f7e40004")).thenReturn(foods);
////        List<FoodDTO> repoFoods = foods.stream().map(FoodMapper::convertToDTO).collect(Collectors.toList());
////        List<Restaurant> restaurants = restaurantRepository.findAll();
//        try {
//            List<FoodDTO> foundFoods = foodService.getFoodsByRestaurant("2c9b05197ffaf796017ffaf8f7e40004");
//            List<Food> serviceFoods = foundFoods.stream()
//                    .map(food -> FoodMapper.convertToEntity(food, restaurantRepository)).collect(Collectors.toList());
//            Assert.assertEquals(foods, serviceFoods);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
}
