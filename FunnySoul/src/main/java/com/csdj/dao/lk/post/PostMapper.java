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

    /**
     * 用户帖子点赞
     * @param postId 帖子id
     * @param praisePeopleId 点赞人id
     * @return 成功，失败
     */
    boolean getInsert_Post_Praise(@Param("postId") int postId,@Param("praisePeopleId")int praisePeopleId);

    /**
     * 查询指定帖子的信息
     * @param id 帖子id
     * @return 帖子详细详细
     */
    FsPost getSelect_One_Post(@Param("id") int id);

}
