package sd.assignment_1_sd.controller;

import javafx.fxml.FXML;
import javafx.scene.control.Alert;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.stage.Stage;
import javafx.stage.StageStyle;
import javafx.stage.Window;
import sd.assignment_1_sd.dto.UserDTO;
import sd.assignment_1_sd.entity.enums.Role;
import sd.assignment_1_sd.service.UserService;

import java.util.List;
import java.util.stream.Collectors;

public class RegisterController {
    private static final UserService userService = new UserService();

    @FXML
    private TextField userNameTextField;

    @FXML
    private TextField firstNameTextField;

    @FXML
    private TextField lastNameTextField;

    @FXML
    private TextField emailTextField;

    @FXML
    private TextField phoneNumberTextField;

    @FXML
    private PasswordField passwordField;

    public void throwNewAlert(String message) {
        Alert alert = new Alert(Alert.AlertType.ERROR);
        alert.initStyle(StageStyle.UTILITY);
        alert.setTitle(message);
        alert.setContentText(message);
        alert.showAndWait();
    }

    public void register() {
        try {
            UserDTO user = new UserDTO();
            user.setFirstName(firstNameTextField.getText());
            user.setLastName(lastNameTextField.getText());
            user.setEmail(emailTextField.getText());
            user.setPhoneNumber(phoneNumberTextField.getText());
            user.setUsername(userNameTextField.getText());
            user.setPassword(passwordField.getText());
            user.setRole(Role.REGULAR_USER);

            userService.createUser(user);

            List<Window> windows = Stage.getWindows().stream().filter(Window::isFocused).collect(Collectors.toList());
            Stage stage = (Stage) windows.get(0);
            stage.close();
        } catch (Exception ex) {
            throwNewAlert(ex.getMessage());
        }
    }
}
