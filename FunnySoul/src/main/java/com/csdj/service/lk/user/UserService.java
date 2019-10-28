package com.csdj.service.lk.user;

import com.csdj.entity.FsUser;

/**
 * 用户业务接口
 */
public interface UserService {

    /**
     * 显示一个用户信息
     * @param id 用户id
     * @return 用户信息
     */
    FsUser show_One_User(int id);

}
