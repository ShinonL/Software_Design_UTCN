package api.backend_app.repositories;

import api.backend_app.entities.Facility;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FacilityRepository extends JpaRepository<Facility, String> {
    Facility findByName(String name);
}
