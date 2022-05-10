package sd.assignment.backend.dtos;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CartDTO {
    private String id;
    private int quantity;
    private String username;
    private FoodDTO foodDTO;
}
