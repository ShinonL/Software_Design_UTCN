package sd.assignment.backend_app.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sd.assignment.backend_app.common.mappers.RestaurantMapper;
import sd.assignment.backend_app.common.mappers.ZoneMapper;
import sd.assignment.backend_app.dtos.ZoneDTO;
import sd.assignment.backend_app.repositories.ZoneRepository;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class ZoneService {
    @Autowired
    private ZoneRepository zoneRepository;

    public List<ZoneDTO> getZones() throws Exception {
        return zoneRepository.findAll()
                .stream()
                .map(ZoneMapper::convertToDTO)
                .collect(Collectors.toList());
    }
}
