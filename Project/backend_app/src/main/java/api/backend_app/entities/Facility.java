package api.backend_app.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "facility")
@Getter
@Setter
@RequiredArgsConstructor
@AllArgsConstructor
public final class Facility {
    @Id
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    private String id;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    private String description;

    @Column(nullable = false)
    private Double price;

    @Column(nullable = false)
    private Double score = 0.0;

    @Column(nullable = false)
    private int noAppointments = 0;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "facility_appointment",
            joinColumns = @JoinColumn(name = "facility_id"),
            inverseJoinColumns = @JoinColumn(name = "appointment_id"))
    private List<Appointment> appointments;

    @OneToMany(mappedBy = "facility")
    private List<Review> reviews;

    public void addAppointment(Appointment appointment) {
        if (appointments == null)
            appointments = new ArrayList<>();

        appointments.add(appointment);
    }
}
