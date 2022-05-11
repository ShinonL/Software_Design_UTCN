package sd.assignment.backend.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import sd.assignment.backend.entities.Food;
import sd.assignment.backend.entities.Restaurant;

import java.util.List;

public interface FoodRepository extends JpaRepository<Food, String> {
    Food findByName(String name);
    List<Food> findByRestaurant(Restaurant restaurant);
    @Query("select f from Food f join f.restaurant r where r.id = :restaurant")
    List<Food> findByRestaurantId(String restaurant);
}
