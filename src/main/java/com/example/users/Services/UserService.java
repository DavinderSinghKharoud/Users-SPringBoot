package com.example.users.Services;

import com.example.users.Models.User;
import com.example.users.Repositories.UserRepository;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
@Transactional
public class UserService {

    private UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public void saveMyUser(User user){
        userRepository.save( user );
    }
}
