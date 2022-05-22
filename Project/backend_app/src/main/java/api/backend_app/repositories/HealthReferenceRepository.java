package api.backend_app.repositories;

import api.backend_app.entities.HealthReference;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HealthReferenceRepository extends JpaRepository<HealthReference, String> {
    @Query("select hr from HealthReference hr join hr.petType pt where pt.id = :petTypeId")
    List<HealthReference> findByPetType(String petTypeId);
}
