package api.backend_app.validators;

import api.backend_app.common.exceptions.InvalidDataException;
import api.backend_app.dtos.ReviewDTO;

public class ReviewValidator {
    public static void isReviewValid(ReviewDTO reviewDTO) throws Exception {
        isValidText(reviewDTO.getText());
        isValidScore(reviewDTO.getScore());
    }

    public static void isValidText(String text) throws InvalidDataException {
        if (text == null || text.isEmpty())
            throw new InvalidDataException("Please insert some details.");
    }

    public static void isValidScore(int score) throws InvalidDataException {
        if (score <= 0 || score > 5)
            throw new InvalidDataException("Please insert a number between 1 and 5.");
    }
}
