package api.backend_app.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "pet_type")
@Getter
@Setter
@RequiredArgsConstructor
@AllArgsConstructor
public final class PetType {
    @Id
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    private String id;

    @Column(nullable = false)
    private String type;

    @OneToMany(mappedBy = "petType")
    private List<Pet> pets;

    @OneToMany(mappedBy = "petType")
    private List<HealthReference> healthReferences;
}
