package com.csdj.servlet.lkl;

import com.csdj.entity.FsUser;
import com.csdj.service.lkl.AuthenticationRequestService;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;
import org.junit.Test;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 获取验证码
 */
@Controller
@RequestMapping("/AuthenticationRequest")
public class AuthenticationRequest {
    @Resource
    AuthenticationRequestService service;
    @RequestMapping("/get_authcode")
    @ResponseBody
    public List<String> getauthcode(@RequestParam("email") String em){
        List<String > list=new ArrayList<>();
        System.out.println("-------------------->验证方法进入");
        if (verificationuser(em)<=0){
            //小于0表示用户不存在
            System.out.println("用户不存在 --------------- 进入判断");
            list.add("USERNULL");
            return list;
        }
        String code=(int)((Math.random()*89999)+10000)+"";
        try {
            sendemail(em,code);
        } catch (EmailException e) {
            System.out.println("邮箱发送出现异常");
            e.printStackTrace();
        }
        list.add(code+"");
        return list;

    }

    //验证用户是否存在
    public int verificationuser(String email){

        int i=-1;
        try{
            i=service.authenticationuser(email);
        }catch (Exception e){

            System.out.println("邮箱"+email+"出现异常"+e);
        }
        return i;
    }

    @RequestMapping("get_code")
    @ResponseBody
    public List<String> set_User(@RequestParam("email") String em){
        List<String > list=new ArrayList<>();
        System.out.println("-------------------->验证方法进入");
        if (verificationuser(em)>0){
            //小于0表示用户不存在
            System.out.println("该用户已存在 --------------- 进入判断");
            list.add("USERNULL");
            return list;
        }
        String code=(int)((Math.random()*89999)+10000)+"";
        try {
            sendemail(em,code);
        } catch (EmailException e) {
            System.out.println("邮箱发送出现异常");
            e.printStackTrace();
        }
        list.add(code+"");
        return list;

    }

    @RequestMapping("/Login")
    public String UserLogin(FsUser user,HttpServletRequest request){
        try {
            FsUser user1=service.loginUser(user);
            if (user1!=null){
                //登录成功返回页面
                request.getSession().setAttribute("user",user1);
                return null;
            }
        }catch (Exception e){
            return "../jsp/lkl/Login";
        }
        return "../jsp/lkl/Login";

    }

    //短信验证登录
    @RequestMapping("/Logins")
    public String UserLogins(FsUser user, HttpServletRequest request){
        try {
            FsUser user1=service.login_users(user);
            if (user1!=null){
                //登录成功返回页面
                request.getSession().setAttribute("user",user1);
                return null;
            }
        }catch (Exception e){
            return "../jsp/lkl/Login";
        }
        return "../jsp/lkl/Login";
    }


    //发送邮件方法
    public void sendemail(String em,String code) throws EmailException {
        HtmlEmail email= new HtmlEmail();
        //qq SMTP
        email.setHostName("smtp.qq.com");
        email.setCharset("UTF-8");
        try {
            email.addTo(em);//收件人
            email.setFrom("2900798493@qq.com","Funny Soul短信验证");//设计发件人和用户名
            email.setAuthentication("2900798493@qq.com","omnnmaqxmvcndfgg");//SMTP账号和密码
        } catch (EmailException e) {
            e.printStackTrace();
        }
        email.setSubject("注册验证");//设置发送主题
        email.setMsg("验证码为"+code);//设置发送内容
        email.send();//进行发送

    }

    @RequestMapping("get_Usercode")
    @ResponseBody
    public List<String> get_UserCode(@RequestParam("userCode")String code){
        List<String> list=new ArrayList<>();
        int i=service.get_userCode(code);
        list.add(i+"");
        return list;
    }

    //用户注册
    @RequestMapping("register")
    public String register(FsUser user,@RequestParam("bornth")String bornthDate){
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        SimpleDateFormat sdf1=new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date d=sdf1.parse(bornthDate);
            String f=sdf.format(d);
            Timestamp timestamp=Timestamp.valueOf(f);
            user.setBornthDate(timestamp);
            user.setIsFrozen(2);
            service.register_user(user);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }



}
