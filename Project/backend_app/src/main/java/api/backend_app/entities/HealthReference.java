package api.backend_app.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

@Entity
@Table(name = "health_reference")
@Getter
@Setter
@RequiredArgsConstructor
@AllArgsConstructor
public final class HealthReference {
    @Id
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    private String id;

    @Column(nullable = false)
    private String title;

    @Column(nullable = false)
    private String text;

    @ManyToOne
    @JoinColumn(name = "healthReference")
    private PetType petType;
}
