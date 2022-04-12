package sd.assignment_1_sd.entity;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "destination")
@Getter
@Setter
@RequiredArgsConstructor
@AllArgsConstructor
public class Destination {
    @Id
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    private String id;

    @Column(unique = true, nullable = false)
    private String name;

    @Column
    private String description;

    @OneToMany(mappedBy = "destination", fetch = FetchType.EAGER, orphanRemoval = true)
    private List<VacationPackage> vacationPackages;
}
