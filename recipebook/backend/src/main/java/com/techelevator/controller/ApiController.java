package com.techelevator.controller;

import com.techelevator.authentication.AuthProvider;
import com.techelevator.authentication.UnauthorizedException;
import com.techelevator.model.GroceryList;
import com.techelevator.model.Recipe;
import com.techelevator.model.RecipeDao;
import com.techelevator.model.User;
import com.techelevator.model.UserDao;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * ApiController
 */
@RestController
@CrossOrigin
@RequestMapping("/api")
public class ApiController {

    @Autowired
    private AuthProvider authProvider;
    
    @Autowired
    private RecipeDao recipeDao;
    @Autowired
    private UserDao userDao;

    @RequestMapping(path = "/", method = RequestMethod.GET)
    public String authorizedOnly() throws UnauthorizedException {
        /*
        You can lock down which roles are allowed by checking
        if the current user has a role.
        
        In this example, if the user does not have the admin role
        we send back an unauthorized error.
        */
        if (!authProvider.userHasRole(new String[] { "registered" })) {
            throw new UnauthorizedException();
        }
        return "Success";
    }

    @GetMapping("/recipes")
	public List<Recipe> displayAllRecipes() {
		List <Recipe> l = recipeDao.getAllRecipes();
		return l;
	}

	@GetMapping("/recipes/user")
	public List<Recipe> displayUserRecipes() {
		User u = authProvider.getCurrentUser();

		List <Recipe> l = recipeDao.getAllRecipesByUserId((int)u.getId());
		return l;
	}
	
	@GetMapping("/recipeDetails/{recipeId}")
	public Recipe displayRecipeDetails(@PathVariable int recipeId) {
		Recipe r = recipeDao.getRecipeById(recipeId);
		return r;	
	}
	
	@GetMapping("/user")
	public User getUser() {
		User u = authProvider.getCurrentUser();
		return u;
	}
	
	@PostMapping("/SubmitRecipe")
	public void addRecipe(@Valid @RequestBody Recipe recipe) {
		User u = authProvider.getCurrentUser();
		recipeDao.saveRecipe(recipe, u);
	}
	
	@PutMapping("/groceries")
	public void addGroceries(@Valid @RequestBody GroceryList currentGroceryList) {
		User u = authProvider.getCurrentUser();
		userDao.addToGroceryList((int) u.getId(), currentGroceryList.getAllGroceries());
	}
	
}