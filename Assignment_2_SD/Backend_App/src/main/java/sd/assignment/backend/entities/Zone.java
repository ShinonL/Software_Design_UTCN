package sd.assignment.backend.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "zone")
@Getter
@Setter
@RequiredArgsConstructor
@AllArgsConstructor
public final class Zone {
    @Id
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    private String id;

    @Column
    private String name;

    @Column
    private String city;

    @ManyToMany(mappedBy = "zones", fetch = FetchType.EAGER)
    private List<Restaurant> restaurants;

    @OneToMany(mappedBy = "zone")
    private List<Order> orders;

    public void addRestaurant(Restaurant restaurant) {
        if (restaurants == null)
            restaurants = new ArrayList<>();

        restaurants.add(restaurant);
    }
}
