package api.backend_app.repositories;

import api.backend_app.entities.HealthReference;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface HealthReferenceRepository extends JpaRepository<HealthReference, String> {
}
