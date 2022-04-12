package sd.assignment_1_sd.repository;

import sd.assignment_1_sd.entity.User;
import sd.assignment_1_sd.entity.VacationPackage;
import sd.assignment_1_sd.entity.enums.Status;

import javax.persistence.EntityManager;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class VacationPackageRepository extends GenericRepository<VacationPackage, String> {
    private final UserRepository userRepository = new UserRepository();

    public VacationPackageRepository() {
        super(VacationPackage.class);
    }

    public List<VacationPackage> findMyBookings(String username) {
        EntityManager em = super.getEntityManagerFactory().createEntityManager();
        em.getTransaction().begin();

        List<VacationPackage> vacationPackages = new ArrayList<>();
        try {
            List<User> users = userRepository.findByString("username", username);
            if (users.size() > 0)
                vacationPackages = users.get(0).getVacationPackages();
        } catch (Exception ignored) { }

        em.getTransaction().commit();
        em.close();

        return vacationPackages;
    }

    public VacationPackage findByName(String name) {
        List<VacationPackage> vacationPackages = findByString("name", name);
        return vacationPackages.isEmpty() ? null : vacationPackages.get(0);
    }

    public void delete(String name) throws Exception {
        VacationPackage vacationPackage = findByName(name);

        for (User user: vacationPackage.getUsers())
            user.removeVacationPackage(vacationPackage);

        deleteByName(name);
    }

    public List<VacationPackage> findByDestination(String destinationName, boolean isAvailableTable) {
        EntityManager em = super.getEntityManagerFactory().createEntityManager();
        em.getTransaction().begin();

        List<VacationPackage> result = new ArrayList<>();
        String isDifferent = isAvailableTable ? "<>" : "=";
        try {
            result = (List<VacationPackage>) em.createQuery("SELECT vp from VacationPackage vp where vp.destination.name = ?1 and vp.status " + isDifferent + "?2")
                    .setParameter(1, destinationName)
                    .setParameter(2, Status.BOOKED)
                    .getResultList();
        } catch(Exception ignored) { }

        em.getTransaction().commit();
        em.close();

        return result;
    }

    public List<VacationPackage> findByPrice(Double minPrice, Double maxPrice, boolean isAvailableTable) {
        EntityManager em = super.getEntityManagerFactory().createEntityManager();
        em.getTransaction().begin();

        List<VacationPackage> result = new ArrayList<>();
        String isDifferent = isAvailableTable ? "<>" : "=";
        try {
            result = (List<VacationPackage>) em.createQuery("SELECT x from VacationPackage x where x.price <= ?1 and x.price >= ?2 and x.status " + isDifferent + "?3")
                    .setParameter(1, maxPrice)
                    .setParameter(2, minPrice)
                    .setParameter(3, Status.BOOKED)
                    .getResultList();
        } catch(Exception ignored) { }

        em.getTransaction().commit();
        em.close();

        return result;
    }

    public List<VacationPackage> findByPeriod(LocalDate startDate, LocalDate endDate, boolean isAvailableTable) {
        EntityManager em = super.getEntityManagerFactory().createEntityManager();
        em.getTransaction().begin();

        List<VacationPackage> result = new ArrayList<>();
        String isDifferent = isAvailableTable ? "<>" : "=";
        try {
            result = (List<VacationPackage>) em
                    .createQuery("SELECT x from VacationPackage x where x.endDate <= ?1 and x.startDate >= ?2 and x.status " + isDifferent + "?3")
                    .setParameter(1, endDate)
                    .setParameter(2, startDate)
                    .setParameter(3, Status.BOOKED)
                    .getResultList();
        } catch(Exception ignored) { }

        em.getTransaction().commit();
        em.close();

        return result;
    }

    public List<VacationPackage> findAvailable() {
        EntityManager em = super.getEntityManagerFactory().createEntityManager();
        em.getTransaction().begin();

        List<VacationPackage> result = new ArrayList<>();
        try {
            result = (List<VacationPackage>) em
                    .createQuery("SELECT x from VacationPackage x where x.status <> ?1")
                    .setParameter(1, Status.BOOKED)
                    .getResultList();
        } catch(Exception ex) {
            ex.printStackTrace();
        }

        em.getTransaction().commit();
        em.close();

        return result;
    }
}
