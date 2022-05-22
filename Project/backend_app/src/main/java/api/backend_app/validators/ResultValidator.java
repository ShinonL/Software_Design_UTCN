package api.backend_app.validators;

import api.backend_app.common.exceptions.InvalidDataException;
import api.backend_app.dtos.ResultDTO;

public class ResultValidator {
    public static void isResultValid(ResultDTO resultDTO) throws Exception {
        isValidDetails(resultDTO.getDetails());
        isValidObservation(resultDTO.getObservation());
    }

    public static void isValidDetails(String details) throws InvalidDataException {
        if (details == null || details.isEmpty())
            throw new InvalidDataException("Please insert some details.");
    }

    public static void isValidObservation(String observation) throws InvalidDataException {
        if (observation == null || observation.isEmpty())
            throw new InvalidDataException("Please insert an observation.");
    }
}
