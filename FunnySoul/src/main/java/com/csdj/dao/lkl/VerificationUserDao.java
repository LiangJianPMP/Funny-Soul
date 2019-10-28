package com.csdj.dao.lkl;

import com.csdj.entity.FsUser;

public interface VerificationUserDao {

    //验证邮箱是否存在
    public int verificationuser(String email);

    //用户登录
    public FsUser loginUser(FsUser user);

    public FsUser loginUsers(FsUser user);

    public int get_userCode(String code);
    //用户注册
    public int register_user(FsUser user);
}
