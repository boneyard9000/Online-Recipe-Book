package com.techelevator.model;

import javax.validation.constraints.NotBlank;

public class Recipe {

	private int recipeId;
	
    @NotBlank(message = "Recipe name is required")
	private String recipeName;
    
    @NotBlank(message = "Description is required")
	private String description;
    
    @NotBlank(message = "Cook time is required")
	private String cookMins;
    
    @NotBlank(message = "Directions is required")
	private String directions;
    
    @NotBlank(message = "Ingredients is required")
	private String ingredients;
    
    @NotBlank(message = "Cateogry is required")
	private String category;
    
    private String recipePic;
	
	
	public int getRecipeId() {
		return recipeId;
	}
	public void setRecipeId(int recipeId) {
		this.recipeId = recipeId;
	}
	public String getRecipeName() {
		return recipeName;
	}
	public void setRecipeName(String recipeName) {
		this.recipeName = recipeName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getCookMins() {
		return cookMins;
	}
	public void setCookMins(String cookMins) {
		this.cookMins = cookMins;
	}
	public String getDirections() {
		return directions;
	}
	public void setDirections(String directions) {
		this.directions = directions;
	}
	public String getIngredients() {
		return ingredients;
	}
	public void setIngredients(String ingredients) {
		this.ingredients = ingredients;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	public void setRecipePic(String recipePic) {
		this.recipePic = recipePic;
	}
	public String getRecipePic() {
	return recipePic;
	}
	
}
