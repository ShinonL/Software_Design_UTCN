package sd.assignment.backend_app.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sd.assignment.backend_app.common.exceptions.NotFoundException;
import sd.assignment.backend_app.common.mappers.RestaurantMapper;
import sd.assignment.backend_app.entities.Admin;
import sd.assignment.backend_app.entities.Restaurant;
import sd.assignment.backend_app.dtos.RestaurantDTO;
import sd.assignment.backend_app.entities.Zone;
import sd.assignment.backend_app.repositories.AdminRepository;
import sd.assignment.backend_app.repositories.RestaurantRepository;
import sd.assignment.backend_app.repositories.ZoneRepository;
import sd.assignment.backend_app.validators.RestaurantValidator;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class RestaurantService {
    @Autowired
    private RestaurantRepository restaurantRepository;
    @Autowired
    private AdminRepository adminRepository;
    @Autowired
    private ZoneRepository zoneRepository;

    public void createRestaurant(RestaurantDTO restaurantDTO) throws Exception {
        RestaurantValidator.isRestaurantValid(restaurantDTO, restaurantRepository);

        Admin admin = adminRepository.findByUsername(restaurantDTO.getUsername());
        if (admin == null)
            throw new NotFoundException("Admin with username " + restaurantDTO.getUsername() + " was not found.");

        restaurantDTO.setUsername(admin.getUser().getUsername());
        Restaurant restaurant = RestaurantMapper.convertToEntity(restaurantDTO, adminRepository, restaurantRepository, zoneRepository);

        for (Zone zone: restaurant.getZones()) {
            zone.addRestaurant(restaurant);
        }

        restaurantRepository.save(restaurant);
    }

    public List<RestaurantDTO> getRestaurantsByZone(String zoneId) {
        return restaurantRepository.findByZoneId(zoneId)
                .stream()
                .map(RestaurantMapper::convertToDTO)
                .collect(Collectors.toList());
    }

    public List<RestaurantDTO> getRestaurantsByNameAndZone(String restaurantName, String zoneId) {
        return restaurantRepository.findByNameAndZone(restaurantName, zoneId)
                .stream()
                .map(RestaurantMapper::convertToDTO)
                .collect(Collectors.toList());
    }

    public List<RestaurantDTO> getRestaurantsByUsername(String username) {
        return restaurantRepository.findByUsername(username)
                .stream()
                .map(RestaurantMapper::convertToDTO)
                .collect(Collectors.toList());
    }
}
