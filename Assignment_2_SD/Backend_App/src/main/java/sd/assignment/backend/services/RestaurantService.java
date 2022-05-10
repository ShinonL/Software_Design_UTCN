package sd.assignment.backend.services;

import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sd.assignment.backend.common.exceptions.NotFoundException;
import sd.assignment.backend.common.mappers.RestaurantMapper;
import sd.assignment.backend.entities.Admin;
import sd.assignment.backend.entities.Restaurant;
import sd.assignment.backend.dtos.RestaurantDTO;
import sd.assignment.backend.entities.Zone;
import sd.assignment.backend.repositories.AdminRepository;
import sd.assignment.backend.repositories.RestaurantRepository;
import sd.assignment.backend.repositories.ZoneRepository;
import sd.assignment.backend.validators.RestaurantValidator;

import java.util.List;
import java.util.stream.Collectors;

/**
 * This Service deals with methods specific to the `restaurant` entity
 */
@Slf4j
@Service
public class RestaurantService {
    /**
     * The restaurant repository deals with running sql commands specific to the `restaurant` table
     */
    @Autowired
    private RestaurantRepository restaurantRepository;
    /**
     * The admin repository deals with running sql commands specific to the `admin` table
     */
    @Autowired
    private AdminRepository adminRepository;
    /**
     * The zone repository deals with running sql commands specific to the `zone` table
     */
    @Autowired
    private ZoneRepository zoneRepository;
    /**
     * Used for logging the steps taken.
     */
    private final Logger logger = LoggerFactory.getLogger(RestaurantService.class);

    /**
     * Create a new restaurant for a given administrator
     * @param restaurantDTO contains the restaurant information and the administrator username
     * @throws Exception if any of the information is invalid or if the DB couldn't be accessed
     */
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

    /**
     * Retrieves all restaurants in a given delivery zone
     * @param zoneId the identification token of the delivery zone
     * @return the restaurants corresponding to that zone
     */
    public List<RestaurantDTO> getRestaurantsByZone(String zoneId) {
        logger.info("Retrieving restaurants by zone " + zoneId);
        return restaurantRepository.findByZoneId(zoneId)
                .stream()
                .map(RestaurantMapper::convertToDTO)
                .collect(Collectors.toList());
    }

    /**
     * Retrieves all restaurants in a given delivery zone that contain a specific name
     * @param restaurantName the name it is searching for
     * @param zoneId the identification token of the delivery zone
     * @return the restaurants corresponding to that zone and name
     */
    public List<RestaurantDTO> getRestaurantsByNameAndZone(String restaurantName, String zoneId) {
        logger.info("Retrieving restaurants by zone " + zoneId + " and name " + restaurantName);
        return restaurantRepository.findByNameAndZone(restaurantName, zoneId)
                .stream()
                .map(RestaurantMapper::convertToDTO)
                .collect(Collectors.toList());
    }

    /**
     * Retrieves all restaurants for specific user
     * @param username the identification token of the user
     * @return the restaurants corresponding to that user
     */
    public List<RestaurantDTO> getRestaurantsByUsername(String username) {
        logger.info("Retrieving restaurants by username " + username);
        return restaurantRepository.findByUsername(username)
                .stream()
                .map(RestaurantMapper::convertToDTO)
                .collect(Collectors.toList());
    }
}
