//package com.techelevator.controller;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.CrossOrigin;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.PutMapping;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//
//import com.techelevator.model.Recipe;
//import com.techelevator.model.RecipeDao;
//import com.techelevator.recipe.exception.RecipeNotFoundException;
//
//@RestController
//@CrossOrigin
//@RequestMapping("/api/recipes")
//public class RecipeController {
//
//		private RecipeDao recipeDao;
//		
//		@Autowired
//		public RecipeController(RecipeDao recipeDao) {
//			this.recipeDao = recipeDao;
//		}
//		
////		@GetMapping("/{recipeId}")
////		public Recipe read(@PathVariable int recipeId) {
////			Recipe recipe= recipeDao.getRecipeById(recipeId)
////		}
//		
//		
//		@PutMapping("/{recipeId}")
//		public Recipe update(@PathVariable int recipeId, @RequestBody Recipe recipe) {
//			Recipe requestedRecipe= recipeDao.getRecipeById(recipeId);
//			if (requestedRecipe != null) {
//				recipe.setRecipeId(recipeId);
//				return recipeDao.update(recipe);
//			}
//			else {
//				throw new RecipeNotFoundException(recipeId);
//			}
//		}
//		
//		
//		
//}
