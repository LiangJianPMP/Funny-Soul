package com.csdj.service.lkl;


import com.csdj.dao.lkl.VerificationUserDao;


import com.csdj.entity.FsUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("authenticationrequest")
public class AuthenticationRequestImpl implements AuthenticationRequestService {
    @Autowired
    VerificationUserDao dao;

    public int authenticationuser(String s) {
        System.out.println("方法进入");

        return dao.verificationuser(s);
    }


    public FsUser loginUser(FsUser user) {
        return dao.loginUser(user);
    }


    public int get_userCode(String code) {
        return dao.get_userCode(code);
    }


    public int register_user(FsUser user) {
        return dao.register_user(user);
    }

    @Override
    public FsUser login_users(FsUser user) {
        return dao.loginUsers(user);
    }
}
