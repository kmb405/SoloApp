package com.codingdojo.familyconnect.controllers;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.codingdojo.familyconnect.models.Task;
import com.codingdojo.familyconnect.models.User;
import com.codingdojo.familyconnect.services.TaskService;
import com.codingdojo.familyconnect.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class TaskController {
	
	@Autowired
	TaskService taskServ;
	
	@Autowired
	UserService userServ;
	

	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String formattedDate = sdf.format(date);

	
	
	@GetMapping("/tasks/{date}/{id}")
    public String task(@PathVariable("id") Long id, @PathVariable("date") String date, HttpSession session, Model model) {
		Optional<User> user = userServ.findUser(id);
		List<Task> tasks = taskServ.usersTask(id, date);
		System.out.println(tasks);
		model.addAttribute("tasks", tasks);
		model.addAttribute("user", user);
        return "taskPage.jsp";
    }
	
	@GetMapping("/newTask")
    public String newTask(@ModelAttribute("task") Task task, HttpSession session, Model model) {
		List<User> users = userServ.getAll();
		model.addAttribute("users", users);
        return "newTaskPage.jsp";
    }
	
	@GetMapping("/editTask/{id}")
    public String editTask(@PathVariable("id") Long id, Model model, HttpSession session, @ModelAttribute("editTask") Task editTask) {
		List<User> users = userServ.getAll();
    	Task task = taskServ.findTask(id);
    	model.addAttribute("users", users);
    	model.addAttribute("task", task);
    	return "editTaskPage.jsp";
    }
	
	@GetMapping("/task/{id}")
    public String viewTask(@PathVariable("id") Long id, Model model, HttpSession session) {

    	Task task = taskServ.findTask(id);
    	model.addAttribute("task", task);
    	return "task.jsp";
    }
	
	@GetMapping("/deleteTask/{taskId}")
	public String deleteTask(@PathVariable("taskId") Long taskId, HttpSession session) {
		taskServ.deleteTask(taskId);
		return "redirect:/tasks/"+formattedDate+"/"+ session.getAttribute("userId") ;
	}
	
	@PostMapping("/createTask")
	public String createTask(@Valid @ModelAttribute("task") Task task, BindingResult result, HttpSession session,
	Model model) throws ParseException {
		if (result.hasErrors()) {
			List<User> users = userServ.getAll();
			model.addAttribute("users", users);
			return "newTaskPage.jsp";
		} else {
			taskServ.createTask(task);
			return "redirect:/tasks/"+formattedDate+"/"+ session.getAttribute("userId") ;
		}
	}
	
	@PutMapping("/updateTask")
    public String updateTask(@Valid @ModelAttribute("editTask") Task editTask, BindingResult result, HttpSession session, Model model) {

    	if(result.hasErrors()) {
    		List<User> users = userServ.getAll();
			model.addAttribute("users", users);
    		model.addAttribute("task", editTask);
    		return "editTaskPage.jsp";
    	} else {
    		taskServ.updateTask(editTask);
    		return "redirect:/tasks/"+formattedDate+"/"+ session.getAttribute("userId") ;
    	}
    
    }
	
	
}
