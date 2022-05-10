package sd.assignment.backend_app.services;

import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

@Slf4j
@Service
public class RestaurantService {
    @Autowired
    private RestaurantRepository restaurantRepository;
    @Autowired
    private AdminRepository adminRepository;
    @Autowired
    private ZoneRepository zoneRepository;

    private final Logger logger = LoggerFactory.getLogger(RestaurantService.class);

    public void createRestaurant(RestaurantDTO restaurantDTO) throws Exception {
        logger.info("Validating the restaurant details");
        RestaurantValidator.isRestaurantValid(restaurantDTO, restaurantRepository);

        logger.info("Validating the admin " + restaurantDTO.getUsername());
        Admin admin = adminRepository.findByUsername(restaurantDTO.getUsername());
        if (admin == null) {
            logger.error("Admin with username " + restaurantDTO.getUsername() + " was not found.");
            throw new NotFoundException("Admin with username " + restaurantDTO.getUsername() + " was not found.");
        }

        restaurantDTO.setUsername(admin.getUser().getUsername());
        Restaurant restaurant = RestaurantMapper.convertToEntity(restaurantDTO, adminRepository, restaurantRepository, zoneRepository);

        logger.info("Setting the restaurant delivery zones");
        for (Zone zone: restaurant.getZones()) {
            zone.addRestaurant(restaurant);
        }

        logger.info("Saving the restaurant");
        restaurantRepository.save(restaurant);
    }

    public List<RestaurantDTO> getRestaurantsByZone(String zoneId) {
        logger.info("Retrieving restaurants by zone " + zoneId);
        return restaurantRepository.findByZoneId(zoneId)
                .stream()
                .map(RestaurantMapper::convertToDTO)
                .collect(Collectors.toList());
    }

    public List<RestaurantDTO> getRestaurantsByNameAndZone(String restaurantName, String zoneId) {
        logger.info("Retrieving restaurants by zone " + zoneId + " and name " + restaurantName);
        return restaurantRepository.findByNameAndZone(restaurantName, zoneId)
                .stream()
                .map(RestaurantMapper::convertToDTO)
                .collect(Collectors.toList());
    }

    public List<RestaurantDTO> getRestaurantsByUsername(String username) {
        logger.info("Retrieving restaurants by username " + username);
        return restaurantRepository.findByUsername(username)
                .stream()
                .map(RestaurantMapper::convertToDTO)
                .collect(Collectors.toList());
    }
}
