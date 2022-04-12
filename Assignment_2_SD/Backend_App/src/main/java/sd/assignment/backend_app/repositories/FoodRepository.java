package sd.assignment.backend_app.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import sd.assignment.backend_app.entities.Food;
import sd.assignment.backend_app.entities.Restaurant;

import java.util.List;

public interface FoodRepository extends JpaRepository<Food, String> {
    Food findByName(String name);
    List<Food> findByRestaurant(Restaurant restaurant);
}
