package sd.assignment.backend.validators;

import sd.assignment.backend.common.exceptions.InvalidDataException;
import sd.assignment.backend.common.exceptions.NotFoundException;
import sd.assignment.backend.dtos.OrderDTO;
import sd.assignment.backend.dtos.ZoneDTO;
import sd.assignment.backend.entities.Zone;
import sd.assignment.backend.repositories.ZoneRepository;

import java.util.Optional;

public class OrderValidator {
    public static void isOrderValid(
            OrderDTO orderDTO,
            ZoneRepository zoneRepository
    ) throws Exception {
        isValidUsername(orderDTO.getUsername());
        isValidLocation(orderDTO.getLocation());
        isValidZone(orderDTO.getZoneDTO(), zoneRepository);
    }

    public static void isValidUsername(String username) throws Exception {
        if (username == null || username.isEmpty())
            throw new InvalidDataException("Please insert a user for the order.");
    }

    public static void isValidLocation(String location) throws Exception {
        if (location == null || location.isEmpty())
            throw new InvalidDataException("Please insert a delivery address for the order.");
    }

    public static void isValidZone(ZoneDTO zoneDTO, ZoneRepository zoneRepository) throws Exception {
        Optional<Zone> zone = zoneRepository.findById(zoneDTO.getId());
        if (zone.isEmpty())
            throw new NotFoundException("Zone was not found.");
    }
}
