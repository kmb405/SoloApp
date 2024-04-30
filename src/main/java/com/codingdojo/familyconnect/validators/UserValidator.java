package com.codingdojo.familyconnect.validators;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.codingdojo.familyconnect.models.User;


@Component
public class UserValidator implements Validator {
    
    @Override
    public boolean supports(Class<?> c) {
        return User.class.equals(c);
    }
    
    @Override
    public void validate(Object object, Errors errors) {
        User user = (User) object;
        
        if (!user.getPasswordConfirmation().equals(user.getPassword())) {
            // 3
            errors.rejectValue("passwordConfirmation", "Match");
        }         
    }
}
