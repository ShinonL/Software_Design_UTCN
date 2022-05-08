package sd.assignment.backend_app.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import sd.assignment.backend_app.entities.User;
import sd.assignment.backend_app.repositories.UserRepository;

import java.util.List;

@Service
public class CustomDetailsService implements UserDetailsService {
    @Autowired
    private UserRepository userRepository;

    public List<User> findUsers() {
        return userRepository.findAll();
    }

    public User findUserById(String id) {
        return userRepository.getById(id);
    }

    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    @Override
    public UserDetails loadUserByUsername(String username) {
        User user = userRepository.findByUsername(username);

        if (user == null) {
            throw new UsernameNotFoundException(username);
        }
        return new CustomUserDetails(user);
    }
}