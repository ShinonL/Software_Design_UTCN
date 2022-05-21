package api.backend_app.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import api.backend_app.entities.User;

@Repository
public interface UserRepository extends JpaRepository<User, String> {
    User findByUsername(String username);
}
