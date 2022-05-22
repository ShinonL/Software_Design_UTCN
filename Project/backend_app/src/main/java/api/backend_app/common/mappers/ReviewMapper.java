package api.backend_app.common.mappers;

import api.backend_app.dtos.ReviewDTO;
import api.backend_app.entities.Facility;
import api.backend_app.entities.Review;

public class ReviewMapper {
    public static Review convertToEntity(ReviewDTO reviewDTO, Facility facility) {
        Review review = new Review();

        review.setId(reviewDTO.getId());
        review.setFacility(facility);
        review.setScore(reviewDTO.getScore());
        review.setText(reviewDTO.getText());

        return review;
    }

    public static ReviewDTO convertToDTO(Review review) {
        ReviewDTO reviewDTO = new ReviewDTO();

        reviewDTO.setId(review.getId());
        reviewDTO.setFacilityId(review.getFacility().getId());
        reviewDTO.setScore(review.getScore());
        reviewDTO.setText(review.getText());

        return reviewDTO;
    }
}
