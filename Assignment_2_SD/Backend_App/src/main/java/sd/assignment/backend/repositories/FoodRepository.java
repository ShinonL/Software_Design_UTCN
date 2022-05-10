package sd.assignment.backend.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import sd.assignment.backend.entities.Food;
import sd.assignment.backend.entities.Restaurant;

import java.util.List;

public interface FoodRepository extends JpaRepository<Food, String> {
    Food findByName(String name);
    List<Food> findByRestaurant(Restaurant restaurant);
}
