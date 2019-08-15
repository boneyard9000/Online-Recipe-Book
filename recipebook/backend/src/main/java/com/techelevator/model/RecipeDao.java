package com.techelevator.model;

import java.util.List;

public interface RecipeDao {

	public List<Recipe> getAllRecipes();
	
	public List<Recipe> getAllRecipesByUserId(int userId);
	
	public Recipe getRecipeById(int recipeId);
	
	public List<Recipe> getRecipesByCategory(String category);
	
	public Recipe getRecipeByName(String searchName); 
	
//	public List<Recipe> searchRecipesByName(String searchString);
	
	public List<Recipe> getRecipeByMaxCookTime(int maxCookTime);
	
	public List<Recipe> getRecipesByIngredients(String searchWords);
	
	public void saveRecipe(Recipe recipe, User u);
	
	public void saveRecipeToUser(int userId, int recipeId);
	
	public Recipe update(Recipe recipe);
	
}
