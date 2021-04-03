package main.java.action;

import com.opensymphony.xwork2.ActionSupport;
import main.java.dao.messageDao;
import main.java.model.message;

import java.util.Collections;
import java.util.List;

public class messageAction extends ActionSupport {

    private main.java.dao.messageDao messageDao = new messageDao();
    private main.java.model.message message;
    private List<message> messageList;
    private int now = 1;
    private int pagecount = 0;
    private int showpage = 10;
    private int allcount = 0;
    


    public String welcome() throws Exception{
        allcount = messageDao.allcount();
        messageList = messageDao.getall(now,showpage,allcount);
        Collections.reverse(messageList);
        pagecount = messageDao.pagecount(showpage);
        return "SUCCESS";
    }

    public String showMessage() throws  Exception{
        message = messageDao.getallbyid(message.getNum());
        return "SUCCESS";
    }

    public String creat() throws  Exception{
        return "SUCCESS";
    }

    public String updata() throws  Exception{
        messageDao.updata(message);
        return "SUCCESS";
    }
    public String updata_show() throws  Exception{
        message = messageDao.getallbyid(message.getNum());
        return "SUCCESS";
    }

    public String add() throws  Exception{       	
        messageDao.creat(message);        
        return "SUCCESS";
    }

    public String delete() throws  Exception{
        messageDao.delete(message.getNum());
        return "SUCCESS";
    }








//set and get
    public main.java.model.message getMessage() {
        return message;
    }

    public void setMessage(main.java.model.message message) {
        this.message = message;
    }

    public List<main.java.model.message> getMessageList() {
        return messageList;
    }

    public void setMessageList(List<main.java.model.message> messageList) {
        this.messageList = messageList;
    }

    public int getNow() {
        return now;
    }

    public void setNow(int now) {
        this.now = now;
    }

    public int getPagecount() {
        return pagecount;
    }

    public void setPagecount(int pagecount) {
        this.pagecount = pagecount;
    }

}