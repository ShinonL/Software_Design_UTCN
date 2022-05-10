package sd.assignment.backend.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import sd.assignment.backend.entities.Zone;

public interface ZoneRepository extends JpaRepository<Zone, String> {
    Zone findByNameAndCity(String name, String city);
}
