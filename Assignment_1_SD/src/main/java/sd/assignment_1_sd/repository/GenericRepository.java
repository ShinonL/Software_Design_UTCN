package sd.assignment_1_sd.repository;

import lombok.Getter;
import javax.persistence.*;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

@Getter
public class GenericRepository<T, ID>{
    private Class<T> table;
    private final EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("Assignment_1_SD");

    public GenericRepository(Class<T> table) {
        this.table = table;
    }

    public void add(T object) throws Exception {
        EntityManager em = entityManagerFactory.createEntityManager();
        em.getTransaction().begin();

        try {
            em.persist(object);
        } catch(Exception ex) {
            System.out.println(ex.getMessage());
            throw new Exception("ERROR: Did not add to the " + table.getSimpleName() + " list.");
        }

        em.getTransaction().commit();
        em.close();
    }

    public List<T> findAll() {
        EntityManager em = entityManagerFactory.createEntityManager();
        em.getTransaction().begin();

        List<T> result = null;
        try {
            result = (List<T>) em.createQuery("SELECT x from " + table.getSimpleName() + " x").getResultList();
        } catch(NoResultException ignored) { }

        em.getTransaction().commit();
        em.close();

        return result;
    }

    public T findById(ID id) throws Exception {
        EntityManager em = entityManagerFactory.createEntityManager();
        em.getTransaction().begin();

        T result = null;
        try {
            result = em.find(table, id);
        } catch(Exception ignored) { }

        em.getTransaction().commit();
        em.close();

        return result;
    }

    public List<T> findByString(String field, String value) {
        EntityManager em = entityManagerFactory.createEntityManager();
        em.getTransaction().begin();

        List<T> result = new ArrayList<>();
        try {
            result = (List<T>) em.createQuery("SELECT x from " + table.getSimpleName() + " x where x." + field + "= ?1")
                    .setParameter(1, value).getResultList();
        } catch(Exception ignored) { }

        em.getTransaction().commit();
        em.close();

        return result;
    }

    public void update(T object) throws Exception {
        EntityManager em = entityManagerFactory.createEntityManager();
        em.getTransaction().begin();

        try {
            em.merge(object);
        } catch(Exception ex) {
            ex.printStackTrace();
            throw new Exception("ERROR: Did not update the " + table.getSimpleName() + " list.");
        }

        em.getTransaction().commit();
        em.close();
    }

    public void deleteByName(String name) throws Exception {
        EntityManager em = entityManagerFactory.createEntityManager();
        em.getTransaction().begin();

        try {
            T foundObject = findByString("name", name).get(0);
            if (foundObject != null)
                em.remove(em.contains(foundObject) ? foundObject : em.merge(foundObject));
        } catch(Exception ex) {
            throw new Exception("ERROR: Did not delete from the " + table.getSimpleName() + " list.");
        }

        em.getTransaction().commit();
        em.close();
    }
}