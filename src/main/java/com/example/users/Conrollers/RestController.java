package com.example.users.Conrollers;

import org.springframework.web.bind.annotation.RequestMapping;

@org.springframework.web.bind.annotation.RestController
public class RestController {

    @RequestMapping("/")
    public String Index(){

        return "index";
    }
}
