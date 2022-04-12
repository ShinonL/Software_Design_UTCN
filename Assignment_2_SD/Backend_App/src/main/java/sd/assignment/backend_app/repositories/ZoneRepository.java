package sd.assignment.backend_app.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import sd.assignment.backend_app.entities.Zone;

public interface ZoneRepository extends JpaRepository<Zone, String> {
    Zone findByNameAndCity(String name, String city);
}
