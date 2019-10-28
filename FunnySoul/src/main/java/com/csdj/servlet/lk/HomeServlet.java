package com.csdj.servlet.lk;

import com.csdj.entity.FsComment;
import com.csdj.entity.FsPost;
import com.csdj.service.lk.about.AboutService;
import com.csdj.service.lk.comment.CommentService;
import com.csdj.service.lk.post.PostService;
import com.csdj.service.lk.praise.PraiseService;
import com.csdj.tool.lk.ActionResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 首页的业务分配器
 */
@Controller
@RequestMapping("sys/lk/")
public class HomeServlet {

    @Autowired
    private PostService postService;

    @Autowired
    private PraiseService praiseService;

    @Autowired
    private CommentService commentService;

    @Autowired
    private AboutService aboutService;

    @RequestMapping(value = "/home.html",method = RequestMethod.GET)
    public String home(Model model){
        model.addAttribute("about",aboutService.show_About());
        return "lk/home";
    }

    @RequestMapping(value = "/showHome.json/{page}",method = RequestMethod.GET)
    @ResponseBody
    public ActionResult showHome(@PathVariable int page){
        ActionResult actionResult = new  ActionResult();
        List<FsPost> posts = postService.show_Post(page,4);
        actionResult.setPages(postService.show_Post_Count()%4==0 ? postService.show_Post_Count()/4 : (postService.show_Post_Count()/4)+1);
        actionResult.setData(posts);
        return actionResult;
    }

    @RequestMapping(value = "/pcount.html",method = RequestMethod.POST)
    @ResponseBody
    public boolean pcount(@RequestParam int postId){
        return postService.show_Post_Praise(postId,1);
    }

    @RequestMapping(value = "/showLike.json",method = RequestMethod.POST)
    @ResponseBody
    public List<Integer> showLike(){
        return praiseService.show_Praise_Count(1);
    }

}
