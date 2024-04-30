package com.codingdojo.familyconnect.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.codingdojo.familyconnect.models.Task;

@Repository
public interface TaskRepository extends CrudRepository<Task, Long> {
	List<Task> findAll();
	
	Optional<Task> findById(Long num);
	
	@Query(value = "Select * From tasks where user_id = :id and taskdate LIKE CONCAT('%',:date,'%')", nativeQuery = true)
	List<Task> findUserTasks(@Param("id") Long id, @Param("date") String date);
}
