package sd.assignment.backend_app.dtos;

import lombok.Getter;
import lombok.Setter;
import sd.assignment.backend_app.common.enums.OrderState;

import java.util.List;

@Getter
@Setter
public class OrderDTO {
    private String id;
    private String username;
    private OrderState orderState;
    private String location;
    private ZoneDTO zoneDTO;
    private List<OrderDetailsDTO> orderDetailsDTO;
    private Double total;
    private boolean toDecline;
}
