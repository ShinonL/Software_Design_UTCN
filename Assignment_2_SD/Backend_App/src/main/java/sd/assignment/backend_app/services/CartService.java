package sd.assignment.backend_app.services;

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

@Service
public class CartService {
    @Autowired
    private CartRepository cartRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private FoodRepository foodRepository;

    public void addNew(CartDTO cartDTO) throws Exception {
        CartValidator.isCartValid(cartDTO);

        User user = userRepository.findByUsername(cartDTO.getUsername());
        if (user == null)
            throw new NotFoundException("User not found.");

        Optional<Food> food = foodRepository.findById(cartDTO.getFoodDTO().getId());
        if (food.isEmpty())
            throw new NotFoundException("Food was not found.");

        for (Cart cart: user.getCarts()) {
            if (!cart.getFood().getRestaurant().getName().equals(cartDTO.getFoodDTO().getRestaurantName()))
                throw new MoreRestaurantsException("Your cart has products from another restaurant. Do you want to empty it?");
        }

        cartRepository.save(CartMapper.convertToEntity(cartDTO, foodRepository, userRepository));
    }

    public void deleteAll(String username) throws Exception {
        User user = userRepository.findByUsername(username);
        if (user == null)
            throw new NotFoundException("User not found.");

        cartRepository.deleteAll(user.getCarts());
    }

    public List<CartDTO> getAll(String username) throws Exception {
        User user = userRepository.findByUsername(username);
        if (user == null)
            throw new NotFoundException("User not found.");

        return user.getCarts()
                .stream()
                .map(CartMapper::convertToDTO)
                .collect(Collectors.toList());
    }
}