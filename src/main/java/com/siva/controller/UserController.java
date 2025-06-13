package com.siva.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.siva.binding.LoginForm;
import com.siva.binding.PasswordReset;
import com.siva.binding.SignUpForm;
import com.siva.entity.UserDetails;
import com.siva.services.IUserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

	@Autowired
	private IUserService userService;

	@Autowired
	private HttpSession session;

	public String getIndexPage() {

		return "index";
	}

	// @RequestMapping("/*/{*}")
	/*
	public String handleFallback(HttpServletRequest request) {
		Integer userId = (Integer) session.getAttribute("sessionId");
		if (userId != null) {
			request.setAttribute("err",
					"<h1 style='font-size:80px; color:white; text-shadow:2px 2px #90d4f5; font-weight:bold';>${status}</h1>"
							+ "<b style='color:gray; font-size:30px;'> Page not found...</b>"
							+ "[<i style='color:red; font-size:25px;'>" + request.getServletPath()
							+ "</i>] This url is wrong" + "<br><hr>");
			return "home"; // again return your homepage view
		}
		return "error";
	}*/
	@GetMapping("/error")
	public String errorPage() {
		session.removeAttribute("err");
		return "error";
	}

	@GetMapping("/signup")
	public String signUpPage(@ModelAttribute("user") SignUpForm signForm) {

		return "signup";
	}

	@PostMapping("/signup")
	public String handleSignUp(@ModelAttribute("user") SignUpForm signForm, RedirectAttributes attrs) {

		boolean emailUnique = userService.signUp(signForm);
		if (emailUnique) {
			attrs.addFlashAttribute("succMsg", " Account is created and Check your email and login ");

			return "redirect:login";
		}
		attrs.addFlashAttribute("errMsg", "Use Unique Email your eamil <br> already this email having an account");
		return "redirect:signup";
	}

	@GetMapping("/login")
	public String loginPage(@ModelAttribute("lForm") LoginForm lForm) {

		return "login";
	}

	@PostMapping("/login")
	public String loginHandlePage(@ModelAttribute("lForm") LoginForm lForm, RedirectAttributes attrs) {
		// use service
		UserDetails login = userService.login(lForm);
		if (login == null) {
			attrs.addFlashAttribute("msg", "Email and Password Invalid Credentials");
			return "redirect:login";
		}
		session.setAttribute("sessionId", login.getUserId());
		return "redirect:home";// question home

	}

	@GetMapping("/checkEmail")
	public String forgotPwdPage() {

		return "forgot";
	}

	@PostMapping("/checkEmail")
	public String forgotPwdChceckPage(@RequestParam("email") String email,
			@ModelAttribute("passwordReset") PasswordReset passwordReset, Map<String, Object> map) {

		boolean checkEmail = userService.CheckEmailforPwd(email);
		if (checkEmail) {

			passwordReset.setEmail(email);
			// model.addAttribute("passwordReset",pass );

			map.put("msg", "Check your email temporary  password is sent ");

			return "resetpsw";
		}
		map.put("msg", "please enter your valid email ");
		return "forgot";

	}

	@GetMapping("/changePassword")
	public String resetChangePSW(@ModelAttribute("passwordReset") PasswordReset passwordReset) {

		return "resetpsw";
	}

	@GetMapping("/temPassWrong")
	public String resetChangePSW(@RequestParam("email") String email,
			@ModelAttribute("passwordReset") PasswordReset passwordReset) {
		passwordReset.setEmail(email);
		return "resetpsw";
	}

	@PostMapping("/changePassword")
	public String handleUnclockPage(@ModelAttribute("passwordReset") PasswordReset passwordReset,
			RedirectAttributes attrs) {

		boolean status = userService.changeNewPassword(passwordReset);
		if (status) {
			attrs.addFlashAttribute("succMsg", "Your password is  successfully Updated now login new password");
			return "redirect:login";
		}
		//
		attrs.addFlashAttribute("errMsg", "Your temp Password is Wrong");
		// "
		return "redirect:temPassWrong?email=" + passwordReset.getEmail();

	}

	@GetMapping("/userUpdateProfile")
	public String userUpdatePage(@RequestParam("userId") Integer userId,
			@ModelAttribute("userUpdateDetails") UserDetails userUpadeDetails, Map<String, Object> map,
			RedirectAttributes attrs) {
		try {
			Integer sessionId = (Integer) session.getAttribute("sessionId");
			if (sessionId == null) {
				attrs.addFlashAttribute("msg", "Must login User Credentials with out login can't access.");
				return "redirect:login";
			}
			UserDetails UserById = userService.findByUserId(userId);
			BeanUtils.copyProperties(UserById, userUpadeDetails);
			List<String> indianStates = List.of("Andhra Pradesh", "Arunachal Pradesh", "Assam", "Bihar",
					"Chhattisgarh", "Goa", "Gujarat", "Haryana", "Himachal Pradesh", "Jharkhand", "Karnataka", "Kerala",
					"Madhya Pradesh", "Maharashtra", "Manipur", "Meghalaya", "Mizoram", "Nagaland", "Odisha", "Punjab",
					"Rajasthan", "Sikkim", "Tamil Nadu", "Telangana", "Tripura", "Uttar Pradesh", "Uttarakhand",
					"West Bengal");

			map.put("states", indianStates);
			return "userprofile";

		} catch (Exception e) {
			map.put("errorMessage", e.getMessage());
			return "error";
		}
	}

	@PostMapping("/userUpdateProfile")
	public String userUpdate(@RequestParam("image") MultipartFile file,
			@ModelAttribute("userUpdateDetails") UserDetails userUpadeDetails, RedirectAttributes attrs)
			throws IOException {

		userUpadeDetails.setProfileImage(file.getBytes());
		String userProfileUpdateMsg = userService.userProfileUpdate(userUpadeDetails);

		attrs.addFlashAttribute("msg", userProfileUpdateMsg);

		return "redirect:home";
	}

	@GetMapping("/logout")
	public String userLogout() {
		session.invalidate();
		return "redirect:./";
	}

	@GetMapping("/user/photo/{id}")
	@ResponseBody
	public ResponseEntity<byte[]> getUserPhoto(@PathVariable Integer id) {
		UserDetails userDetails = userService.findByUserId(id);
		if (userDetails == null) {

		}
		/* System.out.println("\033[1;31m"+userDetails.getProfileImage()+"\033[1;0m");*/
		return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG) // Change if using PNG
				.body(userDetails.getProfileImage());
	}

	@GetMapping("/total_user_detals")
	public String totalUserDetails(Map<String, Object> map, RedirectAttributes attrs) {

		Boolean isAdminLogged = (Boolean) session.getAttribute("adminLogged");
		if (Boolean.TRUE.equals(isAdminLogged)) {

			List<UserDetails> listOfUsers = userService.listOfUsers();
			map.put("listOfUsers", listOfUsers);
			return "admin_page";
		}
		attrs.addFlashAttribute("errMsg", "Must login admin Credentials.");
		return "redirect:home";
	}

	@GetMapping("/deleteUserByAdmin") // this is user
	public String deleteUserByAdmin(@RequestParam("userId") Integer userId, RedirectAttributes attrs) {
		Boolean isAdminLogged = (Boolean) session.getAttribute("adminLogged");
		if (Boolean.TRUE.equals(isAdminLogged)) {
			String deleteUserByAdmin = userService.deleteUserByAdmin(userId);
			attrs.addFlashAttribute("deleteMsg", deleteUserByAdmin);
			return "redirect:total_user_detals";
		}
		attrs.addFlashAttribute("errMsg", "Must login admin Credentials.");
		return "redirect:home";
	}

}
