package sd.assignment.backend.validators;

import sd.assignment.backend.common.exceptions.InvalidDataException;
import sd.assignment.backend.dtos.CartDTO;

public class CartValidator {
    public static void isCartValid(CartDTO cartDTO) throws Exception {
        isValidUsername(cartDTO.getUsername());
        isValidQuantity(cartDTO.getQuantity());
        isValidFoodId(cartDTO.getFoodDTO().getId());
    }

    public static void isValidUsername(String username) throws Exception {
        if (username == null || username.isEmpty())
            throw new InvalidDataException("Please insert a user for the order.");
    }

    public static void isValidQuantity(int quantity) throws Exception {
        if (quantity == 0)
            throw new InvalidDataException("Please insert a quantity.");

        if (quantity < 0)
            throw new InvalidDataException("Please insert a positive quantity.");
    }

    public static void isValidFoodId(String id) throws Exception {
        if (id == null || id.isEmpty())
            throw new InvalidDataException("Please select a product to add to the cart.");
    }
}
