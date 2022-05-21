package api.backend_app.entities;

import api.backend_app.common.enums.AppointmentState;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "appointment")
@Getter
@Setter
@RequiredArgsConstructor
@AllArgsConstructor
public final class Appointment {
    @Id
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    private String id;

    @Column(nullable = false)
    private LocalDateTime dateTime;

    @Enumerated(EnumType.STRING)
    private AppointmentState appointmentState;

    @ManyToOne
    @JoinColumn(name = "pet_id")
    private Pet pet;

    @ManyToMany(mappedBy = "appointments", fetch = FetchType.EAGER)
    private List<Facility> facilities;

    @OneToMany(mappedBy = "appointment")
    private List<Result> results;

    @OneToMany(mappedBy = "appointment")
    private List<Review> reviews;
}
