package com.csdj.servlet.lk;

import com.csdj.entity.FsPost;
import com.csdj.service.lk.about.AboutService;
import com.csdj.service.lk.comment.CommentService;
import com.csdj.service.lk.post.PostService;
import com.csdj.service.lk.praise.PraiseService;
import com.csdj.service.lk.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 用户详细业务分配器
 */
@Controller
@RequestMapping("sys/lk/")
public class UserDetailedServlet {

    @Autowired
    private PostService postService;

    @Autowired
    private UserService userService;

    @Autowired
    private PraiseService praiseService;

    @Autowired
    private AboutService aboutService;

    @RequestMapping(value = "/userdetailed.html/{id}",method = RequestMethod.GET)
    public String userdetailed(@PathVariable int id, Model model){
        System.out.println(userService.show_One_User(id).getId());
        model.addAttribute("user",userService.show_One_User(id));
        model.addAttribute("user_count",postService.show_User_Post_Count(id));
        model.addAttribute("praiseCount",praiseService.show_Praise_Count(1));
        model.addAttribute("about",aboutService.show_About());
        return "lk/userdetailed";
    }

    @RequestMapping(value = "/userDetailed.json",method = RequestMethod.POST)
    @ResponseBody
    public List<FsPost> showUserDetailed(@RequestParam int userId, @RequestParam int page){
        return postService.show_User_Post(userId,page,5);
    }

}
