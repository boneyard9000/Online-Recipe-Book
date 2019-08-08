package com.techelevator.model;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JdbcRecipeDao implements RecipeDao{
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JdbcRecipeDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);

	}
	
	@Override
    public void saveRecipe(Recipe recipe) {
        String sqlCreateRecipe = "INSERT INTO recipes(name, description, cook_time, directions, ingredients, category) VALUES (?, ?, ?, ?, ?, ?) RETURNING recipe_id";
        SqlRowSet result = jdbcTemplate.queryForRowSet(sqlCreateRecipe, recipe.getRecipeName(), recipe.getDescription(), recipe.getCookMins(), recipe.getDirections(), recipe.getIngredients(), recipe.getCategory());

    }

	@Override
	public List<Recipe> getAllRecipes() {
		List<Recipe> recipes = new ArrayList<Recipe>();
		String sqlSelectAllRecipes = "SELECT * FROM recipes";
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
	public Recipe getRecipeById(int recipeId) {
		Recipe r = new Recipe();
		
		String sqlRecipeId = "SELECT recipe_id, name, description, cook_time, directions, ingredients, category FROM recipes WHERE recipe_id = ?";
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
		
		String sqlRecipeName = "SELECT recipe_id, name, description, cook_time, directions, ingredients, category FROM recipes WHERE name ILIKE ?";
		SqlRowSet result = jdbcTemplate.queryForRowSet(sqlRecipeName, "%" + searchName + "%");
		while (result.next()) {
			r = populateRecipe(result);
		}
		System.out.println(r.getRecipeName() + r.getDescription());
		return r;
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
		
		String sqlRecipeTime = "SELECT recipe_id, name, description, cook_time, directions, ingredients, category FROM recipes WHERE cook_time <= ?";
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
		
		String sqlRecipeIngredients = "SELECT recipe_id, name, description, cook_time, directions, ingredients, category FROM recipes WHERE ingredients ILIKE ?";
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
		
		return r;
	}

}
