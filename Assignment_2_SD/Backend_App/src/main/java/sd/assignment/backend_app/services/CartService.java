package sd.assignment.backend_app.services;

import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sd.assignment.backend_app.common.exceptions.MoreRestaurantsException;
import sd.assignment.backend_app.common.exceptions.NotFoundException;
import sd.assignment.backend_app.common.mappers.CartMapper;
import sd.assignment.backend_app.dtos.CartDTO;
import sd.assignment.backend_app.entities.Cart;
import sd.assignment.backend_app.entities.Food;
import sd.assignment.backend_app.entities.User;
import sd.assignment.backend_app.repositories.CartRepository;
import sd.assignment.backend_app.repositories.FoodRepository;
import sd.assignment.backend_app.repositories.UserRepository;
import sd.assignment.backend_app.validators.CartValidator;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Slf4j
@Service
public class CartService {
    @Autowired
    private CartRepository cartRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private FoodRepository foodRepository;

    private final Logger logger = LoggerFactory.getLogger(CartService.class);

    public void addToCart(CartDTO cartDTO) throws Exception {
        logger.info("Validating cart information");
        CartValidator.isCartValid(cartDTO);

        logger.info("Validating the user " + cartDTO.getUsername());
        User user = userRepository.findByUsername(cartDTO.getUsername());
        if (user == null) {
            logger.error("User " + cartDTO.getUsername() + " not found.");
            throw new NotFoundException("User not found.");
        }

        logger.info("Validating the food");
        Optional<Food> food = foodRepository.findById(cartDTO.getFoodDTO().getId());
        if (food.isEmpty()) {
            logger.error("Food was not found.");
            throw new NotFoundException("Food was not found.");
        }

        logger.info("Validating cart content");
        for (Cart cart: user.getCarts()) {
            if (!cart.getFood().getRestaurant().getName().equals(cartDTO.getFoodDTO().getRestaurantName())) {
                logger.error("Your cart has products from another restaurant.");
                throw new MoreRestaurantsException("Your cart has products from another restaurant. Do you want to empty it?");
            }
        }

        logger.info("Saving cart details");
        cartRepository.save(CartMapper.convertToEntity(cartDTO, foodRepository, userRepository));
    }

    public void deleteCartByUsername(String username) throws Exception {
        logger.info("Validating the user " + username);
        User user = userRepository.findByUsername(username);
        if (user == null) {
            logger.error("User " + username + " not found.");
            throw new NotFoundException("User not found.");
        }

        logger.info("Deleting cart details for " + username);
        cartRepository.deleteAll(user.getCarts());
    }

    public List<CartDTO> getCartByUsername(String username) throws Exception {
        logger.info("Validating the user " + username);
        User user = userRepository.findByUsername(username);
        if (user == null) {
            logger.error("User " + username + " not found.");
            throw new NotFoundException("User not found.");
        }

        logger.info("Retrieving cart details");
        return user.getCarts()
                .stream()
                .map(CartMapper::convertToDTO)
                .collect(Collectors.toList());
    }
}
