package sd.assignment.backend_app.common.mappers;

import sd.assignment.backend_app.dtos.ZoneDTO;
import sd.assignment.backend_app.entities.Zone;

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
