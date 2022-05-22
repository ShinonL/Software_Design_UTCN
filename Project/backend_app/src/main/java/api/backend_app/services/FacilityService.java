package api.backend_app.services;

import api.backend_app.common.exceptions.NotFoundException;
import api.backend_app.common.mappers.FacilityMapper;
import api.backend_app.common.mappers.ReviewMapper;
import api.backend_app.dtos.FacilityDTO;
import api.backend_app.dtos.ReviewDTO;
import api.backend_app.entities.Facility;
import api.backend_app.entities.Review;
import api.backend_app.repositories.FacilityRepository;
import api.backend_app.repositories.ReviewRepository;
import api.backend_app.validators.FacilityValidator;
import api.backend_app.validators.ReviewValidator;
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
 * This Service deals with methods specific to the `facility` entity
 */
@Slf4j
@Service
public class FacilityService {
    /**
     * The facility repository deals with running sql commands specific to the `facility` table
     */
    @Autowired
    private FacilityRepository facilityRepository;
    /**
     * The review repository deals with running sql commands specific to the `review` table
     */
    @Autowired
    private ReviewRepository reviewRepository;
    /**
     * Used for logging the steps taken.
     */
    private final Logger logger = LoggerFactory.getLogger(FacilityService.class);

    /**
     * Create a new facility / user service with the given details
     * @param facilityDTO the details of the new facility
     * @throws Exception if any o the details are invalid or if it couldn't access the DB
     */
    public void createFacility(FacilityDTO facilityDTO) throws Exception {
        logger.info("Validating the facility details");
        FacilityValidator.isFacilityValid(facilityDTO, facilityRepository);

        Facility facility = FacilityMapper.convertToEntity(facilityDTO, Collections.emptyList(), Collections.emptyList());

        logger.info("Saving the facility details");
        facilityRepository.save(facility);
    }

    /**
     * Retrieve all available facilities
     * @return a list with all facilities
     * @throws Exception if there is any problem with the DB connection
     */
    public List<FacilityDTO> findFacilities() throws Exception {
        logger.info("Retrieving all facilities");
        return facilityRepository.findAll()
                .stream()
                .map(FacilityMapper::convertToDTO)
                .collect(Collectors.toList());
    }

    /**
     * Create a new review with the given details
     * @param reviewDTO the details of the new review
     * @throws Exception if any of the details are invalid or if it couldn't access the DB
     */
    public void addReviewToFacility(ReviewDTO reviewDTO) throws Exception {
        logger.info("Validating the review details");
        ReviewValidator.isReviewValid(reviewDTO);

        Optional<Facility> facilityOptional = facilityRepository.findById(reviewDTO.getFacilityId());
        if (facilityOptional.isEmpty()) {
            logger.error("Facility " + reviewDTO.getFacilityId() + " was not found");
            throw new NotFoundException("Facility was not found.");
        }

        Facility facility = facilityOptional.get();
        facility.setScore(
                (facility.getScore() * facility.getNoAppointments() + reviewDTO.getScore()) / (facility.getNoAppointments() + 1)
        );

        Review review = ReviewMapper.convertToEntity(reviewDTO, facility);

        logger.info("Saving the review details");
        reviewRepository.save(review);
    }
}
