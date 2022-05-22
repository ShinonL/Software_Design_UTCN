package api.backend_app.common.mappers;

import api.backend_app.dtos.PetDTO;
import api.backend_app.entities.Appointment;
import api.backend_app.entities.Pet;
import api.backend_app.entities.PetType;
import api.backend_app.entities.User;

import java.util.List;
import java.util.stream.Collectors;

public class PetMapper {
    public static Pet convertToEntity(PetDTO petDTO, User user, List<Appointment> appointments, PetType petType) {
        Pet pet = new Pet();

        pet.setId(petDTO.getId());
        pet.setAge(petDTO.getAge());
        pet.setName(petDTO.getName());
        pet.setUser(user);
        pet.setAppointments(appointments);
        pet.setPetType(petType);

        return pet;
    }

    public static PetDTO convertToDTO(Pet pet) {
        PetDTO petDTO = new PetDTO();

        petDTO.setId(pet.getId());
        petDTO.setAge(pet.getAge());
        petDTO.setName(pet.getName());
        petDTO.setUser(UserMapper.convertToDTO(pet.getUser()));
        petDTO.setAppointments(
                pet.getAppointments().stream()
                        .map(AppointmentMapper::convertToDTO)
                        .collect(Collectors.toList())
        );
        petDTO.setPetType(PetTypeMapper.convertToDTO(pet.getPetType()));

        return petDTO;
    }
}
