package sd.assignment.backend.common.mappers;

import sd.assignment.backend.dtos.CartDTO;
import sd.assignment.backend.entities.Cart;
import sd.assignment.backend.repositories.FoodRepository;
import sd.assignment.backend.repositories.UserRepository;

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
