package com.siva.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.siva.binding.LoginForm;
import com.siva.binding.QuestionListForm;
import com.siva.entity.QuestionStoringEntity;
import com.siva.services.IQuestionStoringServicesMgmt;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class QuestionStoringController {

	@Autowired
	private IQuestionStoringServicesMgmt questionServices;

	@Autowired
	private HttpSession session;

	@GetMapping("/home")
	public String returnHomePage(@ModelAttribute("adminForm") LoginForm lForm, RedirectAttributes attrs) {

		Integer userId = (Integer) session.getAttribute("sessionId");
		if (userId == null) {
			attrs.addFlashAttribute("msg", "Must login User Credentials with out login can't access this site.");
			return "redirect:login";
		}
		return "home";
	}

	@GetMapping("/test")
	public String getDataPage(@RequestParam("category") String category, Map<String, Object> map,
			RedirectAttributes attrs) {

		Integer userId = (Integer) session.getAttribute("sessionId");
		if (userId == null) {
			attrs.addFlashAttribute("msg", "Must login User Credentials with out login can't access.");
			return "redirect:login";
		}
		if (category.equalsIgnoreCase("UI") || category.equalsIgnoreCase("Java") || category.equalsIgnoreCase("Python")
				|| category.equalsIgnoreCase(".Net") || category.equalsIgnoreCase("Technology")
				|| category.equalsIgnoreCase("Technology") || category.equalsIgnoreCase("General")
				|| category.equalsIgnoreCase("Lifestyle") || category.equalsIgnoreCase("Career")) {

			Set<QuestionStoringEntity> setOfQuestions = questionServices.setOfQuestionBYCategory(category);
			if(setOfQuestions== null) {
				map.put("category", category);
				map.put("msg", "<u style='font-size:30px; color:white;'>["+category+"]</u> Category questions not in database....");
				return "test_questions";
			}
			map.put("ques", setOfQuestions);
			return "test_questions";
		}
		attrs.addFlashAttribute("msg",
				"<h3 style='color:gray;'>Category is name  not found || Invalid category name is <u style='color:red;font-size:30px;'>" + category
						+ "</u></h3>");
		return "redirect:home";
	}

	@PostMapping("/submitAnswer")
	public String submitAnswers1(@RequestParam("questionIds") List<Integer> questionIds, HttpServletRequest request,
			Map<String, Object> map) {
		Map<Integer, String> checkMap = new HashMap<>();
		for (Integer qId : questionIds) {
			String answer = request.getParameter("answer_" + qId);
			if (answer != null) {
				checkMap.put(qId, answer);
			}
		}
		String testResults = questionServices.testResults(checkMap);
		map.put("resultMsg", testResults);
		return "result";
	}
	
	@GetMapping("/saveQuestion")
	public String getRegPage(@ModelAttribute("saveQue") QuestionStoringEntity qse, RedirectAttributes attrs) {

		Integer userId = (Integer) session.getAttribute("sessionId");
		if (userId == null) {
			attrs.addFlashAttribute("msg", "Must login User Credentials with out login can't access.");
			return "redirect:login";
		}
		return "save_question";
	}

	@PostMapping("/saveQuestion")
	public String saveQuestionPage(@ModelAttribute("saveQue") QuestionStoringEntity qse, RedirectAttributes attrs) {

		String queMsg = questionServices.saveQuestion(qse);
		attrs.addFlashAttribute("saveMsg", queMsg);
		return "redirect:user_questions";
	}

	@GetMapping("/adminSaveQuestion")
	public String getSaveByAdminPage(@ModelAttribute("saveQue") QuestionStoringEntity qse, RedirectAttributes attrs) {

		Boolean isAdminLogged = (Boolean) session.getAttribute("adminLogged");
		if (Boolean.TRUE.equals(isAdminLogged)) {

			return "admin_save_question";
		}
		attrs.addFlashAttribute("errMsg", "Must login admin Credentials.");
		return "redirect:home";
	}

	@PostMapping("/adminSaveQuestion")
	public String adminSaveQuestion(@ModelAttribute("saveQue") QuestionStoringEntity qse, RedirectAttributes attrs) {

		String queMsg = questionServices.saveQuestion(qse);
		attrs.addFlashAttribute("saveMsg", queMsg);
		return "redirect:fetch_total_ques";
	}

	@GetMapping("/multiInsert")
	public String saveMultiQuesForm(@ModelAttribute QuestionListForm questionForm, RedirectAttributes attrs) {

		Integer userId = (Integer) session.getAttribute("sessionId");
		if (userId == null) {
			attrs.addFlashAttribute("msg", "Must login User Credentials with out login can't access.");
			return "redirect:login";
		}
		return "save_multi_questions";
	}

	@PostMapping("/multiInsert")
	public String saveMultiQuesResultByUser(@ModelAttribute QuestionListForm questionForm, RedirectAttributes attrs) {

		List<QuestionStoringEntity> listOfQuestion = questionForm.getQuestions();

		List<Integer> listOfIds = questionServices.saveAll(listOfQuestion); // Batch save build after waiting

		attrs.addFlashAttribute("saveMsg",
				"Questions saved successfully !<br> with this Ids <b style='color:#7f7fd5;'> " + listOfIds + "</b>");
		return "redirect:user_questions";
	}

	@GetMapping("/multiInsertByAdmin")
	public String saveMultiQuesFormByAdmin(@ModelAttribute QuestionListForm questionForm, RedirectAttributes attrs) {

		Boolean isAdminLogged = (Boolean) session.getAttribute("adminLogged");
		if (Boolean.TRUE.equals(isAdminLogged)) {

			return "save_multi_quesbyadmin";
		}
		attrs.addFlashAttribute("errMsg", "Must login admin Credentials.");
		return "redirect:home";
	}

	@PostMapping("/multiInsertByAdmin")
	public String saveMultiQuesResultByAdmin(@ModelAttribute QuestionListForm questionForm, RedirectAttributes attrs) {

		List<QuestionStoringEntity> listOfQuestion = questionForm.getQuestions();

		// TODO this below method more data comes build { Batch processing}
		List<Integer> listOfIds = questionServices.saveAll(listOfQuestion); // Batch save build after waiting
		attrs.addFlashAttribute("saveMsg",
				"Questions saved successfully !<br> with this Ids <b style='color:#acb6e5;'> " + listOfIds + "</b>");
		return "redirect:fetch_total_ques";
	}

	@GetMapping("userAdmin")
	public String getUserAdminPage(RedirectAttributes attrs, Map<String, Object> map) {
		Integer userId = (Integer) session.getAttribute("sessionId");
		if (userId == null) {
			attrs.addFlashAttribute("msg", "Must login User Credentials with out login can't access.");
			return "redirect:login";
		}
		return "user_admin_page";
	}
	
	
	@GetMapping("/user_questions")
	public String getUserQuesPage(RedirectAttributes attrs, Map<String, Object> map) {
		Integer userId = (Integer) session.getAttribute("sessionId");
		if (userId == null) {
			attrs.addFlashAttribute("msg", "Must login User Credentials with out login can't access.");
			return "redirect:login";
		}
		Set<QuestionStoringEntity> setOfQuestionBYUser = questionServices.setOfQuestionBYUser();
		map.put("quesDataList", setOfQuestionBYUser);
		return "user_admin_page";
	}

	@GetMapping("/adminPage")
	public String openAdminPage(RedirectAttributes attrs) {
		Boolean isAdminLogged = (Boolean) session.getAttribute("adminLogged");
		if (Boolean.TRUE.equals(isAdminLogged)) {

			return "admin_page"; // your actual admin page JSP
		}
		attrs.addFlashAttribute("errMsg", " Must login admin credentials");
		return "redirect:home"; // or show modal form again or error
	}

	@PostMapping("adminLogin")
	public String getAdminDetails(@ModelAttribute("adminForm") LoginForm lForm, RedirectAttributes attrs) {

		if (lForm.getUserEmail().equalsIgnoreCase("chirukurasiva@gmail.com")
				&& lForm.getUserPassword().equalsIgnoreCase("Shiva@9090")) {
			session.setAttribute("adminLogged", true);
			return "redirect:adminPage";
		}
		attrs.addFlashAttribute("errMsg", "admin invalid Credentials.");
		return "redirect:home";
	}

	@GetMapping("/fetch_total_ques")
	public String getTotalQuestionInTableForm(Map<String, Object> map, RedirectAttributes attrs) {

		Boolean isAdminLogged = (Boolean) session.getAttribute("adminLogged");
		if (Boolean.TRUE.equals(isAdminLogged)) {

			Set<QuestionStoringEntity> setOfQuestions = questionServices.setOfQuestion();
			map.put("quesDataList", setOfQuestions);
			return "admin_page";
		}

		attrs.addFlashAttribute("errMsg", "Must login admin Credentials.");
		return "redirect:home";

	}

	@GetMapping("updateQuestionByUser")
	public String getUpdateQsesByUser(@RequestParam("qId") Integer qId,
			@ModelAttribute("UpdateQue") QuestionStoringEntity qes, RedirectAttributes attrs) {

		QuestionStoringEntity findQseById = questionServices.findByQseByInteger(qId);
		BeanUtils.copyProperties(findQseById, qes);
		return "update_question";
	}

	@PostMapping("updateQuestionByUser")
	public String updateQsesByUser(@ModelAttribute("UpdateQue") QuestionStoringEntity qes, RedirectAttributes attrs) {

		if (qes.getUser() != null || qes.getUser().getUserId() != null) {
			String updateQseMag = questionServices.updateQseById(qes);
			attrs.addFlashAttribute("updateMsg", updateQseMag);
			return "redirect:user_questions";
		}
		attrs.addAttribute("updateMsg", "Not update userId null");

		return "update_question";
	}

	@GetMapping("updateQuestionByAdmin")
	public String getUpdateQsePage(@RequestParam("qId") Integer qId,
			@ModelAttribute("UpdateQue") QuestionStoringEntity qes, RedirectAttributes attrs) {

		Boolean isAdminLogged = (Boolean) session.getAttribute("adminLogged");
		if (Boolean.TRUE.equals(isAdminLogged)) {
			BeanUtils.copyProperties(questionServices.findByQseByInteger(qId), qes);
			return "update_question_by_admin";
		}
		attrs.addFlashAttribute("errMsg", "Must login admin Credentials.");
		return "redirect:home";

	}

	@PostMapping("updateQuestionByAdmin")
	public String updateQseByAdmin(@ModelAttribute("UpdateQue") QuestionStoringEntity qes, RedirectAttributes attrs) {

		if (qes.getUser() != null || qes.getUser().getUserId() != null) {
			String updateQseMag = questionServices.updateQseById(qes);
			attrs.addFlashAttribute("updateMsg", updateQseMag);
			return "redirect:fetch_total_ques";
		}
		attrs.addAttribute("updateMsg", "Not update userId is null");
		return "update_question";

	}

	@GetMapping("deleteQuestionByUser")
	public String deleteQseByUser(@RequestParam("qId") Integer qId, RedirectAttributes attrs) {
		Integer userId = (Integer) session.getAttribute("sessionId");
		if (userId == null) {
			attrs.addFlashAttribute("msg", "Must login User Credentials with out login can't access.");
			return "redirect:login";
		}
		String deleteQseMsg = questionServices.deleteQseByQuestionId(qId);
		attrs.addFlashAttribute("deleteMsg", deleteQseMsg);
		return "redirect:user_questions";
	}

	@GetMapping("deleteQuestionByAdmin")
	public String deleteQseById(@RequestParam("qId") Integer qId, RedirectAttributes attrs) {

		Boolean isAdminLogged = (Boolean) session.getAttribute("adminLogged");
		if (Boolean.TRUE.equals(isAdminLogged)) {

			//System.out.println("\033[1;32m if condtiond " + Boolean.FALSE.equals(isAdminLogged) + "\033[1;0m");
			String deleteQseMsg = questionServices.deleteQseByQuestionId(qId);
			attrs.addFlashAttribute("deleteMsg", deleteQseMsg);
			return "redirect:fetch_total_ques";
		}

		attrs.addFlashAttribute("errMsg", "Must login admin Credentials.");
		return "redirect:home";

	}

}
