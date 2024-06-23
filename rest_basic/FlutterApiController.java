package com.example.rest4flutter.controller;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.rest4flutter.dto.User;

@CrossOrigin("http://localhost:59880/")
@RestController
@RequestMapping("/api")
public class FlutterApiController {

	@GetMapping("/user")
	public User user() {
		System.out.println("api user ...................");
		User user = new User("James Dean", 46, "Hello EveryOne!!");
		
		return user;
	}
}
