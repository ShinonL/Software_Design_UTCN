package sd.assignment_1_sd.controller;

import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.stage.Stage;
import javafx.stage.StageStyle;
import sd.assignment_1_sd.dto.UserDTO;
import sd.assignment_1_sd.entity.enums.Role;
import sd.assignment_1_sd.service.UserService;

import java.io.IOException;

public class LoginController {
    private static final UserService userService = new UserService();

    @FXML
    private TextField usernameTextField;

    @FXML
    private PasswordField passwordField;

    public void openWindow(String filePath, String title, int width, int height) throws IOException {
        FXMLLoader fxmlLoader = new FXMLLoader(getClass().getResource(filePath));
        Scene scene = new Scene(fxmlLoader.load(), width, height);
        Stage stage = new Stage();

        stage.setTitle(title);
        stage.setScene(scene);
        stage.show();
    }

    public void openRegisterWindow() throws IOException {
            openWindow("/views/RegisterView.fxml", "Register View", 1200, 400);
    }

    public void throwNewAlert(String message) {
        Alert alert = new Alert(Alert.AlertType.ERROR);
        alert.initStyle(StageStyle.UTILITY);
        alert.setTitle(message);
        alert.setContentText(message);
        alert.showAndWait();
    }

    public void login() {
        try {
            UserDTO user = userService.findUser(usernameTextField.getText(), passwordField.getText());
            if (user.getRole() == Role.REGULAR_USER)
                openWindow("/views/RegularUserView.fxml", user.getUsername(), 1200, 400);
            else openWindow("/views/TravellingAgencyView.fxml", user.getUsername(), 1200, 400);
        } catch (Exception ex) {
            throwNewAlert(ex.getMessage());
        }
    }
}
