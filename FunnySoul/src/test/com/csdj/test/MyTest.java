package com.csdj.test;

import com.csdj.entity.FsUser;
import com.csdj.service.lkl.AuthenticationRequestImpl;
import com.csdj.service.lkl.AuthenticationRequestService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import sun.awt.AppContext;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MyTest {
    public static final ApplicationContext CONTEXT= new ClassPathXmlApplicationContext("applicationContext.xml");

    AuthenticationRequestService service;

    public static void main(String[] args) throws ParseException {
        FsUser user = new FsUser();
        AuthenticationRequestService service=(AuthenticationRequestService)CONTEXT.getBean("authenticationrequest");
        Date date=new Date();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String d=sdf.format("2019-1-1");
        String f=sdf.format(d);
        try {
            Timestamp timestamp=Timestamp.valueOf(f);
            System.out.println(timestamp);
            user.setBornthDate(timestamp);
            user.setUserName("Liaoun");
            user.setEmail("14798914873@qq.com");
            user.setUserPassword("123456");
            user.setIsFrozen(2);
            service.register_user(user);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }


        System.out.println(Timestamp.valueOf(f));
//        FsUser user=new FsUser();
//        user.setEmail("2900798493@qq.com");
//        user.setUserPassword("123456");
//        int i=service.loginUser(user);
//        System.out.println(i);
//        FsUser user=new FsUser();

//
//        user.setBornthDate((Timestamp) new Date());
//        int i= service.get_userCode("hahah");
//        System.out.println(i);
//        Timestamp timestamp= (Timestamp) new Date();
//        System.out.println(timestamp);
    }

}
