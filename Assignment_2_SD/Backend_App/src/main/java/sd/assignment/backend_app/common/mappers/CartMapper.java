package sd.assignment.backend_app.common.mappers;

import sd.assignment.backend_app.dtos.CartDTO;
import sd.assignment.backend_app.entities.Cart;
import sd.assignment.backend_app.repositories.FoodRepository;
import sd.assignment.backend_app.repositories.UserRepository;

public class CartMapper {
    public static Cart convertToEntity(CartDTO cartDTO, FoodRepository foodRepository, UserRepository userRepository) {
        Cart cart = new Cart();

        cart.setId(cartDTO.getId());
        cart.setQuantity(cartDTO.getQuantity());
        cart.setFood(foodRepository.getById(cartDTO.getFoodDTO().getId()));
        cart.setUser(userRepository.findByUsername(cartDTO.getUsername()));

        return cart;
    }

    public static CartDTO convertToDTO(Cart cart) {
        CartDTO cartDTO = new CartDTO();

        cartDTO.setId(cart.getId());
        cartDTO.setQuantity(cart.getQuantity());
        cartDTO.setFoodDTO(FoodMapper.convertToDTO(cart.getFood()));
        cartDTO.setUsername(cart.getUser().getUsername());

        return cartDTO;
    }
}
