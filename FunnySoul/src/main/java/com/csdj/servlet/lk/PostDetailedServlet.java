package com.csdj.servlet.lk;

import com.csdj.entity.FsComment;
import com.csdj.service.lk.about.AboutService;
import com.csdj.service.lk.comment.CommentService;
import com.csdj.service.lk.post.PostService;
import com.csdj.service.lk.praise.PraiseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.xml.crypto.Data;
import java.util.Date;
import java.util.List;

/**
 * 详细帖子的业务分配器
 */
@Controller
@RequestMapping("sys/lk/")
public class PostDetailedServlet {

    @Autowired
    private PostService postService;

    @Autowired
    private CommentService commentService;

    @Autowired
    private PraiseService praiseService;

    @Autowired
    private AboutService aboutService;

    @RequestMapping(value = "/postdetailed.html/{id}",method = RequestMethod.GET)
    public String postdetailed(@PathVariable int id, Model model){
        model.addAttribute("post",postService.show_One_Post(id));
        model.addAttribute("praise",praiseService.show_Is_Praise(id,1));
        model.addAttribute("about",aboutService.show_About());
        return "lk/postdetailed";
    }

    @RequestMapping(value = "/addComment.html",method = RequestMethod.POST)
    @ResponseBody
    public boolean addComment(@RequestParam int postId,@RequestParam String details){
        FsComment fsComment = new FsComment();
        fsComment.setPostId(postId);
        fsComment.setDetails(details);
        fsComment.setCommentTime(new Date());
        fsComment.setPraisePeopleId(1);
        return commentService.add_Comment(fsComment);
    }

    @RequestMapping(value = "/showComment.json",method = RequestMethod.POST)
    @ResponseBody
    public List<FsComment> showComment(@RequestParam int postId,@RequestParam int page){
        return commentService.show_Comment(postId,page,5);
    }


}
