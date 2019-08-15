package com.techelevator.model;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import javax.sql.DataSource;

import com.techelevator.authentication.PasswordHasher;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JdbcUserDao implements UserDao {

    private JdbcTemplate jdbcTemplate;
    private PasswordHasher passwordHasher;

    /**
     * Create a new user dao with the supplied data source and the password hasher
     * that will salt and hash all the passwords for users.
     *
     * @param dataSource an SQL data source
     * @param passwordHasher an object to salt and hash passwords
     */
    @Autowired
    public JdbcUserDao(DataSource dataSource, PasswordHasher passwordHasher) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
        this.passwordHasher = passwordHasher;
    }

    /**
     * Save a new user to the database. The password that is passed in will be
     * salted and hashed before being saved. The original password is never
     * stored in the system. We will never have any idea what it is!
     *
     * @param userName the user name to give the new user
     * @param password the user's password
     * @param role the user's role
     * @return the new user
     */
    @Override
    public User saveUser(String firstName,String lastName, String email, String phoneNumber, String password, String role) {
        byte[] salt = passwordHasher.generateRandomSalt();
        String hashedPassword = passwordHasher.computeHash(password, salt);
        String saltString = new String(Base64.getEncoder().encode(salt));
        long newId = jdbcTemplate.queryForObject(
                "INSERT INTO users(first_name, last_name, password, salt, email, phone, role) VALUES (?, ?, ?, ?, ?, ?, ?) RETURNING user_id", Long.class,
                firstName, lastName, hashedPassword, saltString, email, phoneNumber, role);

        User newUser = new User();
        newUser.setId(newId);
        newUser.setFirstName(firstName);
        newUser.setLastName(lastName);
        newUser.setEmail(email);
        newUser.setPhoneNumber(phoneNumber);
        newUser.setPassword(hashedPassword);
        newUser.setRole(role);

        return newUser;
    }

    @Override
    public void changePassword(User user, String newPassword) {
        byte[] salt = passwordHasher.generateRandomSalt();
        String hashedPassword = passwordHasher.computeHash(newPassword, salt);
        String saltString = new String(Base64.getEncoder().encode(salt));

        jdbcTemplate.update("UPDATE users SET password=?, salt=? WHERE user_id=?", hashedPassword, saltString, user.getId());
    }

    /**
     * Look for a user with the given username and password. Since we don't
     * know the password, we will have to get the user's salt from the database,
     * hash the password, and compare that against the hash in the database.
     *
     * @param userName the user name of the user we are checking
     * @param password the password of the user we are checking
     * @return true if the user is found and their password matches
     */
    @Override
    public User getValidUserWithPassword(String email, String password) {
        String sqlSearchForUser = "SELECT * FROM users WHERE email = ?";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchForUser, email);

        if (results.next()) {
            String storedSalt = results.getString("salt");
            String storedPassword = results.getString("password");
            String hashedPassword = passwordHasher.computeHash(password, Base64.getDecoder().decode(storedSalt));
            if (storedPassword.equals(hashedPassword)) {
                return mapResultToUser(results);
            } else {
                return null;
            }
        } else {
            return null;
        }
    }

    /**
     * Get all of the users from the database.
     * @return a List of user objects
     */
    @Override
    public List<User> getAllUsers() {
        List<User> users = new ArrayList<User>();
        String sqlSelectAllUsers = "SELECT user_id, first_name, last_name, phone, password, email, role, grocery_list FROM users";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllUsers);

        while (results.next()) {
            User user = mapResultToUser(results);
            users.add(user);
        }

        return users;
    }

    private User mapResultToUser(SqlRowSet results) {
        User user = new User();
        user.setId(results.getLong("user_id"));
        user.setFirstName(results.getString("first_name"));
        user.setLastName(results.getString("last_name"));
        user.setEmail(results.getString("email"));
        user.setPhoneNumber(results.getString("phone"));
        user.setPassword(results.getString("password"));
        user.setRole(results.getString("role"));
        user.setGroceryList(results.getString("grocery_list"));
        return user;
    }

    @Override
    public User getUserByEmail(String email) {
        String sqlSelectUserByEmail = "SELECT user_id, first_name, last_name, phone, password, email, role, grocery_list FROM users WHERE email = ?";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectUserByEmail, email);

        if (results.next()) {
            return mapResultToUser(results);
        } else {
            return null;
        }
    }
    
    

	@Override
	public void addToGroceryList(int userId, String groceryList) {
		String sqlUpdateGroceries = "UPDATE users SET grocery_list = ? WHERE user_id = ?";
		
		jdbcTemplate.update(sqlUpdateGroceries, groceryList, userId);
		
	}
	
	@Override
	public void updateGroceryList(int userId, String groceryList) {
		String sqlUpdateGroceryList = "UPDATE users SET grocery_list = ? WHERE user_id = ?";
		jdbcTemplate.update(sqlUpdateGroceryList, groceryList, userId);

	}
	
	@Override
	public void deleteRecipeFromUser(int userId, int recipeId) {
		String sqlDeleteFromUser = "DELETE FROM user_recipes WHERE user_id = ? AND recipe_id = ?";
		jdbcTemplate.update(sqlDeleteFromUser, userId, recipeId);
	}

}
