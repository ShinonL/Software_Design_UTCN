package sd.assignment_1_sd.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import sd.assignment_1_sd.entity.User;
import sd.assignment_1_sd.entity.enums.Status;

import java.time.LocalDate;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
public class VacationPackageDTO {
    private String id;
    private String name;
    private double price;
    private LocalDate startDate;
    private LocalDate endDate;
    private String extraDetails;
    private int noPeople;
    private int leftPackages;
    private Status status;
    private String destinationName;

    private List<User> users;
}
