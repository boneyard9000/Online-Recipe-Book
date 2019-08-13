package com.techelevator.recipe.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(code=HttpStatus.NOT_FOUND)
public class RecipeNotFoundException extends RuntimeException{

	private static final long serialVersionUID = 6974644855556556894L;
	
	private int recipeId;
	
	public RecipeNotFoundException (int recipeId) {
		super("Sorry user, your recipe is in another castle");
		setRecipeId(recipeId);
	}
	
	public int getRecipeId() {
		return recipeId;
	}
	
	public void setRecipeId(int recipeId) {
		this.recipeId = recipeId;
	}
}
