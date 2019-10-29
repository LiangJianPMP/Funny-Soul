package com.csdj.servlet.lk;

import com.csdj.entity.FsPost;
import com.csdj.entity.FsUser;
import com.csdj.service.lk.about.AboutService;
import com.csdj.service.lk.post.PostService;
import com.csdj.service.lk.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 用户搜索业务分配器
 */
@Controller
@RequestMapping("sys/lk/")
public class SearchServlet {

    @Autowired
    private UserService userService;

    @Autowired
    private PostService postService;

    @Autowired
    private AboutService aboutService;

    @RequestMapping(value = "/search.html",method = RequestMethod.GET)
    public String search(@RequestParam String keywords, Model model){
        model.addAttribute("keywords",keywords);
        model.addAttribute("about",aboutService.show_About());
        model.addAttribute("userCount",userService.show_User_Count(keywords));
        model.addAttribute("postsCount",postService.show_Posts_Count(keywords));
        return "lk/search";
    }

    @RequestMapping(value = "/searchUser.json",method = RequestMethod.POST)
    @ResponseBody
    public List<FsUser> searchUser(@RequestParam String keywords,@RequestParam int page){
        return userService.show_Select_Users(keywords,page,5);
    }

    @RequestMapping(value = "/searchPost.json",method = RequestMethod.POST)
    @ResponseBody
    public List<FsPost> searchPost(@RequestParam String keywords, @RequestParam int page){
        return postService.show_Name_Posts(keywords,page,5);
    }

}
