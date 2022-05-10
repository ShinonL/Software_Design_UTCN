package sd.assignment.backend.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import sd.assignment.backend.entities.Admin;

public interface AdminRepository extends JpaRepository<Admin, String> {
    @Query("SELECT a FROM Admin a JOIN a.user u WHERE u.username = :username")
    Admin findByUsername(String username);
}
