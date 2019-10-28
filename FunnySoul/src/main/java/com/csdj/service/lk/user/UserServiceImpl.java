package com.csdj.service.lk.user;

import com.csdj.dao.lk.user.UserMapper;
import com.csdj.entity.FsUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
