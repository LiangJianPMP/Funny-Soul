package com.csdj.dao.lk.user;

import com.csdj.entity.FsUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 用户数据处理接口
 */
public interface UserMapper {

    /**
     * 查询一个用户信息
     * @param id 用户id
     * @return 用户信息
     */
    FsUser getSelect_One_User(@Param("id")int id);

    /**
     * 查询用户
     * @param userName 用户名
     * @return 用户信息
     */
    List<FsUser> getSelect_Users(@Param("userName")String userName,@Param("page")int id,@Param("limit")int limit);

    /**
     * 查询指定用户名称的数量
     * @param userName 用户名称
     * @return 数量
     */
    int getSelect_User_Count(@Param("userName")String userName);

}
