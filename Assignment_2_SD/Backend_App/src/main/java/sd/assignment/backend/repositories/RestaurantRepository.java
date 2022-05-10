package sd.assignment.backend.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import sd.assignment.backend.entities.Restaurant;

import java.util.List;

public interface RestaurantRepository extends JpaRepository<Restaurant, String> {
    Restaurant findByName(String name);
    Restaurant findByLocation(String location);
    @Query("select r from Restaurant r join r.zones z where z.id = :zoneId")
    List<Restaurant> findByZoneId(String zoneId);
    List<Restaurant> findByNameContains(String restaurantName);
    @Query("select r from Restaurant r join r.zones z where z.id = :zoneId and r.name like %:restaurantName%")
    List<Restaurant> findByNameAndZone(String restaurantName, String zoneId);
    @Query("select r from Restaurant r join r.admin a join a.user u where u.username = :username")
    List<Restaurant> findByUsername(String username);
}
