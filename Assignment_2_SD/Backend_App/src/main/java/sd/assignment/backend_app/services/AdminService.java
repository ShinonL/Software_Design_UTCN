package sd.assignment.backend_app.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sd.assignment.backend_app.common.enums.Role;
import sd.assignment.backend_app.entities.Admin;
import sd.assignment.backend_app.entities.User;
import sd.assignment.backend_app.dtos.UserDTO;
import sd.assignment.backend_app.repositories.AdminRepository;

@Service
public class AdminService {
    @Autowired
    private AdminRepository adminRepository;

    @Autowired
    private UserService userService;

    public void createAdmin(UserDTO userDTO) throws Exception {
        userDTO.setRole(Role.ADMINISTRATOR);
        User user = userService.createUser(userDTO);

        Admin admin = new Admin();
        admin.setUser(user);
        adminRepository.save(admin);
    }
}
