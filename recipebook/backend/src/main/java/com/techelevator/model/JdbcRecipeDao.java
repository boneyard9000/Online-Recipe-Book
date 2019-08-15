package com.techelevator.model;

import java.util.ArrayList;

import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.controller.ApiController;

@Component
public class JdbcRecipeDao implements RecipeDao{
	
	private JdbcTemplate jdbcTemplate;
	private ApiController apiController;
	private Map<Integer, Recipe> recipes = new HashMap<>();
	
	
	@Autowired
	public JdbcRecipeDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);

	}
	
	@Override
    public void saveRecipe(Recipe recipe, User u) {
        String sqlCreateRecipe = "INSERT INTO recipes(name, description, cook_time, directions, ingredients, category, recipe_pic) VALUES (?, ?, ?, ?, ?, ?, ?) RETURNING recipe_id";
        SqlRowSet result = jdbcTemplate.queryForRowSet(sqlCreateRecipe, recipe.getRecipeName(), recipe.getDescription(), recipe.getCookMins(), recipe.getDirections(), recipe.getIngredients(), recipe.getCategory(), recipe.getRecipePic());
        if (result.next()) {
        	recipe.setRecipeId(result.getInt("recipe_id"));
            String sqlCreateFavorite = "INSERT INTO user_recipes(user_id, recipe_id) VALUES (?, ?)";
            jdbcTemplate.update(sqlCreateFavorite, u.getId(), recipe.getRecipeId());
        }	
        

    }

	@Override
	public List<Recipe> getAllRecipes() {
		List<Recipe> recipes = new ArrayList<Recipe>();
		String sqlSelectAllRecipes = "SELECT recipe_id, name, description, cook_time, directions, ingredients, category, recipe_pic FROM recipes ORDER BY name";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllRecipes);
		
		while (results.next()) {
			Recipe recipe = populateRecipe(results);
			recipes.add(recipe);
		}
		for(Recipe r : recipes) {
			System.out.println(r.getRecipeName() + r.getDescription());
		}
		
		return recipes;
	}
	
	@Override
	public List<Recipe> getAllRecipesByUserId(int userId) {
		List<Recipe> recipes = new ArrayList<Recipe>();
		String sqlSelectAllRecipes = "SELECT *\n" + 
				"FROM recipes\n" + 
				"JOIN user_recipes ON recipes.recipe_id = user_recipes.recipe_id\n" + 
				"JOIN users ON users.user_id = user_recipes.user_id\n" + 
				"WHERE users.user_id = ? ORDER BY name";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllRecipes, userId);
		
		while (results.next()) {
			Recipe recipe = populateRecipe(results);
			recipes.add(recipe);
		}
		for(Recipe r : recipes) {
			System.out.println(r.getRecipeName() + r.getDescription());
		}
		
		return recipes;
	}

	@Override
	public Recipe getRecipeById(int recipeId) {
		Recipe r = new Recipe();
		
		String sqlRecipeId = "SELECT recipe_id, name, description, cook_time, directions, ingredients, category, recipe_pic FROM recipes WHERE recipe_id = ?";
		SqlRowSet result = jdbcTemplate.queryForRowSet(sqlRecipeId, recipeId);
		while (result.next()) {
			r = populateRecipe(result);
		}
		return r;
	}

	@Override
	public List<Recipe> getRecipesByCategory(String category) {
		List<Recipe> recipes = new ArrayList<Recipe>();
		
		String sqlCategory = "SELECT recipe_id, name, description, cook_time, directions, ingredients, category FROM recipes WHERE category ILIKE ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlCategory, "%" + category + "%");
		while (results.next()) {
			Recipe recipe = populateRecipe(results);
			recipes.add(recipe);
		}
		for(Recipe r : recipes) {
		System.out.println(r.getCategory());
	}
		return recipes;
	}

	@Override
	public Recipe getRecipeByName(String searchName) {
		Recipe r = new Recipe();
		
		String sqlRecipeName = "SELECT recipe_id, name, description, cook_time, directions, ingredients, category, recipe_pic FROM recipes WHERE name ILIKE ?";
		SqlRowSet result = jdbcTemplate.queryForRowSet(sqlRecipeName, "%" + searchName + "%");
		while (result.next()) {
			r = populateRecipe(result);
		}
		System.out.println(r.getRecipeName() + r.getDescription());
		return r;
	}
	
	@Override
	public Recipe update(Recipe recipe) {
		recipes.put(recipe.getRecipeId(), recipe);
		
		String sqlRecipeUpdate = "UPDATE recipes SET name = ?, category = ?, description = ?, cook_time = ?, ingredients = ?, directions = ?, recipe_pic = ? WHERE recipe_id = ?";
		jdbcTemplate.update(sqlRecipeUpdate, recipe.getRecipeName(), recipe.getCategory(), recipe.getDescription(), 
				recipe.getCookMins(), recipe.getIngredients(), recipe.getDirections(), recipe.getRecipePic(), recipe.getRecipeId());
		
		return recipe;
	}

//	@Override
//	public List<Recipe> searchRecipesByName(String searchString) {
//		List<Recipe> recipes = new ArrayList<Recipe>();
//			
//			String sqlRecipeName = "SELECT recipe_id, name, description, cook_time, directions, ingredients, category FROM recipes WHERE name ILIKE '%?%'";
//			SqlRowSet results = jdbcTemplate.queryForRowSet(sqlRecipeName, searchString);
//			while (results.next()) {
//				Recipe recipe = populateRecipe(results);
//				recipes.add(recipe);
//			}
//			for(Recipe r : recipes) {
//			System.out.println(r.getRecipeName() + r.getDescription());
//			}
//			return recipes;
//	}

	@Override
	public List<Recipe> getRecipeByMaxCookTime(int maxCookTime) {
		List<Recipe> recipes = new ArrayList<Recipe>();
		
		String sqlRecipeTime = "SELECT recipe_id, name, description, cook_time, directions, ingredients, category, recipe_pic FROM recipes WHERE cook_time <= ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlRecipeTime, maxCookTime);
		while (results.next()) {
			Recipe recipe = populateRecipe(results);
			recipes.add(recipe);
		}
		for(Recipe r : recipes) {
			System.out.println(r.getRecipeName() + r.getDescription());
			}
		return recipes;
	}

	@Override
	public List<Recipe> getRecipesByIngredients(String searchWords) {
		List<Recipe> recipes = new ArrayList<Recipe>();
		
		String sqlRecipeIngredients = "SELECT recipe_id, name, description, cook_time, directions, ingredients, category, recipe_pic FROM recipes WHERE ingredients ILIKE ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlRecipeIngredients, "%" + searchWords + "%");
		while (results.next()) {
			Recipe recipe = populateRecipe(results);
			recipes.add(recipe);
		}
		System.out.println(recipes);
		return recipes;
	}
	
	private Recipe populateRecipe(SqlRowSet results) {
		Recipe r = new Recipe();
		r.setCategory(results.getString("category"));
		r.setCookMins(results.getString("cook_time"));
		r.setDescription(results.getString("description"));
		r.setDirections(results.getString("directions"));
		r.setIngredients(results.getString("ingredients"));
		r.setRecipeId(results.getInt("recipe_id"));
		r.setRecipeName(results.getString("name"));
		r.setRecipePic(results.getString("recipe_pic"));
		
		return r;
	}

	@Override
	public void saveRecipeToUser(int userId, int recipeId) {
		String sqlSaveRecipeToUser = "INSERT INTO user_recipes (user_id, recipe_id) VALUES (?, ?)";
			jdbcTemplate.update(sqlSaveRecipeToUser, userId, recipeId);
	}


	
	

}
