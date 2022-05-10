package sd.assignment.backend.dtos;

import lombok.Getter;
import lombok.Setter;
import sd.assignment.backend.common.enums.Category;

@Getter
@Setter
public class FoodDTO {
    private String id;
    private Category category;
    private String name;
    private String description;
    private Double price;
    private String restaurantName;
}
