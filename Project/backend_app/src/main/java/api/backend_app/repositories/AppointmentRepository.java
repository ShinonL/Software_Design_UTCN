package api.backend_app.repositories;

import api.backend_app.entities.Appointment;
import api.backend_app.entities.Pet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AppointmentRepository extends JpaRepository<Appointment, String> {
    @Query("select a from Appointment a join a.pet.user u where u.username = :username")
    List<Appointment> findByUsername(String username);
    @Query("select a from Appointment a join a.facilities f where f.id = :facilityId")
    List<Appointment> findByFacility(String facilityId);
}