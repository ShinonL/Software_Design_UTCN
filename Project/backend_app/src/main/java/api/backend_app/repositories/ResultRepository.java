package api.backend_app.repositories;

import api.backend_app.entities.Result;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ResultRepository extends JpaRepository<Result, String> {
}
