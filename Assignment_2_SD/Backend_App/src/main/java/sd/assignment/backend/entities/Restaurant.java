package sd.assignment.backend.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "restaurant")
@Getter
@Setter
@RequiredArgsConstructor
@AllArgsConstructor
public final class Restaurant {
    @Id
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    private String id;

    @Column
    private String name;

    @Column
    private String location;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "restaurant_zone",
            joinColumns = @JoinColumn(name = "restaurant_id"),
            inverseJoinColumns = @JoinColumn(name = "zone_id"))
    private List<Zone> zones;

    @ManyToOne
    @JoinColumn(name="admin_id")
    private Admin admin;

    @OneToMany(mappedBy = "restaurant")
    private List<Food> foods;
}
