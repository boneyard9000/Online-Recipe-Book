package com.techelevator.model;

import java.util.ArrayList;
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
	public List<Recipe> getAllRecipes() {
		List<Recipe> recipes = new ArrayList<Recipe>();
		String sqlSelectAllRecipes = "SELECT * FROM recipes\n" + 
				" ORDER BY category LIMIT 5";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllRecipes);
		
		while (results.next()) {
			Recipe recipe = populateRecipe(results);
			recipes.add(recipe);
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
		
		String sqlCategory = "SELECT recipe_id, name, description, cook_time, directions, ingredients, category FROM recipes WHERE UPPER(category) = LIKE UPPER('%?%')";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlCategory, category);
		while (results.next()) {
			Recipe recipe = populateRecipe(results);
			recipes.add(recipe);
		}
		System.out.println(recipes);
		return recipes;
	}

	@Override
	public Recipe getRecipeByName(String searchName) {
		Recipe r = new Recipe();
		
		String sqlRecipeName = "SELECT recipe_id, name, description, cook_time, directions, ingredients, category FROM recipes WHERE UPPER(name) LIKE UPPER('%?%')";
		SqlRowSet result = jdbcTemplate.queryForRowSet(sqlRecipeName, searchName);
		while (result.next()) {
			r = populateRecipe(result);
		}
		System.out.println(r.getRecipeName() + r.getDescription());
		return r;
	}

	@Override
	public List<Recipe> searchRecipesByName(String searchString) {
		List<Recipe> recipes = new ArrayList<Recipe>();
			
			String sqlRecipeName = "SELECT recipe_id, name, description, cook_time, directions, ingredients, category FROM recipes WHERE UPPER(name) LIKE UPPER('%?%')";
			SqlRowSet results = jdbcTemplate.queryForRowSet(sqlRecipeName, searchString);
			while (results.next()) {
				Recipe recipe = populateRecipe(results);
				recipes.add(recipe);
			}
			System.out.println(recipes);
			return recipes;
	}

	@Override
	public List<Recipe> getRecipeByMaxCookTime(int maxCookTime) {
		List<Recipe> recipes = new ArrayList<Recipe>();
		
		String sqlRecipeTime = "SELECT recipe_id, name, description, cook_time, directions, ingredients, category FROM recipes WHERE cook_time <= ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlRecipeTime, maxCookTime);
		while (results.next()) {
			Recipe recipe = populateRecipe(results);
			recipes.add(recipe);
		}
		System.out.println(recipes);
		return recipes;
	}

	@Override
	public List<Recipe> getRecipesByIngredients(String searchWords) {
		List<Recipe> recipes = new ArrayList<Recipe>();
		
		String sqlRecipeIngredients = "SELECT recipe_id, name, description, cook_time, directions, ingredients, category FROM recipes WHERE UPPER(ingredients) LIKE UPPER('%?%')";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlRecipeIngredients, searchWords);
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
		r.setCookMins(results.getInt("cook_time"));
		r.setDescription(results.getString("description"));
		r.setDirections(results.getString("directions"));
		r.setIngredients(results.getString("ingredients"));
		r.setRecipeId(results.getInt("recipe_id"));
		r.setRecipeName(results.getString("name"));
		
		return r;
	}

}
