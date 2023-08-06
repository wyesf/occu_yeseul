package com.occu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.occu.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/joinForm")
	public String joinForm() {
		
		String test = "test";
		
	    return "user/joinForm";
	}
	
	
	@RequestMapping(value="/checkId", method= {RequestMethod.POST})
	public String checkId(@RequestParam("userId") String id) {
		
		System.out.println("UserCTR idcheck: " + id);
		
		userService.checkId(id); 
		
		return "";
	}
}
