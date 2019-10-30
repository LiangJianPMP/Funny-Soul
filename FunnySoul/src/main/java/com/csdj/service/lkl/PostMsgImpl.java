package com.csdj.service.lkl;

import com.csdj.dao.lkl.PostMsg;
import com.csdj.entity.FsPost;
import com.csdj.entity.FsUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("postmsg")
public class PostMsgImpl implements PostMsgService{
    @Autowired
    PostMsg dao;

    public int postmsg(FsPost post) {
        return dao.post_msg(post);
    }
}
