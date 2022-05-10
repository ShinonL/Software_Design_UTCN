package sd.assignment.backend.services;

import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import sd.assignment.backend.common.exceptions.NotFoundException;
import sd.assignment.backend.entities.User;
import sd.assignment.backend.dtos.UserDTO;
import sd.assignment.backend.common.mappers.UserMapper;
import sd.assignment.backend.repositories.UserRepository;
import sd.assignment.backend.validators.UserValidator;

/**
 * This Service deals with methods specific to the `user` entity
 */
@Slf4j
@Service("userService")
public class UserService {
    /**
     * The user repository deals with running sql commands specific to the `user` table
     */
    @Autowired
    private UserRepository userRepository;
    /**
     * This the password encoder used to encode the user password in the DB
     */
    @Autowired
    PasswordEncoder passwordEncoder;
    /**
     * Used for logging the steps taken.
     */
    private final Logger logger = LoggerFactory.getLogger(UserService.class);

    /**
     * Create a new user with the given details
     * @param userDTO the details of the new user
     * @return the new user entity created
     * @throws Exception if any o the details are invalid or if it couldn't access the DB
     */
    public User createUser(UserDTO userDTO) throws Exception {
        logger.info("Validating the user details");
        UserValidator.isUserValid(userDTO, userRepository);

        User user = UserMapper.convertToEntity(userDTO);
        user.setPassword(passwordEncoder.encode(userDTO.getPassword()));

        logger.info("Saving the user details");
        return userRepository.save(user);
    }

    /**
     * Find the user in the DB based on its username and password
     * @param username the username we are searching for
     * @param password the password we are searching for
     * @return the user found
     * @throws Exception if the credentials are invalid
     */
    public UserDTO findUser(String username, String password) throws Exception {
        logger.info("Validating the username " + username);
        User user = userRepository.findByUsername(username);

        logger.info("Matching the passwords");
        if (user != null && passwordEncoder.matches(password, user.getPassword())) {
            return UserMapper.convertToDTO(user);
        } else {
            logger.error("Wrong credentials");
            throw new NotFoundException("Invalid username or password.");
        }
    }
}
