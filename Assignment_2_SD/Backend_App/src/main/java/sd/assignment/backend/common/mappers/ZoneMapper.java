package sd.assignment.backend.common.mappers;

import sd.assignment.backend.dtos.ZoneDTO;
import sd.assignment.backend.entities.Zone;

public class ZoneMapper {
    public static Zone convertToEntity(ZoneDTO zoneDTO) {
        Zone zone = new Zone();

        zone.setId(zoneDTO.getId());
        zone.setName(zoneDTO.getName());
        zone.setCity(zoneDTO.getCity());

        return zone;
    }

    public static ZoneDTO convertToDTO(Zone zone) {
        ZoneDTO zoneDTO = new ZoneDTO();

        zoneDTO.setId(zone.getId());
        zoneDTO.setName(zone.getName());
        zoneDTO.setCity(zone.getCity());

        return zoneDTO;
    }
}
