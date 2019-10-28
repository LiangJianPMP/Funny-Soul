package com.csdj.service.lk.comment;

import com.csdj.dao.lk.comment.CommentMapper;
import com.csdj.entity.FsComment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 帖子评论接口实现类
 */
@Service("commentService")
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentMapper commentMapper;

    @Override
    public List<FsComment> show_Comment(int postId, int page, int limit) {
        return commentMapper.getSelect_Comment(postId,(page-1)*limit,limit);
    }

    @Override
    public boolean add_Comment(FsComment fsComment) {
        return commentMapper.getInsert_Comment(fsComment);
    }
}
