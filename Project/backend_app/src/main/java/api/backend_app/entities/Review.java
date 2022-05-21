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

    @Column(nullable = false, columnDefinition = "integer default 0")
    private int score;

    @Column(nullable = false, columnDefinition = "nvarchar(max) default 'N/A'")
    private String text;

    @ManyToOne
    @JoinColumn(name = "appointment_id")
    private Appointment appointment;
}
