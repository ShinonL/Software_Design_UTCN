package sd.assignment_1_sd.repository;

import sd.assignment_1_sd.entity.Destination;

import java.util.List;

public class DestinationRepository extends GenericRepository<Destination, String> {
    public DestinationRepository() {
        super(Destination.class);
    }

    public Destination findByName(String name) {
        List<Destination> destination = findByString("name", name);
        return destination.isEmpty() ? null : destination.get(0);
    }
}
