package api.backend_app.dtos;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class PetDTO {
    private String id;
    private String name;
    private int age;
    private UserDTO user;
    private PetTypeDTO petType;
    private List<AppointmentDTO> appointments;
}
