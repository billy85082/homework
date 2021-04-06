package main.java.util;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import main.java.model.message;

import java.sql.Date;
import java.util.*;


public class HibernateUtil {
	
	
    private  final SessionFactory sessionFactory = buildSessionFactory();

    private  SessionFactory buildSessionFactory() {
        try {
            // Create the SessionFactory from hibernate.cfg.xml
            return new Configuration().configure().buildSessionFactory();
        } catch (Throwable ex) {
            // Make sure you log the exception, as it might be swallowed
            System.err.println("Initial SessionFactory creation failed." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }

    /**
         *
         * @param entityclass
         * @param <T>
         * @return
         */
    public <T> int pagecount(Class<T> entityclass,int showpage){
        int count = 0;
        Session session = sessionFactory.openSession();
        try {
            Query query = session.createQuery("select count(*) from "+entityclass.getName());
            if(((Number)query.uniqueResult()).intValue() % showpage == 0){
                count = ((Number)query.uniqueResult()).intValue() / showpage;
            }
            else {
                count = ((Number)query.uniqueResult()).intValue() / showpage +1;
            }
        } catch (RuntimeException e) {
            e.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }
        return count;
    }

    /**
     *
     * @param entityclass
     * @param <T>
     * @return
     */
    public <T> int allcount(Class<T> entityclass){
        int allcount = 0;
        Session session = sessionFactory.openSession();
        try {
            Query query = session.createQuery("select count(*) from "+entityclass.getName());
            allcount = ((Number)query.uniqueResult()).intValue();
        } catch (RuntimeException e) {
            e.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }
        return allcount;
    }
    /**
         * @param entityclass
         * @param <T>
         * @return
         */
    public <T> List<T> getAllMessages(Class<T> entityclass,int now,int showpage,int Allcount) {
        List<T> entity = new ArrayList<T>();
        Session session = sessionFactory.openSession();
        int a = Allcount-showpage-(now-1)*showpage;
        if(Allcount-showpage-(now-1)*showpage <= 0){
            showpage = Allcount%showpage;
            a = 0;
        }
        try {
            final Query query = session.createQuery("from "+entityclass.getName());
            query.setFirstResult(a);
            query.setMaxResults(showpage);
            entity = query.list();
        } catch (RuntimeException e) {
            e.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }
        return entity;
    }

    /**
         *
         * @param id
         * @param entityclass
         * @param <T>
         * @return
         */
    public <T> T getMessageById(int id,Class<T> entityclass) {
        T entity = null;
        Session session = sessionFactory.openSession();
        try {
            entity = (T) session.get(entityclass,id);
        } catch (RuntimeException e) {
            e.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }
        return entity;
    }

    /**
     *
     * @param account
     * @param entityclass
     * @param <T>
     * @return
     */
//    public <T> boolean getbyaccount(String account,String password,Class<T> entityclass) {
//        boolean result = false;
//        List<T> list = null;
//        Session session = sessionFactory.openSession();
//        try {
//            Query query = session.createQuery("from user u where u.account = ? and u.password = ?");
//            query.setString(0, account);
//            query.setString(1, password);
//            list = query.list();
//            if(list.size()>0){
//                result =  true;
//            }
//            else{
//                result =  false;
//            }
//
//        } catch (RuntimeException e) {
//            e.printStackTrace();
//        } finally {
//            session.flush();
//            session.close();
//        }
//        return result;
//    }
    /**
         *
         * @param id
         * @param entityclass
         * @param <T>
         */
    public <T> void deleteMessage(int id,Class<T> entityclass) {
        Transaction trns = null;
        Session session = sessionFactory.openSession();        
        try {
            trns = session.beginTransaction();
            T entity = (T) session.load(entityclass, new Integer(id));
            session.delete(entity);
            session.getTransaction().commit();
        } catch (RuntimeException e) {
            if (trns != null) {
                trns.rollback();
            }
            e.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }
    }

    /**
         *
         * @param entity
         * @param <T>
         */
    public <T> void update(final T entity) {
        Transaction trns = null;
        Session session = sessionFactory.openSession();
        try {
            trns = session.beginTransaction();
            session.update(entity);
            session.getTransaction().commit();
        } catch (RuntimeException e) {
            if (trns != null) {
                trns.rollback();
            }
            e.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }
    }

    /**
         *
         * @param entity
         * @param <T>
         */
    public <T>  void create(final T entity) {    	
        Transaction trns = null;        
        Session session = sessionFactory.openSession();
        try {
            trns = session.beginTransaction();           
            session.save(entity);            
            session.getTransaction().commit();            
        } catch (RuntimeException e) {
            if (trns != null) {
                trns.rollback();
            }
            e.printStackTrace();
        } finally {
            session.flush();            
            session.close();            
        }
    }
}
