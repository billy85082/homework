package main.java.dao;

import main.java.model.message;
import main.java.util.HibernateUtil;
import java.util.List;


public class messageDao {

    HibernateUtil hibernateUtil = new HibernateUtil();

    public List<message> getall(int now,int showpage,int allcount) {
        return hibernateUtil.getAllUsers(message.class,now,showpage,allcount);
    }

    public message getallbyid(int id) {
        return hibernateUtil.getMessageById(id, message.class);
    }

    public <T> void updata(final T entity){
        hibernateUtil.update(entity);
    }

    public void delete(int id) {
        hibernateUtil.deleteUser(id,message.class);
    }

    public <T> void creat(final T entity) {    	
        hibernateUtil.create(entity);
    }

    public int  pagecount(int showpage){
        return hibernateUtil.pagecount(message.class,showpage);
    }
    public int allcount(){
        return hibernateUtil.allcount(message.class);
    }
}
