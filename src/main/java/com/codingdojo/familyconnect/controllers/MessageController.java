package com.codingdojo.familyconnect.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.codingdojo.familyconnect.models.Message;
import com.codingdojo.familyconnect.services.MessageService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class MessageController {
	
	@Autowired
	MessageService messageServ;
	
	
	@GetMapping("/messages")
    public String messages(@ModelAttribute("message") Message message, Model model, HttpSession session) {
		List<Message> messages = messageServ.allMessages();
		model.addAttribute("messages", messages);
		System.out.println(session.getAttribute("userName"));
        return "messagesPage.jsp";

    }	
	
	
	@PostMapping("/createMessage")
	public String createMessage(@Valid @ModelAttribute("message") Message message,
	BindingResult result, Model model) {
		if (result.hasErrors()) {
			List<Message> messages = messageServ.allMessages();
			model.addAttribute("messages", messages);
	        return "messagesPage.jsp";
		} else {
			messageServ.createMessage(message);
			return "redirect:/messages";
		}
	}
}
