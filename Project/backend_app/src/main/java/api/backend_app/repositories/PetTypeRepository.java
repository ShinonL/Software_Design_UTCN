package api.backend_app.repositories;

import api.backend_app.entities.PetType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PetTypeRepository extends JpaRepository<PetType, String> {
    PetType findByType(String type);
}
