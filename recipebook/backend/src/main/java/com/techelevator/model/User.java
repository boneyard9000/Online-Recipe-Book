package com.techelevator.model;

import javax.validation.constraints.AssertTrue;
import javax.validation.constraints.NotBlank;


/**
 * User
 */
public class User {
	
	private long id;
	
    @NotBlank(message = "First Name is required")
    private String firstName;
    
    @NotBlank(message = "Last Name is required")
    private String lastName;

    @NotBlank(message = "Email is required")
    private String email;

    @NotBlank(message = "Phone number is required")
    private String phoneNumber;
    
    @NotBlank
    private String role = "registered";
    
    private String groceryList;
    
    @NotBlank(message = "Password is required")
    private String password;
    private String confirmPassword;

    private boolean passwordMatching;

    @AssertTrue(message = "Passwords must match")
    public boolean isPasswordMatching() {
        if (password != null) {
            return password.equals(confirmPassword);
        }
        return true;
    }

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}
	
	public String getRole() {
		return role;
	}
	
	public void setRole(String role) {
		this.role = role;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	public void setPasswordMatching(boolean passwordMatching) {
		this.passwordMatching = passwordMatching;
	}

	public String getGroceryList() {
		return groceryList;
	}
	
	public void setGroceryList(String groceryList) {
		this.groceryList = groceryList;
	}
}