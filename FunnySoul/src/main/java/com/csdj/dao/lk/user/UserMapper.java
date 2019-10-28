package com.csdj.dao.lk.user;

import com.csdj.entity.FsUser;
import org.apache.ibatis.annotations.Param;

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

}
