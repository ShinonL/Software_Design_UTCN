package sd.assignment.backend.dtos;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class RestaurantDTO {
    private String id;
    private String name;
    private String location;
    private List<ZoneDTO> zones;
    private List<FoodDTO> foods;
    private String username;
}
