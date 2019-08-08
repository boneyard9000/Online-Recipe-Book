package com.techelevator.model;

import java.util.List;

public interface RecipeDao {

	public List<Recipe> getAllRecipes();
	
	public Recipe getRecipeById(int recipeId);
	
	public List<Recipe> getRecipesByCategory(String category);
	
	public Recipe getRecipeByName(String searchName); 
	
//	public List<Recipe> searchRecipesByName(String searchString);
	
	public List<Recipe> getRecipeByMaxCookTime(int maxCookTime);
	
	public List<Recipe> getRecipesByIngredients(String searchWords);
}
