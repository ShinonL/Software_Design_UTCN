package sd.assignment.backend.services;

import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sd.assignment.backend.common.mappers.ZoneMapper;
import sd.assignment.backend.dtos.ZoneDTO;
import sd.assignment.backend.repositories.ZoneRepository;

import java.util.List;
import java.util.stream.Collectors;

/**
 * This Service deals with methods specific to the `user` entity
 */
@Slf4j
@Service
public class ZoneService {
    /**
     * The zone repository deals with running sql commands specific to the `zone` table
     */
    @Autowired
    private ZoneRepository zoneRepository;
    /**
     * Used for logging the steps taken.
     */
    private final Logger logger = LoggerFactory.getLogger(ZoneService.class);

    /**
     * Retrieve all available delivery zones
     * @return a list with all delivery zones
     * @throws Exception if there is any problem with the DB connection
     */
    public List<ZoneDTO> getZones() throws Exception {
        logger.info("Retrieving delivery zones ");
        return zoneRepository.findAll()
                .stream()
                .map(ZoneMapper::convertToDTO)
                .collect(Collectors.toList());
    }
}
