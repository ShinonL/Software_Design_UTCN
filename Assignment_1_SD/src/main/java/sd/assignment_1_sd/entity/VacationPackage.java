package sd.assignment_1_sd.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;
import sd.assignment_1_sd.entity.enums.Status;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.List;

@Entity
@Table(name = "vacationpackage")
@Getter
@Setter
@RequiredArgsConstructor
@AllArgsConstructor
public final class VacationPackage {
    @Id
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    private String id;

    @Column(unique = true, nullable = false)
    private String name;

    @Column(nullable = false)
    private double price;

    @Column(nullable = false)
    private LocalDate startDate;

    @Column(nullable = false)
    private LocalDate endDate;

    @Column
    private String extraDetails;

    @Column(nullable = false)
    private int noPeople;

    @Column(nullable = false)
    private int leftPackages;

    @Enumerated(EnumType.STRING)
    private Status status;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "destination_id")
    private Destination destination;

    @ManyToMany(mappedBy = "vacationPackages", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private List<User> users;
}

