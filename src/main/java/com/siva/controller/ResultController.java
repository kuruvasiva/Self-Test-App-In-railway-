package com.siva.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.siva.entity.ResultEntity;
import com.siva.services.IResutServiceMgmt;
import com.siva.services.IUserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ResultController {

	@Autowired
	private IResutServiceMgmt resultService;

	@Autowired
	private IUserService userService;

	@Autowired
	private HttpSession session;

	@GetMapping("/contact")
	public String getContactPage() {
		return "contact";
	}

	@PostMapping("/saveFeedback")
	public String saveFeedback(@RequestParam("feedback") String saveFeedback, RedirectAttributes attrs) {
		String saveFeedbackMsg = resultService.saveFeedbackMsg(saveFeedback);
		attrs.addFlashAttribute("msg", saveFeedbackMsg);
		return "redirect:home";
	}

	@GetMapping("/resultsByUser")
	public String resultDataByUser(Map<String, Object> map, RedirectAttributes attrs) {

		Integer userId = (Integer) session.getAttribute("sessionId");

		if (userId != null) {
			List<ResultEntity> listOfResultsByUser = resultService
					.listOfResultsByUser(userService.findByUserId(userId));
			map.put("resutlByUser", listOfResultsByUser);
			return "user_admin_page";
		}
		attrs.addFlashAttribute("msg", "Must login User Credentials with out login can't access.");
		return "redirect:login";
	}

	@GetMapping("/totalResults")
	public String resultDataByAdmin(Map<String, Object> map, RedirectAttributes attrs) {

		Boolean isAdminLogged = (Boolean) session.getAttribute("adminLogged");
		if (Boolean.TRUE.equals(isAdminLogged)) {
			List<ResultEntity> totalResults = resultService.listOfResultDetails();
			map.put("totalResults", totalResults);
			return "admin_page";
		}
		attrs.addFlashAttribute("errMsg", "Must login admin Credentials.");
		return "redirect:home";
	}

	@GetMapping("/deleteResultByUser")
	public String deleteResultData(@RequestParam("rId") Integer resultId,RedirectAttributes attrs) {
		
		Integer userId = (Integer) session.getAttribute("sessionId");
		if (userId == null) {
			attrs.addFlashAttribute("msg", "Must login User Credentials with out login can't access.");
			return "redirect:login";
		}
		String deleteResultsMsg = resultService.deleteTestResultsById(resultId);
		attrs.addFlashAttribute("deleteMsg", deleteResultsMsg);
		return "redirect:resultsByUser";
	}
	
	
}
