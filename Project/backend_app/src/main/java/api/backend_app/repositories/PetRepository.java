package api.backend_app.repositories;

import api.backend_app.entities.Pet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PetRepository extends JpaRepository<Pet, String> {
    @Query("select p from Pet p join p.user u where u.username = :username")
    List<Pet> findByUsername(String username);
}
