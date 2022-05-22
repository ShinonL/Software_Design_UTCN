package api.backend_app.dtos;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReviewDTO {
    private String id;
    private int score;
    private String text;
    private String facilityId;
}
