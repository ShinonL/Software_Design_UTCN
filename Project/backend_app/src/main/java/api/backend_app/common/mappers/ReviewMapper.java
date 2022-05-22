package api.backend_app.common.mappers;

import api.backend_app.dtos.ReviewDTO;
import api.backend_app.entities.Appointment;
import api.backend_app.entities.Review;

public class ReviewMapper {
    public static Review convertToEntity(ReviewDTO reviewDTO, Appointment appointment) {
        Review review = new Review();

        review.setId(reviewDTO.getId());
        review.setAppointment(appointment);
        review.setScore(reviewDTO.getScore());
        review.setText(reviewDTO.getText());

        return review;
    }

    public static ReviewDTO convertToDTO(Review review) {
        ReviewDTO reviewDTO = new ReviewDTO();

        reviewDTO.setId(review.getId());
        reviewDTO.setAppointmentId(review.getAppointment().getId());
        reviewDTO.setScore(review.getScore());
        reviewDTO.setText(review.getText());

        return reviewDTO;
    }
}
