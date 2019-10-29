package com.csdj.service.lk.post;

import com.csdj.entity.FsPost;

import java.util.List;

/**
 * 帖子业务接口
 */
public interface PostService {

    /**
     * 显示帖子
     * @return 帖子
     */
    List<FsPost> show_Post(int page,int limit);

    /**
     * 显示帖子数量
     * @return 数量
     */
    int show_Post_Count();

    /**
     * 用户帖子点赞
     * @param postId 帖子id
     * @param praisePeopleId 点赞人id
     * @return 成功，失败
     */
    boolean show_Post_Praise(int postId,int praisePeopleId);

    /**
     * 显示指定帖子的信息
     * @param id 帖子id
     * @return 帖子详细详细
     */
    FsPost show_One_Post(int id);

    /**
     * 显示指定用户发的帖子
     * @return 帖子
     */
    List<FsPost> show_User_Post(int id,int page,int limit);

    /**
     * 显示指定用户帖子数量
     * @return 数量
     */
    int show_User_Post_Count(int id);

    /**
     * 显示指定名称帖子
     * @return 帖子
     */
    List<FsPost> show_Name_Posts(String details,int page,int limit);

    /**
     * 显示指定帖子的数量
     * @param details 帖子名称
     * @return 数量
     */
    int show_Posts_Count(String details);

}
