package com.example.users.Controllers;

import com.example.users.Models.User;
import com.example.users.Services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@org.springframework.web.bind.annotation.RestController
public class RestController {

    @Autowired
    private UserService userService;

    @RequestMapping("/")
    public String Index(){

        return "index";
    }

    @RequestMapping("/saveUser")
    public String saveUser(@RequestParam String username, @RequestParam String firstname,
                           @RequestParam String lastname, @RequestParam int age,@RequestParam String password){

        User user = new User( username, firstname, lastname, age, password);

        userService.saveMyUser( user );
        return "User Saved";
    }
}
