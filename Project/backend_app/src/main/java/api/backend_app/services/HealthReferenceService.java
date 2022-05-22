package api.backend_app.services;

import api.backend_app.common.exceptions.NotFoundException;
import api.backend_app.common.mappers.HealthReferenceMapper;
import api.backend_app.dtos.HealthReferenceDTO;
import api.backend_app.entities.HealthReference;
import api.backend_app.entities.PetType;
import api.backend_app.repositories.HealthReferenceRepository;
import api.backend_app.repositories.PetTypeRepository;
import api.backend_app.validators.HealthReferenceValidator;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * This Service deals with methods specific to the `pet` and `pet_type` entities
 */
@Slf4j
@Service
public class HealthReferenceService {
    /**
     * The health reference repository deals with running sql commands specific to the `health_reference` table
     */
    @Autowired
    private HealthReferenceRepository healthReferenceRepository;
    /**
     * The pet type repository deals with running sql commands specific to the `pet_type` table
     */
    @Autowired
    private PetTypeRepository petTypeRepository;
    /**
     * Used for logging the steps taken.
     */
    private final Logger logger = LoggerFactory.getLogger(HealthReferenceService.class);

    /**
     * Create a new health Reference with the given details
     * @param healthReferenceDTO the details of the new health Reference
     * @throws Exception if any of the details are invalid or if it couldn't access the DB
     */
    public void createHealthReference(HealthReferenceDTO healthReferenceDTO) throws Exception {
        logger.info("Validating the health reference details");
        HealthReferenceValidator.isHealthReferenceValid(healthReferenceDTO);

        Optional<PetType> petType = petTypeRepository.findById(healthReferenceDTO.getPetTypeId());
        if (petType.isEmpty()) {
            logger.error("Pet type " + healthReferenceDTO.getPetTypeId() + " was not found");
            throw new NotFoundException("Pet type not found");
        }

        HealthReference healthReference = HealthReferenceMapper.convertToEntity(healthReferenceDTO, petType.get());

        logger.info("Saving the health reference details");
        healthReferenceRepository.save(healthReference);
    }

    /**
     * Retrieve all available health references
     * @return a list with all health references
     * @throws Exception if there is any problem with the DB connection
     */
    public List<HealthReferenceDTO> findHealthReferencesByPetType(String petTypeId) throws Exception {
        logger.info("Retrieving all health references");
        return healthReferenceRepository.findByPetType(petTypeId)
                .stream()
                .map(HealthReferenceMapper::convertToDTO)
                .collect(Collectors.toList());
    }
}
