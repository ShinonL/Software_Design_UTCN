package sd.assignment.backend_app.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import sd.assignment.backend_app.entities.OrderDetails;

public interface OrderDetailsRepository extends JpaRepository<OrderDetails, String> {
}
