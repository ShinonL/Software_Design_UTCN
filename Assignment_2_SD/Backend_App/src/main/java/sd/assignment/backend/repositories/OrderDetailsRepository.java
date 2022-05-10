package sd.assignment.backend.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import sd.assignment.backend.entities.OrderDetails;

public interface OrderDetailsRepository extends JpaRepository<OrderDetails, String> {
}
