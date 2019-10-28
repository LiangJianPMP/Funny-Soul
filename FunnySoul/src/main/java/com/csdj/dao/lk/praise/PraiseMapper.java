package com.csdj.dao.lk.praise;

import com.csdj.entity.FsPost;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 点赞数据处理接口
 */
public interface PraiseMapper {

    /**
     * 用户点赞的帖子id
     * @param praisePeopleId 用户id
     * @return 帖子id
     */
    List<Integer> getSelect_Praise_Count(@Param("praisePeopleId") int praisePeopleId);

    /**
     * 用户是否点赞
     * @param postId 帖子id
     * @return 是否点赞
     */
    int getSelect_Is_Praise(@Param("postId") int postId,@Param("praisePeopleId") int praisePeopleId);

}
