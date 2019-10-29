package com.csdj.service.lk.user;

import com.csdj.dao.lk.user.UserMapper;
import com.csdj.entity.FsUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 用户业务接口实现类
 */
@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public FsUser show_One_User(int id) {
        return userMapper.getSelect_One_User(id);
    }

    @Override
    public List<FsUser> show_Select_Users(String userName,int page,int limit) {
        return userMapper.getSelect_Users(userName,(page-1)*limit,limit);
    }

    @Override
    public int show_User_Count(String userName) {
        return userMapper.getSelect_User_Count(userName);
    }
}
