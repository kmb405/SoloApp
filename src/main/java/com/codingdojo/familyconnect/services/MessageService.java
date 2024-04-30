package com.codingdojo.familyconnect.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.familyconnect.models.Message;
import com.codingdojo.familyconnect.repositories.MessageRepository;

@Service
public class MessageService {
	
	@Autowired
	private MessageRepository messageRepo;
	
	public MessageService() {
		
	}

	public MessageService(MessageRepository messageRepo) {
		this.messageRepo = messageRepo;
	}
	
	public Message createMessage(Message t) {
		return messageRepo.save(t);
	}
	
	public List<Message> allMessages() {
		return messageRepo.findAll();
	}
	
	public Message findMessage(Long id) {
		Optional<Message> optionalMessage = messageRepo.findById(id);
		if (optionalMessage.isPresent()) {
			return optionalMessage.get();
		} else {
			return null;
		}
	}
	
	public void deleteMessage(Long id) {
		messageRepo.deleteById(id);
	}

	public MessageRepository getMessageRepo() {
		return messageRepo;
	}

	public void setMessageRepo(MessageRepository messageRepo) {
		this.messageRepo = messageRepo;
	}
	
	
	
}
