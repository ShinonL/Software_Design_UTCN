package sd.assignment.backend_app.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import sd.assignment.backend_app.dtos.UserDTO;
import sd.assignment.backend_app.response.ApiResponse;
import sd.assignment.backend_app.services.CustomerFacade;
import sd.assignment.backend_app.services.UserService;

@RestController
@RequestMapping("/auth")
public class AuthController {
    @Autowired
    private CustomerFacade customerFacade;
    @Autowired
    private UserService userService;

    @PostMapping("/register")
    public ResponseEntity<ApiResponse> createUser(@RequestBody UserDTO userDTO) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "AuthController::createUser");

        try {
            customerFacade.createUser(userDTO);

            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully registered new user " + userDTO.getUsername())
                    .withHttpHeader(httpHeaders)
                    .build();
        } catch (Exception ex) {
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }

    @PostMapping("/login")
    public ResponseEntity<ApiResponse> loginUser(@RequestBody UserDTO userDTO) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "AuthController::loginUser");

        try {
            UserDTO user = userService.findUser(userDTO.getUsername(), userDTO.getPassword());

            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(),  "Successfully logged in user.")
                    .withHttpHeader(httpHeaders)
                    .withData(user)
                    .build();

        } catch (Exception ex) {
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }
}
