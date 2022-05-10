package sd.assignment.backend.services;

import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sd.assignment.backend.common.enums.Role;
import sd.assignment.backend.entities.Admin;
import sd.assignment.backend.entities.User;
import sd.assignment.backend.dtos.UserDTO;
import sd.assignment.backend.repositories.AdminRepository;

/**
 * This Service deals with methods specific to the `admin` entity
 */
@Slf4j
@Service
public class AdminService {
    /**
     * The admin repository deals with running sql commands specific to the `admin` table
     */
    @Autowired
    private AdminRepository adminRepository;

    /**
     * This Service deals with methods specific to the `user` entity
     */
    @Autowired
    private UserService userService;

    /**
     * Used for logging the steps taken.
     */
    private final Logger logger = LoggerFactory.getLogger(AdminService.class);

    /**
     * Validates and creates a new User and Admin entry in each table
     * @param userDTO the user details of the admin
     * @throws Exception if there is any problem with the details or with the DB save
     */
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
