package com.csdj.service.lk.user;

import com.csdj.entity.FsUser;

import java.util.List;

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

    /**
     * 显示用户
     * @param userName 用户名
     * @return 用户信息
     */
    List<FsUser> show_Select_Users(String userName,int page,int limit);

    /**
     * 显示指定用户名称的数量
     * @param userName 用户名称
     * @return 数量
     */
    int show_User_Count(String userName);

}
