package sd.assignment.backend.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;
import sd.assignment.backend.common.enums.Category;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "food")
@Getter
@Setter
@RequiredArgsConstructor
@AllArgsConstructor
public final class Food {
    @Id
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    private String id;

    @Enumerated(EnumType.STRING)
    private Category category;

    @Column
    private String name;

    @Column
    private String description;

    @Column
    private Double price;

    @ManyToOne
    @JoinColumn(name="restaurant_id")
    private Restaurant restaurant;

    @OneToMany(mappedBy = "food")
    private List<Cart> carts;

    @OneToMany(mappedBy = "food")
    private List<OrderDetails> orderDetails;
}
