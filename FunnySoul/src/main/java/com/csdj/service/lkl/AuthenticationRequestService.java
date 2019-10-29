package com.csdj.service.lkl;

import com.csdj.entity.FsUser;

public interface AuthenticationRequestService {

    public int authenticationuser(String email);

    public FsUser loginUser(FsUser user);

    public int get_userCode(String code);

    public int register_user(FsUser user);

    public FsUser login_users(FsUser user);
}
