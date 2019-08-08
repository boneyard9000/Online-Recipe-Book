package com.techelevator.model;

import org.apache.commons.dbcp2.BasicDataSource;

public class ConsoleTest {

	private static RecipeDao recipeDao;

	public static void main(String[] args) {
		BasicDataSource dataSource = new BasicDataSource();
		dataSource.setUrl("jdbc:postgresql://localhost:5432/recipebookdb");
		dataSource.setUsername("postgres");
		dataSource.setPassword("postgres1");

		recipeDao = new JdbcRecipeDao(dataSource);
		
		System.out.println(recipeDao.getRecipeByName("hot").getRecipeName());
	}

}
