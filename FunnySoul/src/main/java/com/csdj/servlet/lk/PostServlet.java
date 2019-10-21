package com.csdj.servlet.lk;

import com.csdj.entity.FsPost;
import com.csdj.service.lk.post.PostService;
import com.csdj.tool.lk.ActionResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 帖子的业务分配器
 */
@Controller
@RequestMapping("sys/lk/")
public class PostServlet {

    @Autowired
    private PostService postService;

    @RequestMapping(value = "/home.html",method = RequestMethod.GET)
    public String home(){
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

}
