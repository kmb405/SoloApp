package com.codingdojo.familyconnect.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	
	
	@GetMapping("/calendar/{id}")
    public String calendar() {
        return "calendarPage.jsp";
    }
	
}
