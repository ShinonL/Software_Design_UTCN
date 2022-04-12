package sd.assignment_1_sd.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;
import sd.assignment_1_sd.entity.enums.Role;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "user")
@Getter
@Setter
@RequiredArgsConstructor
@AllArgsConstructor
public final class User {
    @Id
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    private String id;

    @Column(nullable = false)
    private String firstName;

    @Column
    private String lastName;

    @Column(unique = true, nullable = false)
    private String email;

    @Column
    private String phoneNumber;

    @Column(unique = true, nullable = false)
    private String username;

    @Column(nullable = false)
    private String password;

    @Enumerated(EnumType.STRING)
    private Role role;

    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinTable(name = "user_vacationpackage",
                joinColumns = @JoinColumn(name = "user_id"),
                inverseJoinColumns = @JoinColumn(name = "vacationpackage_id"))
    private List<VacationPackage> vacationPackages;

    public User(String firstName, String lastName, String email, String phoneNumber, String username, String password, Role role) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.username = username;
        this.password = password;
        this.role = role;
        this.vacationPackages = new ArrayList<>();
    }

    public void addVacationPackage(VacationPackage vacationPackage) {
        vacationPackages.add(vacationPackage);
        vacationPackage.getUsers().add(this);
    }

    public void removeVacationPackage(VacationPackage vacationPackage) {
        vacationPackages.remove(vacationPackage);
        vacationPackage.getUsers().remove(this);
    }
}
