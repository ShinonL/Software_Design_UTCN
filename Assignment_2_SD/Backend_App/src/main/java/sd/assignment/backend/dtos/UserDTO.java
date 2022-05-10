package sd.assignment.backend.dtos;

import lombok.Getter;
import lombok.Setter;
import sd.assignment.backend.common.enums.Role;

@Getter
@Setter
public class UserDTO {
    private String id;
    private String firstName;
    private String lastName;
    private String email;
    private String phoneNumber;
    private String username;
    private String password;
    private Role role;
}
