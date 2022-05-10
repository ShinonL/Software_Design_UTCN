package sd.assignment.backend.dtos;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@RequiredArgsConstructor
public class OrderDetailsDTO {
    private String id;
    private int quantity;
    private FoodDTO foodDTO;
}
