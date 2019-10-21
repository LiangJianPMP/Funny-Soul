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

}
