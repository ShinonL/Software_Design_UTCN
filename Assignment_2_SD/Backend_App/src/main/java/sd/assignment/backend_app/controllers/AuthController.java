package sd.assignment.backend_app.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;
import sd.assignment.backend_app.dtos.UserDTO;
import sd.assignment.backend_app.entities.User;
import sd.assignment.backend_app.response.ApiResponse;
import sd.assignment.backend_app.security.CustomDetailsService;
import sd.assignment.backend_app.security.CustomUserDetails;
import sd.assignment.backend_app.security.JwtUtil;
import sd.assignment.backend_app.services.CustomerFacade;
import sd.assignment.backend_app.services.UserService;

@RestController
@RequestMapping("/auth")
public class AuthController {
    @Autowired
    private CustomerFacade customerFacade;
    @Autowired
    private UserService userService;

    @Autowired
    private AuthenticationManager authenticationManager;
    @Autowired
    private CustomDetailsService customDetailsService;
    @Autowired
    private JwtUtil jwtUtil;

    @PostMapping("/register")
    public ResponseEntity<ApiResponse> createUser(@RequestBody UserDTO userDTO) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "AuthController::createUser");

        try {
            customerFacade.createUser(userDTO);

            return findUser(userDTO);
        } catch (Exception ex) {
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }

    @PostMapping("/login")
    public ResponseEntity<ApiResponse> findUser(@RequestBody UserDTO userDTO) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "AuthController::loginUser");

        try {
            authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(userDTO.getUsername(), userDTO.getPassword())
            );

            UserDTO user = userService.findUser(userDTO.getUsername(), userDTO.getPassword());

            final UserDetails userDetails = customDetailsService.loadUserByUsername(userDTO.getUsername());

            final String token = jwtUtil.generateToken(userDetails);

            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(),  "Successfully logged in user.")
                    .withHttpHeader(httpHeaders)
                    .withData(token)
                    .build();

        } catch (Exception ex) {
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }
}
