package sd.assignment.backend.common.mappers;

import sd.assignment.backend.dtos.FoodDTO;
import sd.assignment.backend.dtos.ZoneDTO;
import sd.assignment.backend.entities.Food;
import sd.assignment.backend.entities.Restaurant;
import sd.assignment.backend.dtos.RestaurantDTO;
import sd.assignment.backend.entities.Zone;
import sd.assignment.backend.repositories.AdminRepository;
import sd.assignment.backend.repositories.RestaurantRepository;
import sd.assignment.backend.repositories.ZoneRepository;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class RestaurantMapper {
    public static Restaurant convertToEntity(
            RestaurantDTO restaurantDTO,
            AdminRepository adminRepository,
            RestaurantRepository restaurantRepository,
            ZoneRepository zoneRepository) {
        Restaurant restaurant = new Restaurant();

        restaurant.setId(restaurantDTO.getId());
        restaurant.setName(restaurantDTO.getName());
        restaurant.setLocation(restaurantDTO.getLocation());
        restaurant.setAdmin(adminRepository.findByUsername(restaurantDTO.getUsername()));

        if (restaurantDTO.getZones() != null) {
            List<Zone> zones = new ArrayList<>();

            for(ZoneDTO zoneDTO : restaurantDTO.getZones()) {
                Zone existing = zoneRepository.findByNameAndCity(zoneDTO.getName(), zoneDTO.getCity());

                if (existing == null) {
                    zones.add(zoneRepository.save(ZoneMapper.convertToEntity(zoneDTO)));
                } else zones.add(existing);
            }
            restaurant.setZones(zones);
        }

        if (restaurantDTO.getFoods() != null) {
            List<Food> foods = restaurantDTO.getFoods()
                    .stream()
                    .map(food -> FoodMapper.convertToEntity(food, restaurantRepository))
                    .collect(Collectors.toList());
            restaurant.setFoods(foods);
        }

        return restaurant;
    }

    public static RestaurantDTO convertToDTO(Restaurant restaurant) {
        RestaurantDTO restaurantDTO = new RestaurantDTO();

        restaurantDTO.setId(restaurant.getId());
        restaurantDTO.setName(restaurant.getName());
        restaurantDTO.setLocation(restaurant.getLocation());
        restaurantDTO.setUsername(restaurant.getAdmin().getUser().getUsername());

        if (restaurant.getZones() != null) {
            List<ZoneDTO> zones = restaurant.getZones()
                    .stream()
                    .map(ZoneMapper::convertToDTO)
                    .collect(Collectors.toList());
            restaurantDTO.setZones(zones);
        }

        if (restaurant.getFoods() != null) {
            List<FoodDTO> foods = restaurant.getFoods()
                    .stream()
                    .map(FoodMapper::convertToDTO)
                    .collect(Collectors.toList());
            restaurantDTO.setFoods(foods);
        }

        return restaurantDTO;
    }
}
