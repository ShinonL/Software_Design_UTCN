package sd.assignment_1_sd.service;

import sd.assignment_1_sd.dto.VacationPackageDTO;
import sd.assignment_1_sd.entity.Destination;
import sd.assignment_1_sd.entity.VacationPackage;
import sd.assignment_1_sd.entity.enums.Status;
import sd.assignment_1_sd.repository.DestinationRepository;
import sd.assignment_1_sd.repository.VacationPackageRepository;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class VacationPackageService {
    private static final VacationPackageRepository vacationPackageRepository = new VacationPackageRepository();
    private static final DestinationRepository destinationRepository = new DestinationRepository();

    public void addVacationPackage(VacationPackageDTO vacationPackage) throws Exception {
        isVacationPackageValid(vacationPackage, false);

        VacationPackage newVacationPackage = convertToEntity(vacationPackage);
        newVacationPackage.setLeftPackages(vacationPackage.getNoPeople());
        vacationPackageRepository.add(newVacationPackage);
    }

    public void deleteVacationPackage(String vacationPackageName) throws Exception {
        try {
            vacationPackageRepository.delete(vacationPackageName);
        } catch (Exception ex) {
            throw new Exception("Couldn't delete the vacation package.");
        }
    }

    public void editVacationPackage(VacationPackageDTO vacationPackage, String previousName) throws Exception {
        try {
            boolean skipNameValidation = vacationPackage.getName().equals(previousName);
            isVacationPackageValid(vacationPackage, skipNameValidation);
            vacationPackageRepository.update(convertToEntity(vacationPackage));
        } catch (Exception ex) {
            throw new Exception("Couldn't update the vacation package.");
        }
    }

    public List<VacationPackageDTO> findAllVacationPackages() throws Exception {
        try {
            List<VacationPackage> vacationPackages = vacationPackageRepository.findAll();
            if (vacationPackages == null)
                return null;

            return vacationPackages.stream()
                    .map(this::convertToDTO)
                    .collect(Collectors.toList());
        } catch (Exception ex) {
            throw new Exception("Couldn't retrieve the vacation packages.");
        }
    }

    public List<VacationPackageDTO> findAvailable() throws Exception {
        try {
            List<VacationPackage> vacationPackages = vacationPackageRepository.findAvailable();
            if (vacationPackages == null)
                return null;

            return vacationPackages.stream()
                    .map(this::convertToDTO)
                    .collect(Collectors.toList());
        } catch (Exception ex) {
            throw new Exception("Couldn't retrieve the available vacation packages.");
        }
    }

    public List<VacationPackageDTO> findMyBookings(String username) throws Exception {
        try {
            List<VacationPackage> vacationPackages = vacationPackageRepository.findMyBookings(username);

            return vacationPackages.stream()
                    .map(this::convertToDTO)
                    .collect(Collectors.toList());
        } catch (Exception ex) {
            throw new Exception("Couldn't retrieve my vacation packages.");
        }
    }

    public List<VacationPackageDTO> filterByDestination(String destinationName, boolean isAvailableTable) throws Exception {
        try {
            List<VacationPackage> vacationPackages = vacationPackageRepository.findByDestination(destinationName, isAvailableTable);

            return vacationPackages.stream()
                    .map(this::convertToDTO)
                    .collect(Collectors.toList());
        } catch (Exception ex) {
            throw new Exception("Couldn't retrieve the vacation packages.");
        }
    }

    public List<VacationPackageDTO> filterByPrice(Double minPrice, Double maxPrice, boolean isAvailableTable) throws Exception {
        try {
            List<VacationPackage> vacationPackages = vacationPackageRepository.findByPrice(minPrice, maxPrice, isAvailableTable);
            if (vacationPackages == null)
                return null;

            return vacationPackages.stream()
                    .map(this::convertToDTO)
                    .collect(Collectors.toList());
        } catch (Exception ex) {
            throw new Exception("Couldn't retrieve the vacation packages.");
        }
    }

    public List<VacationPackageDTO> filterByPeriod(LocalDate startDate, LocalDate endDate, boolean isAvailableTable) throws Exception {
        try {
            List<VacationPackage> vacationPackages = vacationPackageRepository.findByPeriod(startDate, endDate, isAvailableTable);
            if (vacationPackages == null)
                return null;

            return vacationPackages.stream()
                    .map(this::convertToDTO)
                    .collect(Collectors.toList());
        } catch (Exception ex) {
            throw new Exception("Couldn't retrieve the vacation packages.");
        }
    }

    public List<Double> getPrices(Double startValue) {
        List<Double> prices = new ArrayList<>();

        prices.add(startValue);
        for (int i = 1; i <= 10; i++)
            prices.add(prices.get(i - 1) + 100);

        return prices;
    }

    private VacationPackage convertToEntity(VacationPackageDTO vacationPackageDTO) {
        VacationPackage vacationPackage = new VacationPackage();

        vacationPackage.setId(vacationPackageDTO.getId());
        vacationPackage.setDestination(destinationRepository.findByName(vacationPackageDTO.getDestinationName()));
        vacationPackage.setName(vacationPackageDTO.getName());
        vacationPackage.setStartDate(vacationPackageDTO.getStartDate());
        vacationPackage.setEndDate(vacationPackageDTO.getEndDate());
        vacationPackage.setPrice(vacationPackageDTO.getPrice());
        vacationPackage.setNoPeople(vacationPackageDTO.getNoPeople());
        vacationPackage
                .setLeftPackages(vacationPackageDTO.getLeftPackages());
        vacationPackage.setExtraDetails(vacationPackageDTO.getExtraDetails());
        vacationPackage.setStatus(vacationPackageDTO.getStatus() == null ? Status.NOT_BOOKED : vacationPackageDTO.getStatus());
        vacationPackage.setUsers(vacationPackageDTO.getUsers());

        return vacationPackage;
    }

    private VacationPackageDTO convertToDTO(VacationPackage vacationPackage) {
        VacationPackageDTO vacationPackageDTO = new VacationPackageDTO();

        vacationPackageDTO.setId(vacationPackage.getId());
        vacationPackageDTO.setDestinationName(vacationPackage.getDestination().getName());
        vacationPackageDTO.setName(vacationPackage.getName());
        vacationPackageDTO.setStartDate(vacationPackage.getStartDate());
        vacationPackageDTO.setEndDate(vacationPackage.getEndDate());
        vacationPackageDTO.setPrice(vacationPackage.getPrice());
        vacationPackageDTO.setNoPeople(vacationPackage.getNoPeople());
        vacationPackageDTO.setLeftPackages(vacationPackage.getLeftPackages());
        vacationPackageDTO.setExtraDetails(vacationPackage.getExtraDetails());
        vacationPackageDTO.setStatus(vacationPackage.getStatus() == null ? Status.NOT_BOOKED : vacationPackage.getStatus());
        vacationPackageDTO.setUsers(vacationPackage.getUsers());

        return vacationPackageDTO;
    }

    private void isVacationPackageValid(VacationPackageDTO vacationPackage, boolean skipName) throws Exception {
        if (!skipName)
            isNameValid(vacationPackage.getName());
        isPriceValid(vacationPackage.getPrice());
        isDateValid(vacationPackage.getStartDate());
        isDateOrderValid(vacationPackage.getStartDate(), vacationPackage.getEndDate());
        isNoPeopleValid(vacationPackage.getNoPeople());
        isDestinationValid(vacationPackage.getDestinationName());
    }

    private void isNameValid(String name) throws Exception {
        name = name.trim();
        if (name.isEmpty())
            throw new Exception("Please insert a name for the package.");

        if(vacationPackageRepository.findByName(name) != null)
            throw new Exception("Please insert a NEW name for the package.");
    }

    private void isPriceValid(double price) throws Exception {
        if (price <= 0.0)
            throw new Exception("Please insert a positive price.");
    }

    private void isDateValid(LocalDate date) throws Exception {
        if (date == null)
            throw new Exception("Please select both start and end date.");

        if (date.isBefore(LocalDate.now()))
            throw new Exception("Please select future dates.");
    }

    private void isDateOrderValid(LocalDate startDate, LocalDate endDate) throws Exception {
        if (startDate.isAfter(endDate))
            throw new Exception("The start date must be BEFORE the end date.");
    }

    private void isNoPeopleValid(int noPeople) throws Exception {
        if (noPeople <= 0)
            throw new Exception("Please insert a positive number of people.");
    }

    private void isDestinationValid(String destinationName) throws Exception {
        Destination foundDestination = destinationRepository.findByName(destinationName);

        if (foundDestination == null)
            throw new Exception("This destination does not exist.");
    }
}
