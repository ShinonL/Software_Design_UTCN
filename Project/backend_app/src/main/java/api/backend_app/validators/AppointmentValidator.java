package api.backend_app.validators;

import api.backend_app.common.exceptions.InvalidDataException;
import api.backend_app.dtos.AppointmentDTO;

import java.time.LocalDateTime;

public class AppointmentValidator {
    public static void isAppointmentValid(AppointmentDTO appointmentDTO) throws InvalidDataException {
        if (appointmentDTO.getDateTime().isBefore(LocalDateTime.now()))
            throw new InvalidDataException("The appointment must be in the future");

        if (appointmentDTO.getDateTime().getYear() - LocalDateTime.now().getYear() > 1)
            throw new InvalidDataException("The appointment must be in the near future");
    }
}
