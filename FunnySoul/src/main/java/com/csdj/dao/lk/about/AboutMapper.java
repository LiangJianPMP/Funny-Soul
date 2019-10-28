package com.csdj.dao.lk.about;

import com.csdj.entity.FsAbout;

/**
 * 关于我们数据处理接口
 */
public interface AboutMapper {

    /**
     * 查询关于我们的信息
     * @return 关于我们的信息
     */
    FsAbout getSelect_About();

}
