package com.csdj.service.lk.post;

import com.csdj.dao.lk.post.PostMapper;
import com.csdj.entity.FsPost;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 帖子业务实现类
 */
@Service("postService")
public class PostServiceImpl implements PostService {


    @Autowired
    private PostMapper postMapper;

    @Override
    public List<FsPost> show_Post(int page,int limit) {
        return postMapper.getSelect_Post((page-1)*limit,limit);
    }

    @Override
    public int show_Post_Count() {
        return postMapper.getSelect_Post_Count();
    }

    @Override
    public boolean show_Post_Praise(int postId, int praisePeopleId) {
        return postMapper.getInsert_Post_Praise(postId,praisePeopleId);
    }

    @Override
    public FsPost show_One_Post(int id) {
        return postMapper.getSelect_One_Post(id);
    }

    @Override
    public List<FsPost> show_User_Post(int id, int page, int limit) {
        return postMapper.getSelect_User_Post(id,(page-1)*limit,limit);
    }

    @Override
    public int show_User_Post_Count(int id) {
        return postMapper.getSelect_User_Post_Count(id);
    }

    @Override
    public List<FsPost> show_Name_Posts(String details, int page, int limit) {
        return postMapper.getSelect_Name_Posts(details,(page-1)*limit,limit);
    }

    @Override
    public int show_Posts_Count(String details) {
        return postMapper.getSelect_Posts_Count(details);
    }
}
