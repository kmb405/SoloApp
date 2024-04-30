package com.codingdojo.familyconnect.services;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.familyconnect.models.Task;
import com.codingdojo.familyconnect.repositories.TaskRepository;

@Service
public class TaskService {
	
	@Autowired
	TaskRepository taskRepo;
	

    Calendar calendar = Calendar.getInstance();

	public void createTask(Task task) throws ParseException {	
		
		String startDateString = task.getTaskdate();
		String endDateString = task.getRepeatUntil();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date startDate = sdf.parse(startDateString);
		Date endDate = sdf.parse(endDateString);
        
        
        
        calendar.setTime(startDate);
        taskRepo.save(task);
        while (calendar.getTime().compareTo(endDate) < 0) {
	            // Add one day to the date.
	            calendar.add(Calendar.DATE, task.getTaskrepeat());

	            // Get the new date.
	            Date newDate = calendar.getTime();
	            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");  
	            String strDate = dateFormat.format(newDate);  
	            // Create a new task instance for the new date.
	            Task newTask = new Task();
	           

	            // Set the task start date.
	            newTask.setTaskdate(strDate);
	            newTask.setTasktype(task.getTasktype());
	    		newTask.setDescription(task.getDescription());
	    		newTask.setTasktime(task.getTasktime());
	    		newTask.setTaskrepeat(task.getTaskrepeat());
	    		newTask.setRepeatUntil(task.getRepeatUntil());
	    		newTask.setUser(task.getUser());
	            // Save the task to the database.
	            taskRepo.save(newTask);
		 }
		
	}
	
	public List<Task> usersTask(Long id, String date) {
		return taskRepo.findUserTasks(id, date);
	}
	
	public List<Task> allTasks() {
		return taskRepo.findAll();
	}
	
	public Task findTask(Long id) {
		Optional<Task> optionalTask = taskRepo.findById(id);
		if (optionalTask.isPresent()) {
			return optionalTask.get();
		} else {
			return null;
		}
	}
	
	public Task updateTask(Task task) {
		Task oldTask = taskRepo.findById(task.getId()).get();
		oldTask.setTasktype(task.getTasktype());
		oldTask.setDescription(task.getDescription());
		oldTask.setTasktime(task.getTasktime());
		oldTask.setTaskrepeat(task.getTaskrepeat());
		oldTask.setRepeatUntil(task.getRepeatUntil());
		return taskRepo.save(oldTask);
	}
	
	public void deleteTask(Long id) {
		taskRepo.deleteById(id);
	}

	
	
	
}
