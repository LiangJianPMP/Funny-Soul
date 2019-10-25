package com.csdj.servlet.lk;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 用户详细业务分配器
 */
@Controller
@RequestMapping("sys/lk/")
public class UserDetailedServlet {

    @RequestMapping(value = "/userdetailed.html/{id}",method = RequestMethod.GET)
    public String userdetailed(@PathVariable int id){
        return "lk/userdetailed";
    }

}
