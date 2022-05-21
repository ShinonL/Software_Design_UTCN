package api.backend_app.controllers;

import api.backend_app.dtos.UserDTO;
import api.backend_app.security.CustomDetailsService;
import api.backend_app.security.JwtUtil;
import api.backend_app.services.UserService;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import api.backend_app.response.ApiResponse;

@Slf4j
@RestController
@RequestMapping("/auth")
public class AuthController {
    @Autowired
    private UserService userService;
    @Autowired
    private AuthenticationManager authenticationManager;
    @Autowired
    private CustomDetailsService customDetailsService;
    @Autowired
    private JwtUtil jwtUtil;

    private final Logger logger = LoggerFactory.getLogger(AuthController.class);

    @PostMapping("/register")
    public ResponseEntity<ApiResponse> createUser(@RequestBody UserDTO userDTO) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "AuthController::createUser");

        try {
            logger.info("Creating user account " + userDTO.getUsername());
            userService.createUser(userDTO);

            logger.info("Successfully created user account " + userDTO.getUsername());
            return findUser(userDTO);
        } catch (Exception ex) {
            logger.error("Error creating user account " + userDTO.getUsername());
            logger.error(ex.getMessage());
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
            logger.info("Authenticating user account " + userDTO.getUsername());
            authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(userDTO.getUsername(), userDTO.getPassword())
            );

            logger.info("Successfully authenticated user account " + userDTO.getUsername());
            logger.info("Fetching details for user account " + userDTO.getUsername());
            UserDTO user = userService.findUser(userDTO.getUsername(), userDTO.getPassword());

            final UserDetails userDetails = customDetailsService.loadUserByUsername(userDTO.getUsername());

            logger.info("Successfully fetched details for user account " + userDTO.getUsername());
            logger.info("Creating JWT");
            final String token = jwtUtil.generateToken(userDetails);

            logger.info("Successfully created JWT ");
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(),  "Successfully logged in user.")
                    .withHttpHeader(httpHeaders)
                    .withData(token)
                    .build();

        } catch (Exception ex) {
            logger.error("Error logging in the user account " + userDTO.getUsername());
            logger.error(ex.getMessage());
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }
}
