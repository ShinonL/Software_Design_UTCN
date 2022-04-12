package sd.assignment.backend_app.dtos;

import lombok.Getter;
import lombok.Setter;
import sd.assignment.backend_app.common.enums.Category;

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
