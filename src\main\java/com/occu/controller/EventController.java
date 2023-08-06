package com.occu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.occu.service.EventService;
import com.occu.vo.EventVo;

@Controller
@RequestMapping("/event")
public class EventController {
	
	@Autowired
	private EventService eventService;
	
	// event main 페이지
	@RequestMapping("/")
	public String event() {
		System.out.println("event");
		return "event/eventMain";
	}

	// event form 페이지
	@RequestMapping("/form")
	public String eventForm() {
		System.out.println("event/form");
		return "event/eventForm";
	}

//	// 파일 업로드
//	@RequestMapping(value="/upload", method= {RequestMethod.GET})
//	public String upload(@RequestParam("file") MultipartFile file, @ModelAttribute EventVo eventVo) {
//		
//		System.out.println("EventController upload : " + file.getOriginalFilename() + ", " + eventVo);
//		
//		return eventService.restore(file, eventVo);
//	}
	
	
	// 폼 insert
	@RequestMapping(value="/info", method = {RequestMethod.GET, RequestMethod.POST})
	public String eventInfo(@ModelAttribute EventVo eventVo) {  //1.eventInfo의 매개변수를 정해줌
		
		System.out.println("EventController info1: " + eventVo.toString());
		
		MultipartFile formFile = eventVo.getFormFile();
		System.out.println("formFile check: " + formFile + ", " + formFile.getClass().getName());
		
//		String formLmtb = eventVo.getFormLmtb();
//		System.out.println("formLmtb check: " + formLmtb + ", " + formLmtb.getClass().getName());
		
		int result = eventService.restore(formFile, eventVo);  //3.eventSeervice의 restore의 formFile, Vo 매개변수를 받는다.
		System.out.println("formPath check: " + eventVo.getFormPath());
		System.out.println("EventController info2: " + eventVo.toString());
		System.out.println("redirect result check: " + result);
		
		if (result == 1) {
			// select service 연결
			EventVo vo = eventService.selectForm(eventVo);
			System.out.println("eventCtr formNo ck: " + vo.toString());
			
			int num = vo.getFormNo();
			
//			return "redirect:/event/infoOk/" + formNo;
			return "redirect:/event/infoOk/" + num;
		} else {
			return "redirect:/event/form?result=fail";
		}
		
//		return eventService.restore(file, eventVo);
//		return eventService.createForm(eventVo);
//		return "event/eventForm";  //2.eventForm jsp를 return받을때
//		return "redirect:/event/infoOk";
	}
	
	// event infoOk 넘버 페이지 (폼 select)
	@RequestMapping(value="/infoOk/{formNo}", method = {RequestMethod.GET, RequestMethod.POST})
	public String infoOk(@PathVariable("formNo") int formNo, Model model) {
		
		System.out.println("event/infoOk");

		EventVo dataVo = eventService.selectFormInfo(formNo);
		
		
		
		System.out.println("EventController infoOk dataVo: " + dataVo);
//		System.out.println("EventController infoOk eventVo: " + eventVo);
		
		model.addAttribute("formData", dataVo);
		return "event/eventInfo";
	}
	
	
	

}
