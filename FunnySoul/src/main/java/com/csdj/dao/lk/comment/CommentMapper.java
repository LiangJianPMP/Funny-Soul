package com.csdj.dao.lk.comment;

import com.csdj.entity.FsComment;
import com.csdj.entity.FsPost;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 帖子评论数据处理接口
 */
public interface CommentMapper {

    /**
     * 查询用户评论
     * @param postId 帖子id
     * @param page 当前页面
     * @param limit 页面显示数据数量
     * @return 评论
     */
    List<FsComment> getSelect_Comment(@Param("postId")int postId,@Param("page")int page,@Param("limit")int limit);

    /**
     * 添加用户评论
     * @param fsComment 评论信息
     * @return 成功，失败
     */
    boolean getInsert_Comment(FsComment fsComment);

}
