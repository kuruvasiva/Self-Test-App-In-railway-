package com.siva.services;

import java.util.List;

import com.siva.binding.LoginForm;
import com.siva.binding.PasswordReset;
import com.siva.binding.SignUpForm;
import com.siva.entity.UserDetails;

public interface IUserService {

	public boolean signUp(SignUpForm sForm);

	public UserDetails login(LoginForm lForm);

	public boolean CheckEmailforPwd(String emailCheck);

	public boolean changeNewPassword(PasswordReset passwordReset);

	public UserDetails findByUserId(Integer userId);

	public String userProfileUpdate(UserDetails updateUser);

	public List<UserDetails> listOfUsers();
	
	public String deleteUserByAdmin(Integer userId);
}
