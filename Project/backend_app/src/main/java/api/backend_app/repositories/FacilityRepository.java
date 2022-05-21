package api.backend_app.repositories;

import api.backend_app.entities.Facility;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FacilityRepository extends JpaRepository<Facility, String> {
    Facility findByName(String name);
}
