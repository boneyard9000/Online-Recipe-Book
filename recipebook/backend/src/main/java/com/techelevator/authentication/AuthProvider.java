package com.techelevator.authentication;

import com.techelevator.model.User;

public interface AuthProvider {
    /**
     * Returns true if a current user is logged in.
     * @return true if user is logged in
     */
    boolean isLoggedIn();

    /**
     * Returns the currently signed in user.
     * @return the currently signed in user
     */
    User getCurrentUser();

    /**
     * Signs in a user using the given email and password
     * @param email the given email
     * @param password the given password
     * @return true if user was successfully signed in
     */
    boolean signIn(String email, String password);

    /**
     * Sign out the currently signed in user
     */
    void logOff();

    /**
     * Change the current signed in user's password.
     * @param existingPassword the current user's current password
     * @param newPassword the new password for the current user
     * @return true, if successful
     */
    boolean changePassword(String existingPassword, String newPassword);

    /**
     * Register a new user to the system
     * @param email the new user's email
     * @param password the new user's password
     * @param role the new user's role
     */
    void register(String firstName, String lastName, String email, String phoneNumber, String password, String role);

    /**
     * Checks to see if the current user has one of the given roles
     * @param roles the roles to check for
     * @return true, if the user has one of the roles
     */
    boolean userHasRole(String[] roles);
}
