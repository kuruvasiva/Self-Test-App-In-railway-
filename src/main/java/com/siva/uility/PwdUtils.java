package com.siva.uility;

import java.security.SecureRandom;

import org.apache.commons.text.RandomStringGenerator;

public class PwdUtils {
	private static final String PASSWORD_CHARACTERS =
	           "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

	    public static String generatePassword() {
	    	
	        SecureRandom secureRandom = new SecureRandom();
	        RandomStringGenerator generator = new RandomStringGenerator.Builder()
	                .usingRandom(secureRandom::nextInt)
	                .selectFrom(PASSWORD_CHARACTERS.toCharArray())
	                .build();
	        return generator.generate(10);
	    }
	
}
