package com.siva.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.siva.binding.LoginForm;
import com.siva.binding.PasswordReset;
import com.siva.binding.SignUpForm;
import com.siva.entity.UserDetails;
import com.siva.repository.IUserDetailsReposiory;
import com.siva.uility.EmailUtils;
import com.siva.uility.PwdUtils;

@Service
public class UserServiceImpl implements IUserService {

	@Autowired
	private IUserDetailsReposiory userRepo;

	@Autowired
	private EmailUtils emailUtils;

	@Override
	public boolean signUp(SignUpForm sForm) {

		UserDetails userLogin = userRepo.findByUserEmail(sForm.getUserEmail());

		if (userLogin != null) {

			return false;
		}

		// TODO: copy of form object
		UserDetails user = new UserDetails();

		BeanUtils.copyProperties(sForm, user);

		// TODO: insert to record
		userRepo.save(user);

		// TODO : send email to unlock the account

		String toEmail = sForm.getUserEmail();
		String subject = " Create your Account ! SelfTest ";
		StringBuffer body = new StringBuffer();
		body.append("Hello " + user.getUserName());
		body.append("<br>");
		body.append("<h3 style='color:green; text-align:center;'> Your Account has been successfully created.</h3>");
		body.append("<br> <br>");
		body.append("<p>This is your personal space to learn, practice, and grow."
				+ " You can create your own questions, take tests anytime, and even challenge yourself with questions made by others."
				+ "Track your progress, stay motivated, and keep learning at your own pace. With SelfTest, every step brings you closer to your goals!</p>");

		emailUtils.sendEmail(toEmail, subject, body.toString());

		return true;
	}

	@Override
	public UserDetails login(LoginForm lForm) {
		// use REPO check email and password
		UserDetails userDetails = userRepo.findByUserEmailAndUserPassword(lForm.getUserEmail(),
				lForm.getUserPassword());
		return userDetails;

		// return "Your account still Locked pls unlock your account";
	}

	@Override
	public boolean CheckEmailforPwd(String emailCheck) {
		// TODO Auto-generated method stub
		UserDetails findUserByEmail = userRepo.findByUserEmail(emailCheck);
		if (findUserByEmail == null) {
			return false;
		}

		// TODO: Random password ready
		String tempPwd = PwdUtils.generatePassword();

		findUserByEmail.setUserPassword(tempPwd);
		userRepo.save(findUserByEmail);
		String toEmail = findUserByEmail.getUserEmail();
		String subject = " Forgot Passord  your Account ! selftest ";
		StringBuffer body = new StringBuffer();
		body.append(
				"<h1 style='color:green; text-align:center;'>Use below temparary to password reset your password </h1>");
		body.append("Temporary Password :: " + tempPwd);
		body.append("<br> <br>");

		emailUtils.sendEmail(toEmail, subject, body.toString());

		return true;
	}

	@Override
	public boolean changeNewPassword(PasswordReset passwordReset) {
		// TODO Auto-generated method stub
		UserDetails userFindByEmail = userRepo.findByUserEmail(passwordReset.getEmail());

		if (userFindByEmail.getUserPassword().equalsIgnoreCase(passwordReset.getTemPwd())) {

			userFindByEmail.setUserPassword(passwordReset.getNewPwd());

			userRepo.save(userFindByEmail);
			return true;
		}

		return false;
	}

	@Override
	public UserDetails findByUserId(Integer userId) {
		// TODO Auto-generated method stub
		return userRepo.findById(userId).orElseThrow(() -> new IllegalArgumentException("Invalid Id"));
	}

	@Override
	public String userProfileUpdate(UserDetails updateUser) {
		// Step 1: Load from DB to preserve version and other managed fields
		UserDetails dbUser = userRepo.findById(updateUser.getUserId())
				.orElseThrow(() -> new RuntimeException("User not found"));
		// Step 2: Set only updatable fields from the form
		dbUser.setUserName(updateUser.getUserName());
		dbUser.setUserPhno(updateUser.getUserPhno());
		dbUser.setUserLocation(updateUser.getUserLocation());
		dbUser.setUsagePurpose(updateUser.getUsagePurpose());
		// Add more fields as necessary
		dbUser.setUserRole(updateUser.getUserRole());
		dbUser.setProfileImage(updateUser.getProfileImage());
		// Step 3: Save managed entity — Hibernate handles @Version
		String userName = userRepo.save(dbUser).getUserName();

		return "User details are updated successfully. Username is " + userName;
	}

	@Override
	public List<UserDetails> listOfUsers() {
		// TODO Auto-generated method stub
		return userRepo.findAll().stream().sorted((u1, u2) -> u1.getUserId().compareTo(u2.getUserId())).toList();
	}

	@Override
	public String deleteUserByAdmin(Integer userId) {
		// TODO
		Optional<UserDetails> opt = userRepo.findById(userId);
		if (opt.isPresent()) {
			userRepo.deleteById(userId);

			String toEmail = opt.get().getUserEmail();
			String subject = " Delete your Account By Admin ! SelfTest ";
			StringBuffer body = new StringBuffer();
			body.append("Hello " + opt.get().getUserName());
			body.append("<br>");
			body.append("<h3 style='color:green; text-align:center;'> Your Account has been deleted by Admin.</h3>");
			body.append("<br> <br>");
			body.append(
					"<h2 style='color:red;text-align:center;'>Your account has been permanently deleted due to serious misuse of our platform.</h2>");
			body.append("<p>This decision is final. No further access will be granted.</p>");
			body.append(
					"<p>Your activities were found to be in violation of our terms of service, which all users are required to follow. "
					+ "Misuse may include, but is not limited to, inappropriate behavior, unauthorized access, spamming, or any actions that disrupt the intended use of our services.</p>");
			
			emailUtils.sendEmail(toEmail, subject, body.toString());

			return "User is deleted successfully by admin with is this userId" + userId;
		}
		return "User is not deleted because Invalid Userd Id " + userId;
	}

}
