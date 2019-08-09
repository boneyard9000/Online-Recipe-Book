package com.techelevator.controller;

import javax.validation.Valid;

import com.techelevator.authentication.AuthProvider;
import com.techelevator.authentication.JwtTokenHandler;
import com.techelevator.authentication.RegistrationResult;
import com.techelevator.authentication.UnauthorizedException;
import com.techelevator.authentication.UserCreationException;
import com.techelevator.model.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

/**
 * AccountController
 */


@RestController
public class AccountController {
    @Autowired
    private AuthProvider auth;

    @Autowired
    private JwtTokenHandler tokenHandler;

    @PostMapping("/login")
    public String login(@RequestBody User user) throws UnauthorizedException {
        if(auth.signIn(user.getEmail(), user.getPassword())) {
            User currentUser = auth.getCurrentUser();
            return tokenHandler.createToken(currentUser);
        } else {
            throw new UnauthorizedException();
        }
    }



    @PostMapping("/register")
    public RegistrationResult register(@Valid @RequestBody User user, BindingResult result) {
    	RegistrationResult registrationResult = new RegistrationResult();
    	if(result.hasErrors()) {
            for(ObjectError error : result.getAllErrors()) {
                registrationResult.addError(error.getDefaultMessage());
            }
        }
    	else {
    		auth.register(user.getFirstName(), user.getLastName(), user.getEmail(), user.getPhoneNumber(), user.getPassword(), user.getRole());
    		registrationResult.setSuccess(true);
    	}
    	return registrationResult;
    }

}