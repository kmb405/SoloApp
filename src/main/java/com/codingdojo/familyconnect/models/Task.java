package com.codingdojo.familyconnect.models;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Future;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;

@Entity
@Table(name="tasks")
public class Task {
	
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;
	
	
    private String tasktype;
	@NotBlank(message = "Please enter a Description!")
    private String description;
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	@NotEmpty(message= "Enter a date!")
    private String taskdate;
	@NotEmpty(message= "Enter a time!")
    private String tasktime;
    private int taskrepeat;
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	@NotEmpty(message= "Enter a date!")
    private String repeatUntil;
    @Column(updatable=false)
    private Date createdAt;
    private Date updatedAt;
    @ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
    private User user;
    
    @PrePersist
	protected void onCreate() {
		this.createdAt = new Date();
	}
	
	@PreUpdate
	protected void onUpdate() {
		this.updatedAt = new Date();
	}
    
    public Task() {
    	
    }
    
    

	public Task(Long id, String tasktype, String description, String taskdate, String tasktime, int taskrepeat, Date createdAt,
			Date updatedAt, User user) {

		this.id = id;
		this.tasktype = tasktype;
		this.description = description;
		this.taskdate = taskdate;
		this.tasktime = tasktime;
		this.taskrepeat = taskrepeat;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
		this.user = user;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTasktype() {
		return tasktype;
	}

	public void setTasktype(String tasktype) {
		this.tasktype = tasktype;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	

	public String getTaskdate() {
		return taskdate;
	}

	public void setTaskdate(String taskdate) {
		this.taskdate = taskdate;
	}

	public String getTasktime() {
		return tasktime;
	}

	public void setTasktime(String tasktime) {
		this.tasktime = tasktime;
	}

	public int getTaskrepeat() {
		return taskrepeat;
	}

	public void setTaskrepeat(int taskrepeat) {
		this.taskrepeat = taskrepeat;
	}

	public String getRepeatUntil() {
		return repeatUntil;
	}

	public void setRepeatUntil(String repeatUntil) {
		this.repeatUntil = repeatUntil;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	
  
}
