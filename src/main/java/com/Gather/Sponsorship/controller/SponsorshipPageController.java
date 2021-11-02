package com.Gather.Sponsorship.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SponsorshipPageController {

	
//	@GetMapping("/showProject1")
//	public String showProject() {
//		return "Sponsorship/project";
//	}
	
//	@GetMapping("/payment")
//	public String payment() {
//		return "Sponsorship/payment";
//	}
	
	@GetMapping("/favorite")
	public String favorite() {
		return "Sponsorship/favorite";
	}
	
	
}
