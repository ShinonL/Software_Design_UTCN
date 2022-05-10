package sd.assignment.backend_app.services;

import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sd.assignment.backend_app.common.mappers.RestaurantMapper;
import sd.assignment.backend_app.common.mappers.ZoneMapper;
import sd.assignment.backend_app.dtos.ZoneDTO;
import sd.assignment.backend_app.repositories.ZoneRepository;

import java.util.List;
import java.util.stream.Collectors;

@Slf4j
@Service
public class ZoneService {
    @Autowired
    private ZoneRepository zoneRepository;

    private final Logger logger = LoggerFactory.getLogger(ZoneService.class);

    public List<ZoneDTO> getZones() throws Exception {
        logger.info("Retrieving delivery zones ");
        return zoneRepository.findAll()
                .stream()
                .map(ZoneMapper::convertToDTO)
                .collect(Collectors.toList());
    }
}
