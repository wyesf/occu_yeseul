package com.occu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
		
		// 로그인이자 대문 페이지
		@RequestMapping("/")
		public String occuMain() {
			System.out.println("main/landing");
			return "main/landing";
		}
		
		// 메인 페이지
		@RequestMapping("/index")
		public String index() {
			System.out.println("index");
			return "main/index"; // 리볼버에서 WEB-INF/views/와 .jsp를 정의해놓음
		}
}
