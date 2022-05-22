package api.backend_app.validators;

import api.backend_app.common.exceptions.InvalidDataException;
import api.backend_app.dtos.HealthReferenceDTO;

public class HealthReferenceValidator {
    public static void isHealthReferenceValid(HealthReferenceDTO healthReferenceDTO) throws Exception {
        isValidTitle(healthReferenceDTO.getTitle());
        isValidText(healthReferenceDTO.getText());
    }

    public static void isValidTitle(String title) throws InvalidDataException {
        if (title == null || title.isEmpty())
            throw new InvalidDataException("Please insert a title.");
    }

    public static void isValidText(String text) throws InvalidDataException {
        if (text == null || text.isEmpty())
            throw new InvalidDataException("Please insert some text.");
    }
}
