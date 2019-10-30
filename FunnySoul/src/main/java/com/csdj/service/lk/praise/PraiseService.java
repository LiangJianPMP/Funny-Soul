package com.csdj.service.lk.praise;

import java.util.List;

/**
 * 点赞业务接口
 */
public interface PraiseService {

    /**
     * 用户点赞的帖子id
     * @param praisePeopleId 用户id
     * @return 帖子id
     */
    List<Integer> show_Praise_Count(int praisePeopleId);

    /**
     * 用户是否点赞
     * @param postId 帖子id
     * @return 是否点赞
     */
    int show_Is_Praise(int postId,int praisePeopleId);

}
