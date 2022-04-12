package sd.assignment.backend_app.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import sd.assignment.backend_app.entities.Cart;

public interface CartRepository extends JpaRepository<Cart, String> {
}
