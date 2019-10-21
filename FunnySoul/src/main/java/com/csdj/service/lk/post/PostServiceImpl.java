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
}
