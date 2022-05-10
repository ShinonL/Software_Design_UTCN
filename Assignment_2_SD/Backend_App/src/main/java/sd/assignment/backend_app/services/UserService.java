package sd.assignment.backend_app.services;

import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import sd.assignment.backend_app.common.exceptions.NotFoundException;
import sd.assignment.backend_app.entities.User;
import sd.assignment.backend_app.dtos.UserDTO;
import sd.assignment.backend_app.common.mappers.UserMapper;
import sd.assignment.backend_app.repositories.UserRepository;
import sd.assignment.backend_app.validators.UserValidator;

@Slf4j
@Service("userService")
public class UserService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    PasswordEncoder passwordEncoder;

    private final Logger logger = LoggerFactory.getLogger(UserService.class);

    public User createUser(UserDTO userDTO) throws Exception {
        logger.info("Validating the user details");
        UserValidator.isUserValid(userDTO, userRepository);

        User user = UserMapper.convertToEntity(userDTO);
        user.setPassword(passwordEncoder.encode(userDTO.getPassword()));

        logger.info("Saving the user details");
        return userRepository.save(user);
    }

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
