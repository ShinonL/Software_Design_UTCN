package sd.assignment.backend.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import sd.assignment.backend.entities.Cart;

public interface CartRepository extends JpaRepository<Cart, String> {
}
