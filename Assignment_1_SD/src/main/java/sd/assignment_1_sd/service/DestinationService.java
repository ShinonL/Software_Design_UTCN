package sd.assignment_1_sd.service;

import sd.assignment_1_sd.dto.DestinationDTO;
import sd.assignment_1_sd.entity.Destination;
import sd.assignment_1_sd.entity.VacationPackage;
import sd.assignment_1_sd.repository.DestinationRepository;
import sd.assignment_1_sd.repository.VacationPackageRepository;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class DestinationService {
    private final DestinationRepository destinationRepository = new DestinationRepository();
    private final VacationPackageRepository vacationPackageRepository = new VacationPackageRepository();

    public List<String> getDestinationNames() {
        return destinationRepository.findAll().stream()
                .map(Destination::getName)
                .collect(Collectors.toList());
    }

    public List<DestinationDTO> findAllDestinations() {
        return destinationRepository.findAll().stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
    }

    public void addDestination(DestinationDTO destination) throws Exception {
        try {
            isDestinationValid(destination);

            Destination newDestination = convertToEntity(destination);
            newDestination.setVacationPackages(new ArrayList<>());
            destinationRepository.add(newDestination);
        } catch (Exception ex) {
            throw new Exception("Couldn't add the new destination.");
        }
    }

    public void deleteDestination(String destinationName) throws Exception {
        try {
            Destination destination = destinationRepository.findByName(destinationName);

            if (destination == null)
                throw new Exception();

            for (VacationPackage vacationPackage : destination.getVacationPackages())
                vacationPackageRepository.deleteByName(vacationPackage.getName());

            destinationRepository.deleteByName(destination.getName());
        } catch (Exception ex) {
            throw new Exception("Couldn't delete the destination.");
        }
    }

    private void isDestinationValid(DestinationDTO destinationDTO) throws Exception {
        if (destinationDTO.getName().isEmpty())
            throw new Exception("Please insert a destination name.");

        Destination destination = destinationRepository.findByName(destinationDTO.getName());

        if (destination != null)
            throw new Exception("Please insert a new destination name.");
    }

    private DestinationDTO convertToDTO(Destination destination) {
        DestinationDTO destinationDTO = new DestinationDTO();

        destinationDTO.setId(destination.getId());
        destinationDTO.setName(destination.getName());
        destinationDTO.setDescription(destination.getDescription());

        return destinationDTO;
    }

    private Destination convertToEntity(DestinationDTO destinationDTO) {
        Destination destination = new Destination();

        destination.setId(destinationDTO.getId());
        destination.setName(destinationDTO.getName());
        destination.setDescription(destinationDTO.getDescription());

        return destination;
    }
}
