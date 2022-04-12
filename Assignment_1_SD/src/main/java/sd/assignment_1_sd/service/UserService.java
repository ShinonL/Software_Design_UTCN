package sd.assignment_1_sd.service;

import sd.assignment_1_sd.dto.UserDTO;
import sd.assignment_1_sd.dto.VacationPackageDTO;
import sd.assignment_1_sd.entity.User;
import sd.assignment_1_sd.entity.VacationPackage;
import sd.assignment_1_sd.entity.enums.Status;
import sd.assignment_1_sd.repository.UserRepository;
import sd.assignment_1_sd.repository.VacationPackageRepository;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class UserService {
    private static final UserRepository userRepository = new UserRepository();
    private static final VacationPackageRepository vacationPackageRepository = new VacationPackageRepository();

    private static final String EMAIL_REGEX = "^[\\w-\\+]+(\\.[\\w]+)*@[\\w-]+(\\.[\\w]+)*(\\.[a-z]{2,})$";
    private static final String PHONE_NUMBER_REGEX = "^(\\+4|)?(07[0-8]{1}[0-9]{1}|02[0-9]{2}|03[0-9]{2}){1}?(\\s|\\.|\\-)?([0-9]{3}(\\s|\\.|\\-|)){2}$";

    public void createUser(UserDTO user) throws Exception {
        isUserValid(user);
        userRepository.add(convertToEntity(user));
    }

    public UserDTO findUser(String username, String password) throws Exception {
        User user = userRepository.findByUsername(username);

        if (user == null || !user.getPassword().equals(password))
            throw new Exception("Wrong credentials.");

        return convertToDTO(user);
    }

    public void bookVacationPackage(VacationPackageDTO vacationPackageDTO, String username) throws Exception {
        User user = userRepository.findByUsername(username);

        VacationPackage vacationPackage = vacationPackageRepository.findByName(vacationPackageDTO.getName());

        if (vacationPackage.getNoPeople() == vacationPackage.getLeftPackages()) {
            vacationPackage.setLeftPackages(vacationPackage.getLeftPackages() - 1);
            vacationPackage.setStatus(Status.IN_PROGRESS);
        }

        if (vacationPackage.getLeftPackages() == 0)
            vacationPackage.setStatus(Status.BOOKED);

        vacationPackageRepository.update(vacationPackage);

        user.addVacationPackage(vacationPackage);
        userRepository.update(user);
    }

    private void isUserValid(UserDTO user) throws Exception {
        isValidUsername(user.getUsername());
        isValidPassword(user.getPassword());
        isValidEmail(user.getEmail());
        isValidPhoneNumber(user.getPhoneNumber());
    }

    private void isValidUsername(String username) throws Exception {
        if (username == null || username.isEmpty())
            throw new Exception("Please insert a username.");

        User user = userRepository.findByUsername(username);
        if (user != null)
            throw new Exception("Username already exists.");
    }

    private void isValidPassword(String password) throws Exception {
        if (password == null || password.isEmpty())
            throw new Exception("Please insert a password.");

        if (password.length() < 8)
            throw new Exception("Password should have at least 8 characters.");
    }

    private void isValidEmail(String email) throws Exception {
        if(email.isEmpty())
            throw new Exception("Please insert an email.");

        Pattern pattern = Pattern.compile(EMAIL_REGEX, Pattern.CASE_INSENSITIVE);
        Matcher matcher = pattern.matcher(email);
        if (!matcher.matches())
            throw new Exception("Invalid email.");

        User user = userRepository.findByEmail(email);
        if (user != null)
            throw new Exception("Email already used.");
    }

    private void isValidPhoneNumber(String phoneNumber) throws Exception {
        Pattern pattern = Pattern.compile(PHONE_NUMBER_REGEX, Pattern.CASE_INSENSITIVE);
        Matcher matcher = pattern.matcher(phoneNumber);
        if (!matcher.matches())
            throw new Exception("Invalid phone number.");
    }

    private UserDTO convertToDTO(User user) {
        UserDTO userDTO = new UserDTO();

        userDTO.setId(user.getId());
        userDTO.setUsername(user.getUsername());
        userDTO.setPassword(user.getPassword());
        userDTO.setEmail(user.getEmail());
        userDTO.setPhoneNumber(user.getPhoneNumber());
        userDTO.setFirstName(user.getFirstName());
        userDTO.setLastName(user.getLastName());
        userDTO.setRole(user.getRole());
        userDTO.setVacationPackages(user.getVacationPackages());

        return userDTO;
    }

    private User convertToEntity(UserDTO userDTO) {
        User user = new User();

        user.setId(userDTO.getId());
        user.setUsername(userDTO.getUsername());
        user.setPassword(userDTO.getPassword());
        user.setEmail(userDTO.getEmail());
        user.setPhoneNumber(userDTO.getPhoneNumber());
        user.setFirstName(userDTO.getFirstName());
        user.setLastName(userDTO.getLastName());
        user.setRole(userDTO.getRole());
        user.setVacationPackages(userDTO.getVacationPackages());

        return user;
    }
}
