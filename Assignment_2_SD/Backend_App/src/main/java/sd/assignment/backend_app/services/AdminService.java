package sd.assignment.backend_app.services;

import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sd.assignment.backend_app.common.enums.Role;
import sd.assignment.backend_app.entities.Admin;
import sd.assignment.backend_app.entities.User;
import sd.assignment.backend_app.dtos.UserDTO;
import sd.assignment.backend_app.repositories.AdminRepository;

@Slf4j
@Service
public class AdminService {
    @Autowired
    private AdminRepository adminRepository;
    @Autowired
    private UserService userService;

    private final Logger logger = LoggerFactory.getLogger(AdminService.class);

    public void createAdmin(UserDTO userDTO) throws Exception {
        logger.info("Setting the role to ROLE_ADMINISTRATOR");
        userDTO.setRole(Role.ROLE_ADMINISTRATOR);

        logger.info("Creating a basic user account for " + userDTO.getUsername());
        User user = userService.createUser(userDTO);

        logger.info("Linking the account to an admin account");
        Admin admin = new Admin();
        admin.setUser(user);

        logger.info("Saving the admin account");
        adminRepository.save(admin);
    }
}
