package api.backend_app.services;

import api.backend_app.common.mappers.FacilityMapper;
import api.backend_app.common.mappers.PetTypeMapper;
import api.backend_app.dtos.FacilityDTO;
import api.backend_app.dtos.PetTypeDTO;
import api.backend_app.entities.Facility;
import api.backend_app.entities.PetType;
import api.backend_app.repositories.PetTypeRepository;
import api.backend_app.validators.FacilityValidator;
import api.backend_app.validators.PetValidator;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

/**
 * This Service deals with methods specific to the `pet` and `pet_type` entities
 */
@Slf4j
@Service
public class PetService {
    /**
     * The pet type repository deals with running sql commands specific to the `pet_type` table
     */
    @Autowired
    private PetTypeRepository petTypeRepository;
    /**
     * Used for logging the steps taken.
     */
    private final Logger logger = LoggerFactory.getLogger(UserService.class);

    /**
     * Create a new pet type with the given details
     * @param petTypeDTO the details of the new facility
     * @throws Exception if any o the details are invalid or if it couldn't access the DB
     */
    public void createPetType(PetTypeDTO petTypeDTO) throws Exception {
        logger.info("Validating the pet type details");
        PetValidator.isPetTypeValid(petTypeDTO, petTypeRepository);

        PetType petType = PetTypeMapper.convertToEntity(petTypeDTO, Collections.emptyList(), Collections.emptyList());

        logger.info("Saving the facility details");
        petTypeRepository.save(petType);
    }

    /**
     * Retrieve all available pet types
     * @return a list with all pet types
     * @throws Exception if there is any problem with the DB connection
     */
    public List<PetTypeDTO> findPetTypes() throws Exception {
        logger.info("Retrieving all pet types");
        return petTypeRepository.findAll()
                .stream()
                .map(PetTypeMapper::convertToDTO)
                .collect(Collectors.toList());
    }
}
