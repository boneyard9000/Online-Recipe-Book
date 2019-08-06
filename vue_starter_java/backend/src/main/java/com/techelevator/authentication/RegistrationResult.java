package com.techelevator.authentication;

import java.util.ArrayList;
import java.util.List;

public class RegistrationResult {
	
	private boolean success;
	private List<String> errors = new ArrayList<String>();

	
	
	public void addError(String error) {
		errors.add(error);
	}
	
	public boolean getSuccess() {
		return success;
	}
	
	public List<String> getErrors() {
		return errors;
	}
	
	public void setSuccess(boolean success) {
		this.success = success;
	}

}
