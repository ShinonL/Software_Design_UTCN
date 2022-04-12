package sd.assignment.backend_app.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;
import sd.assignment.backend_app.common.enums.OrderState;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "order")
@Getter
@Setter
@RequiredArgsConstructor
@AllArgsConstructor
public final class Order {
    @Id
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    private String id;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @Enumerated(EnumType.STRING)
    private OrderState orderState;

    @Column
    private String location;

    @ManyToOne
    @JoinColumn(name = "zone_id")
    private Zone zone;

    @OneToMany(mappedBy = "order")
    private List<OrderDetails> orderDetails;

    @Column
    private Double totalAmount;
}
