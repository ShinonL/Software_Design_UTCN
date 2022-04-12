package sd.assignment.backend_app.validators;

import sd.assignment.backend_app.common.exceptions.InvalidDataException;
import sd.assignment.backend_app.dtos.UserDTO;
import sd.assignment.backend_app.entities.User;
import sd.assignment.backend_app.repositories.UserRepository;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class UserValidator {
    private static final String EMAIL_REGEX = "^[\\w-\\+]+(\\.[\\w]+)*@[\\w-]+(\\.[\\w]+)*(\\.[a-z]{2,})$";
    private static final String PHONE_NUMBER_REGEX = "^(\\+4|)?(07[0-8]{1}[0-9]{1}|02[0-9]{2}|03[0-9]{2}){1}?(\\s|\\.|\\-)?([0-9]{3}(\\s|\\.|\\-|)){2}$";

    public static void isUserValid(UserDTO user, UserRepository userRepository) throws Exception {
        isValidUsername(user.getUsername(), userRepository);
        isValidPassword(user.getPassword());
        isValidEmail(user.getEmail(), userRepository);
        isValidPhoneNumber(user.getPhoneNumber());
    }

    public static void isValidUsername(String username, UserRepository userRepository) throws InvalidDataException {
        if (username == null || username.isEmpty())
            throw new InvalidDataException("Please insert a username.");

        if (username.length() < 3)
            throw new InvalidDataException("Please insert a username with at least 3 characters.");

        User user = userRepository.findByUsername(username);
        if (user != null)
            throw new InvalidDataException("Username already exists.");
    }

    public static void isValidPassword(String password) throws InvalidDataException {
        if (password == null || password.isEmpty())
            throw new InvalidDataException("Please insert a password.");

        if (password.length() < 3)
            throw new InvalidDataException("Password should have at least 3 characters.");
    }

    public static void isValidEmail(String email, UserRepository userRepository) throws InvalidDataException {
        if(email.isEmpty())
            throw new InvalidDataException("Please insert an email.");

        Pattern pattern = Pattern.compile(EMAIL_REGEX, Pattern.CASE_INSENSITIVE);
        Matcher matcher = pattern.matcher(email);
        if (!matcher.matches())
            throw new InvalidDataException("Invalid email.");

        User user = userRepository.findByEmail(email);
        if (user != null)
            throw new InvalidDataException("Email already used.");
    }

    public static void isValidPhoneNumber(String phoneNumber) throws Exception {
        Pattern pattern = Pattern.compile(PHONE_NUMBER_REGEX, Pattern.CASE_INSENSITIVE);
        Matcher matcher = pattern.matcher(phoneNumber);
        if (!matcher.matches())
            throw new InvalidDataException("Invalid phone number.");
    }
}
