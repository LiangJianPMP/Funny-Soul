package com.csdj.service.lk.comment;

import com.csdj.entity.FsComment;

import java.util.List;

/**
 * 帖子评论业务处理接口
 */
public interface CommentService {

    /**
     * 查询用户评论
     * @param postId 帖子id
     * @param page 当前页面
     * @param limit 页面显示数据数量
     * @return 评论
     */
    List<FsComment> show_Comment(int postId,int page,int limit);

    /**
     * 用户评论
     * @param fsComment 评论信息
     * @return 成功，失败
     */
    boolean add_Comment(FsComment fsComment);

}
