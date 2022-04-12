package sd.assignment_1_sd.dto;

import lombok.*;
import sd.assignment_1_sd.entity.VacationPackage;
import sd.assignment_1_sd.entity.enums.Role;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
public class UserDTO {
    private String id;
    private String firstName;
    private String lastName;
    private String email;
    private String phoneNumber;
    private String username;
    private String password;
    private Role role;
    private List<VacationPackage> vacationPackages;
}
