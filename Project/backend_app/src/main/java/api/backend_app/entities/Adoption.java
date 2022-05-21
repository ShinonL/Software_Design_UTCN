package api.backend_app.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "adoption")
@Getter
@Setter
@RequiredArgsConstructor
@AllArgsConstructor
public final class Adoption {
    @Id
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    private String id;

    @Column(nullable = false)
    private Boolean adopted = false;

    @Column(nullable = false)
    private String description;

    @Column(nullable = false)
    private LocalDate rescueDate;

    @Column(nullable = false)
    private LocalDate adoptionDate;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "pet_id", referencedColumnName = "id")
    private Pet pet;
}
