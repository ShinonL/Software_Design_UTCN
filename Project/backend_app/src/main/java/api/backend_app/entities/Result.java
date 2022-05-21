package api.backend_app.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

@Entity
@Table(name = "result")
@Getter
@Setter
@RequiredArgsConstructor
@AllArgsConstructor
public final class Result {
    @Id
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    private String id;

    @Column(nullable = false)
    private String observation = "N/A";

    @Column(nullable = false)
    private String details = "N/A";

    @ManyToOne
    @JoinColumn(name = "appointment_id")
    private Appointment appointment;
}
