package com.example.rest4flutter.controller;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.rest4flutter.dto.Member;
import com.example.rest4flutter.dto.User;
import com.example.rest4flutter.dto.UserData;

@CrossOrigin("*")
@RestController
@RequestMapping("/api")
public class FlutterApiController {

	@PostMapping("/user")
	public User user(@RequestBody User user) {
		System.out.println("api Post user ...................");

		System.out.println(user);
		
		return user;
	}
	
	@PostMapping("/submit")
	public String submit(@RequestBody Member member) {
		System.out.println("api Post submit.........");
		
		System.out.println(member);
		
		return "good";
	}
	
	@PostMapping("/post")
	public String postUseData(@RequestBody UserData userData) {
		System.out.println("-------------------");
		System.out.println("사용자 데이터를 잘 받았어요 ---" + userData);
		
		return "good bye~~";
	}
}
