package com.example.users.Controllers;

import com.example.users.Models.User;
import com.example.users.Services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.naming.Binding;
import javax.servlet.http.HttpServletRequest;

@Controller
public class IndexController {

    @Autowired
    private UserService userService;

    @RequestMapping("/index")
    public String Index(HttpServletRequest request){

        request.setAttribute("mode", "ModeHome");
        return "index";
    }

    @RequestMapping("/register")
    public String RegisterUser(HttpServletRequest request){

        request.setAttribute("mode", "ModeRegister");
        return "index";
    }

    @RequestMapping("/save_user")
    public String registerUser(@ModelAttribute User user, BindingResult bindingResult, HttpServletRequest request){

        userService.saveMyUser( user );
        request.setAttribute("mode","ModeHome");

        return "index";
    }

    @RequestMapping("/showUsers")
    public String showUsers(HttpServletRequest request){

        request.setAttribute("users", userService.showAllUsers());
        request.setAttribute("mode", "AllUsers");
        return "index";
    }

    @RequestMapping("/deleteUser")
    public String deleteUser(@RequestParam int id, HttpServletRequest request){

        userService.deleteMyUser( id );
        request.setAttribute("users", userService.showAllUsers());
        request.setAttribute("mode", "AllUsers");
        return "index";
    }

    @RequestMapping("/editUser")
    public String editUser(@RequestParam int id, HttpServletRequest request){

        request.setAttribute("user", userService.getUserDetails(id));
        request.setAttribute("mode","ModeUpdate");
        return "index";
    }

    @RequestMapping("/login")
    public String editUser(HttpServletRequest request){

        request.setAttribute("mode","ModeLogin");
        return "index";
    }


}
