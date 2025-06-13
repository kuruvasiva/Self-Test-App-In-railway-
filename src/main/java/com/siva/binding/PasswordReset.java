package com.siva.binding;

import lombok.Data;

@Data
public class PasswordReset {

	private String email;

	private String temPwd;
	
	private String newPwd; 
	
	private String conPwd; 
	
	
}
