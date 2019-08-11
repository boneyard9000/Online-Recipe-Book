DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS recipes;
DROP TABLE IF EXISTS user_recipes;


CREATE TABLE users (

user_id serial NOT NULL PRIMARY KEY,
first_name varchar(255) NOT NULL,
last_name varchar(255) NOT NULL,
password varchar(32) NOT NULL,
salt varchar(256) NOT NULL,
email varchar(200) NOT NULL UNIQUE,
phone varchar(15) NOT NULL UNIQUE,
role varchar (10) Default 'registered'

);

CREATE TABLE recipes(
recipe_id serial NOT NULL PRIMARY KEY,
name varchar(69) NOT NULL,
description varchar (255) NOT NULL,
cook_time varchar(15) NOT NULL,
directions TEXT NOT NULL,
ingredients TEXT NOT NULL,
category varchar (40) NOT NULL


);

CREATE TABLE user_recipes(
user_id integer NOT NULL,
recipe_id integer NOT NULL,

PRIMARY KEY(user_id, recipe_id)

);


INSERT INTO recipes (name, description, cook_time, directions, ingredients, category) VALUES 
        ('Chicken Cheesecake', 'sounds weird...is weird', 120,
        'get a chicken.  kill and butcher.  Its easier if you do it quick.  Get a cheesecake.  Put chicken in to cheesecake.  Bake at 350 until golden brown',
        'Chicken (live), Cheesecake, Killing Block', 'dessert');
INSERT INTO recipes (name, description, cook_time, directions, ingredients, category) VALUES 
('Hot Dog Margarita', 'technically edible', 300, 'purchase pack of 8 hot dogs minimum quality.  
        Beat to pulp with mortar and pestal.  Cover with generous quantity of tequila.  Let cure in sun for half day (or so)',
        'Hot Dogs, Bottle of Tequila', 'alcoholic beverage');
INSERT INTO recipes (name, description, cook_time, directions, ingredients, category) VALUES
        ('Literal Dirt', 'Its literally just dirt', 1000000, 'go outside.  Find some dirt.  Its not very hard to see where it goes from here.  Shovel said dirt in large bucket of your choosing.  
        Dump out said dirt.  Repeat process until entire yard has been turned.  Wait 6-8 months for delicious veggies to grow.  Eat that, not the dirt.  Its better',  
        'dirt, bucket, sunlight, large yard', 'miscelleous');
INSERT INTO recipes (name, description, cook_time, directions, ingredients, category) VALUES
        ('Oil Change', 'this is not a recipe, its an oil change.  How did this get in here', 60, 'let car sit at least 15 minutes to cool.  Jack up car and put on jack stands.  Open oil plug and drain in to drain pan.  
        Replace oil filter.  Refill your oil.  Replace drain plug.  Also change drain plug gasket if necessary.  Put car back on to ground.  Fill the oil and check level once settled.  Congratulations, you jsut changed you oil.  
        I bet youre hungry now...', 'motor oil, car, oil filter, oil pan, wrenches, jack stand, car jack', 'automotive');
INSERT INTO recipes (name, description, cook_time, directions, ingredients, category) VALUES
        ('Unboiled Water', 'Tired of burnt water?  We can fix that.', 20, 'Fill large pot with water.  Put on high an let reach a rolling boil.  Remove pot from flame and take it outside.  Throw that nastiness out.  
        Refill pot with fresh, unboiled wter from the tap.  the less boiled the better.  You have now learned how to make unboiled water.  Profit', 'water, large pot, stove', 'beverage');


select * from user_recipes;
SELECT * FROM recipes;
SELECT * FROM users;


select recipes.recipe_id, recipes.name, users.user_id, users.first_name 
from users
join recipes on recipes.recipe_id = users.user_id
where recipes.recipe_id = 1



