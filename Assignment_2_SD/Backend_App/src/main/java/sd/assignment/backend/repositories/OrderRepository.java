package sd.assignment.backend.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import sd.assignment.backend.common.enums.OrderState;
import sd.assignment.backend.entities.Order;
import sd.assignment.backend.entities.User;

import java.util.List;

public interface OrderRepository extends JpaRepository<Order, String> {
    List<Order> findByUser(User user);
    @Query("select o from Order o join o.orderDetails od join od.food f where f.restaurant.id = :restaurant")
    List<Order> findByRestaurant(String restaurant);
    @Query("select o from Order o join o.orderDetails od join od.food f where f.restaurant.id = :restaurant and o.orderState = :orderState")
    List<Order> findByOrderStateAndRestaurantId(OrderState orderState, String restaurant);
}
