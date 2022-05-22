package api.backend_app.services;

import api.backend_app.common.exceptions.InvalidDataException;
import api.backend_app.common.exceptions.NotFoundException;
import api.backend_app.common.mappers.FacilityMapper;
import api.backend_app.common.mappers.PetMapper;
import api.backend_app.common.mappers.PetTypeMapper;
import api.backend_app.dtos.FacilityDTO;
import api.backend_app.dtos.PetDTO;
import api.backend_app.dtos.PetTypeDTO;
import api.backend_app.entities.Facility;
import api.backend_app.entities.Pet;
import api.backend_app.entities.PetType;
import api.backend_app.entities.User;
import api.backend_app.repositories.PetRepository;
import api.backend_app.repositories.PetTypeRepository;
import api.backend_app.repositories.UserRepository;
import api.backend_app.validators.FacilityValidator;
import api.backend_app.validators.PetValidator;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;
import java.util.Optional;
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
     * The pet repository deals with running sql commands specific to the `pet` table
     */
    @Autowired
    private PetRepository petRepository;
    /**
     * The user repository deals with running sql commands specific to the `user` table
     */
    @Autowired
    private UserRepository userRepository;
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

        logger.info("Saving the pet type details");
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

    /**
     * Create a new pet type with the given details
     * @param petDTO the details of the new facility
     * @throws Exception if any o the details are invalid or if it couldn't access the DB
     */
    public void createPet(PetDTO petDTO) throws Exception {
        logger.info("Validating the pet type details");
        PetValidator.isPetValid(petDTO);

        Optional<PetType> petType = petTypeRepository.findById(petDTO.getPetType().getId());
        if (petType.isEmpty()) {
            logger.error("This pet type does not exist.");
            throw new NotFoundException("This pet type does not exist.");
        }

        User user = userRepository.findByUsername(petDTO.getUser().getUsername());
        if (user == null) {
            logger.error("This user does not exist.");
            throw new NotFoundException("This user does not exist.");
        }

        Pet pet = PetMapper.convertToEntity(petDTO, user, Collections.emptyList(), petType.get());

        logger.info("Saving the pet details");
        petRepository.save(pet);
    }

    /**
     * Retrieve all pet for a specific user
     * @param username the username of the pet owner
     * @return a list with all pets of that user
     * @throws Exception if there is any problem with the DB connection
     */
    public List<PetDTO> findPetByUsername(String username) throws Exception {
        logger.info("Retrieving all pets for user " + username);
        return petRepository.findByUsername(username)
                .stream()
                .map(PetMapper::convertToDTO)
                .collect(Collectors.toList());
    }
}
