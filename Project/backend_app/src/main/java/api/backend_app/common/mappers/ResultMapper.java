package api.backend_app.common.mappers;

import api.backend_app.dtos.ResultDTO;
import api.backend_app.entities.Appointment;
import api.backend_app.entities.Result;

public class ResultMapper {
    public static Result convertToEntity(ResultDTO resultDTO, Appointment appointment) {
        Result result = new Result();

        result.setId(resultDTO.getId());
        result.setAppointment(appointment);
        result.setDetails(resultDTO.getDetails());
        result.setObservation(resultDTO.getObservation());

        return result;
    }

    public static ResultDTO convertToDTO(Result result) {
        ResultDTO resultDTO = new ResultDTO();

        resultDTO.setId(result.getId());
        resultDTO.setAppointmentId(result.getAppointment().getId());
        resultDTO.setDetails(result.getDetails());
        resultDTO.setObservation(result.getObservation());

        return resultDTO;
    }
}
