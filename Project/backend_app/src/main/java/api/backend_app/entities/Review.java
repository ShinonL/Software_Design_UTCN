package api.backend_app.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

@Entity
@Table(name = "review")
@Getter
@Setter
@RequiredArgsConstructor
@AllArgsConstructor
public final class Review {
    @Id
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    private String id;

    @Column(nullable = false)
    private int score = 0;

    @Column(nullable = false)
    private String text = "N/A";

    @ManyToOne
    @JoinColumn(name = "facility_id")
    private Facility facility;
}
