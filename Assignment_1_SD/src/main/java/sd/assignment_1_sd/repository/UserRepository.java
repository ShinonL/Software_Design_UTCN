package sd.assignment_1_sd.repository;

import sd.assignment_1_sd.entity.User;

import java.util.List;

public class UserRepository extends GenericRepository<User, String> {
    public UserRepository() {
        super(User.class);
    }

    public User findByUsername(String username) throws Exception {
        List<User> users = super.findByString("username", username);
        return users.isEmpty() ? null : users.get(0);
    }

    public User findByEmail(String email) throws Exception {
        List<User> users = super.findByString("email", email);
        return users.isEmpty() ? null : users.get(0);
    }
}
