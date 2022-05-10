package sd.assignment.backend.services;

import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sd.assignment.backend.common.exceptions.MoreRestaurantsException;
import sd.assignment.backend.common.exceptions.NotFoundException;
import sd.assignment.backend.common.mappers.CartMapper;
import sd.assignment.backend.dtos.CartDTO;
import sd.assignment.backend.entities.Cart;
import sd.assignment.backend.entities.Food;
import sd.assignment.backend.entities.User;
import sd.assignment.backend.repositories.CartRepository;
import sd.assignment.backend.repositories.FoodRepository;
import sd.assignment.backend.repositories.UserRepository;
import sd.assignment.backend.validators.CartValidator;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * This Service deals with methods specific to the `cart` entity
 */
@Slf4j
@Service
public class CartService {
    /**
     * The cart repository deals with running sql commands specific to the `cart` table
     */
    @Autowired
    private CartRepository cartRepository;
    /**
     * The user repository deals with running sql commands specific to the `user` table
     */
    @Autowired
    private UserRepository userRepository;
    /**
     * The food repository deals with running sql commands specific to the `food` table
     */
    @Autowired
    private FoodRepository foodRepository;

    /**
     * Used for logging the steps taken.
     */
    private final Logger logger = LoggerFactory.getLogger(CartService.class);

    /**
     * Validates and creates a new entry in the cart of the given user
     * @param cartDTO contains information about the food and the cart owner
     * @throws Exception if there is any problem with the details or with the DB save
     */
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

    /**
     * Validates the given user and deletes the cart items for the specific user
     * @param username The user whose cart is to be deleted
     * @throws Exception If the user does not exist or the cart couldn't be emptied
     */
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

    /**
     * Validates the given username and then returns the products that are stored in his cart
     * @param username The user whose cart is to be retrieved
     * @return The products and quantities in the cart
     * @throws Exception If the user does not exist or the cart couldn't be accessed
     */
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
