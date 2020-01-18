package com.example.users.Services;

import com.example.users.Models.User;
import com.example.users.Repositories.UserRepository;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class UserService {

    private UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public void saveMyUser(User user) {
        userRepository.save(user);
    }

    public List<User> showAllUsers() {
        List<User> users = new ArrayList<User>();

        for (User user : userRepository.findAll()) {
            users.add(user);
        }
        return users;
    }

    public void deleteMyUser(int id){
        userRepository.deleteById(id);
    }

    public User getUserDetails(int id){
        return userRepository.findById( id ).orElse(new User());
    }
}
