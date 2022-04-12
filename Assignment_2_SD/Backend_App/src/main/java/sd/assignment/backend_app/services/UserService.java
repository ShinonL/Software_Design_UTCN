package sd.assignment.backend_app.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import sd.assignment.backend_app.common.exceptions.NotFoundException;
import sd.assignment.backend_app.entities.User;
import sd.assignment.backend_app.dtos.UserDTO;
import sd.assignment.backend_app.common.mappers.UserMapper;
import sd.assignment.backend_app.repositories.UserRepository;
import sd.assignment.backend_app.validators.UserValidator;

@Service("userService")
public class UserService {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    PasswordEncoder passwordEncoder;

    public User createUser(UserDTO userDTO) throws Exception {
        UserValidator.isUserValid(userDTO, userRepository);

        User user = UserMapper.convertToEntity(userDTO);
        user.setPassword(passwordEncoder.encode(userDTO.getPassword()));

        return userRepository.save(user);
    }

    public UserDTO findUser(String username, String password) throws Exception {
        User user = userRepository.findByUsername(username);

        if (user != null && passwordEncoder.matches(password, user.getPassword())) {
            return UserMapper.convertToDTO(user);
        } else throw new NotFoundException("Invalid username or password.");
    }
}
