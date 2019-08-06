DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS recipes;
DROP TABLE IF EXISTS user_recipes;


CREATE TABLE users (

user_id serial NOT NULL,
first_name varchar(255) NOT NULL,
last_name varchar(255) NOT NULL,   
password varchar(32) NOT NULL,    
salt varchar(256) NOT NULL,
email varchar(200) NOT NULL UNIQUE,
phone varchar(10) NOT NULL UNIQUE,
role varchar (10) Default 'registered',

CONSTRAINT pk_users_user_id PRIMARY KEY (user_id)
);

CREATE TABLE recipes(
  recipe_id serial NOT NULL,
  name varchar(69) NOT NULL,
  description varchar (255) NOT NULL,
  cook_time integer NOT NULL,
  directions TEXT NOT NULL,
  ingredients TEXT NOT NULL,
  catagory varchar (40) NOT NULL,

  CONSTRAINT pk_recipe_recipe_id PRIMARY KEY (recipe_id)
);

CREATE TABLE user_recipes(
user_id integer NOT NULL,
recipe_id integer NOT NULL,

CONSTRAINT pk_user_recipe_user_id_recipe_id PRIMARY KEY (user_id, recipe_id)
);


INSERT INTO users (first_name, last_name, password, salt, email, phone) VALUES ('Chef', 'Ramsey', 'cooking', 'jdklasjflasdj', 'lol@aol.com', 5133471111);


SELECT * from users;


