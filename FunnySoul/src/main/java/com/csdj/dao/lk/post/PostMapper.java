package com.csdj.dao.lk.post;

import com.csdj.entity.FsPost;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 帖子数据处理接口
 */
public interface PostMapper {

    /**
     * 查询帖子
     * @return 帖子
     */
    List<FsPost> getSelect_Post(@Param("page") int page,@Param("limit") int limit);

    /**
     * 查询帖子数量
     * @return 数量
     */
    int getSelect_Post_Count();

}
