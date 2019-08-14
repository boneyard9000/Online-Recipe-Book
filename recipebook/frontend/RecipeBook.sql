DROP TABLE IF EXISTS user_recipes;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS recipes;



CREATE TABLE users (

user_id serial NOT NULL PRIMARY KEY,
first_name varchar(255) NOT NULL,
last_name varchar(255) NOT NULL,
password varchar(32) NOT NULL,
salt varchar(256) NOT NULL,
email varchar(200) NOT NULL UNIQUE,
phone varchar(15) NOT NULL UNIQUE,
role varchar (10) Default 'registered',
grocery_list text Default ''
);

CREATE TABLE recipes(
recipe_id serial NOT NULL PRIMARY KEY,
name varchar(69) NOT NULL,
description varchar (255) NOT NULL,
cook_time varchar(50) NOT NULL,
directions TEXT NOT NULL,
ingredients TEXT NOT NULL,
category varchar (40) NOT NULL,
recipe_pic varchar(300) DEFAULT ''
);

CREATE TABLE user_recipes(
user_id integer NOT NULL,
recipe_id integer NOT NULL,

PRIMARY KEY(user_id, recipe_id)

);
       
INSERT INTO recipes (name, description, cook_time, directions, ingredients, category) VALUES (
        'Quick and Easy Chicken Noodle Soup',  --name
        'No Time for the traditional? This is a good substitute', --description
        30, --cook_time
                -- Start of Directions, by steps
         'Step 1 In a large pot over medium heat, melt butter. Cook onion and celery in butter until just tender, 5 minutes.
          Step 2 Pour in chicken and vegetable broths and stir in chicken, noodles, carrots, basil, oregano, salt and pepper. 
          Step 3 Bring to a boil, then reduce heat and simmer 20 minutes before serving.', 
                --Start of Ingredients
          '1 tablespoon butter
          1/2 cup chopped onion
          1/2 cup chopped celery
          4 (14.5 ounce) cans chicken broth
          1 (14.5 ounce) can vegetable broth
          1/2 pound chopped cooked chicken breast
          1 1/2 cups egg noodles
          1 cup sliced carrots
          1/2 teaspoon dried basil
          1/2 teaspoon dried oregano
          salt and pepper to taste
          ', 'Lunch'); --category

INSERT INTO recipes (name, description, cook_time, directions, ingredients, category) VALUES (
        'Chicken Cheesecake',  --name
        'Sounds weird...is weird.', --description
        120, --cook_time
                -- Start of Directions, by steps
         'Step 1 Get a chicken, kill and butcher it. Its easier if you do it quick.
          Step 2 Get a cheesecake. Put chicken in to cheesecake. 
          Step 3 Bake at 350 until golden brown for 2 hours. 
          Step 4 Let cool 40 minutes before serving.', 
                --Start of Ingredients
          '1 whole live chicken
          1 whole left-over cheesecake
          1 oven
          1 killing block
          ', 'Dessert'); --category

INSERT INTO recipes (name, description, cook_time, directions, ingredients, category) VALUES (
        'Bananalogne platter',  --name
        'All your cheap n quick lazy foods wrapped up in to 1 delicious(?) meal.', --description
        5, --cook_time
                -- Start of Directions, by steps
         'Step 1 Peel bananas and wrap each banana in its own piece of bologne like a warm blanket, a warm lil blanket.
         Step 2 Cover all the sleeping banana piggies in american cheese slices.  
         Step 3 With a soufle torch and melt the cheese ever so gently over the piggie party.
         Step 4 Enjoy with a knife and fork, or just a fork, or really you can handle it with just your fingers, its your life.',

                         --Start of Ingredients
          '5 Minutes
           4 Bananas
           1pack of American cheese
           1lb Bologne, sliced thin'
          , 'Dinner'); --category

INSERT INTO recipes (name, description, cook_time, directions, ingredients, category) VALUES (
        'Birthday Cake',  --name
        'It comes but once a year', --description
        30, --cook_time
                -- Start of Directions, by steps
         'Step 1 Bake a delicious cake.     
          Step 2 Check the calendar.
          Step 3 Wait until it is your birthday.
          Step 4  When it is. Congratulations!!  Your cake has now become a birthday cake.  (As a matter of insurance this site must note that - dependent on your 
        birthday- this cake may not be edible--- We accept no responsibility for eating said cake unless it is delicious)', 
                --Start of Ingredients
          '1 Normal cake
          1 Calendar with birth-date marked
          1 amount of wait time', 
          'Dessert'); --category

INSERT INTO recipes (name, description, cook_time, directions, ingredients, category) VALUES (
        'Breakfast Pizza',  --name
        'The Breakfast of Champions.  Minimal effort.  maximal reward.', --description
        480, --cook_time in minutes
                 -- Start of Directions, by steps
         'Step 1 Order Pizza from your favorite local establishment.  
          Step 2 Eat no more than half of said pizza, you have to be considerate of your morning self. 
          Step 3 Leave the rest of said pizza anywhere except the refrigerator, that defeats the point.
          Step 4 The stovetop, the foot of a couch, or a bedroom dresser are commonly accepted locations.
          Step 5 You will know your pizza is ready because you will wake up and be hungry and it will exist.
          Step 6 You must not allow yourself to consume the pizza before it has properly cured.  Double check the the ZA is room temperature and the cheese has completely resolidified.  Be aware that it cannot truly be considered breakfast pizza 
        if it is reheated or is consumed before 10AM.
        Step 7 This flexible treat can (and should) be combined with whatever condiments you have in your fridge, sriracha is a sure crowd pleaser.',
                          --Start of Ingredients
          '1 Pizza Pie
          1 Nights rest
          misc Pizza Fixins', 
          'Breakfast'); --category

INSERT INTO recipes (name, description, cook_time, directions, ingredients, category) VALUES (
        'Hot Dog Margarita',  --name
        'Technically edible', --description
        300, --cook_time
                -- Start of Directions, by steps
         'Step 1 Purchase pack of 8 hot dogs minimum quality.
          Step 2 Beat to pulp with mortar and pestal.
          Step 3 Cover with generous quantity of tequila.
          Step 4 Let cure in sun for half day (or so)', 
                --Start of Ingredients
          '8 Hot Dogs, uncoocked
          64oz Tequilla
          8 Fine Martini Glasses
          ', 'Beverage'); --category
          
INSERT INTO recipes (name, description, cook_time, directions, ingredients, category) VALUES (
        'Literal Dirt',  --name
        'Its literally just dirt.', --description
        10, --cook_time
                -- Start of Directions, by steps
         'Step 1 Go outside.  Find some dirt.  Its not very hard to see where it goes from here.
          Step 2 Shovel said dirt in large bucket of your choosing. Dump out said dirt.  Repeat process until entire yard has been turned. 
          Step 3 Wait 6-8 months for delicious veggies to grow.
          Step 4 Eat that, not the dirt.  Its better.', 
                --Start of Ingredients
          '1 Bucket
          1 Shovel
          all of the Dirt
          6-8 months of Sunshine
          1 Large Yard
          ', 'Lunch'); --category

INSERT INTO recipes (name, description, cook_time, directions, ingredients, category) VALUES (
        'Unboiled Water',  --name
        'Tired of burnt water?  We can fix that.', --description
        20, --cook_time
                -- Start of Directions, by steps
         'Step 1 Fill large pot with water.  Put on high and let reach a rolling boil.
          Step 2 Remove pot from flame and take it outside.  Throw that nastiness out. 
          Step 3 Refill pot with fresh, unboiled wter from the tap.  the less boiled the better.  You have now learned how to make unboiled water.', 
                --Start of Ingredients
          '1 Large Pot
          1 gallon Water
          1 Irrelevant Stove
          ', 'Beverage'); --category

INSERT INTO recipes (name, description, cook_time, directions, ingredients, category) VALUES (
        'Oil Change',  --name
        'This is not a recipe, its an oil change.  How did this get in here.', --description
        60, --cook_time
                -- Start of Directions, by steps
         'Step 1 Let car sit at least 15 minutes to cool.
          Step 2 Jack up car and put on jack stands. 
          Step 3 Open oil plug and drain in to drain pan.
          Step 4 Replace oil filter. 
          Step 5 Replace drain plug. Also change drain plug gasket if necessary.
          Step 6 Fill the oil and check level once settled.
          Step 7 Put car back on to ground. Congratulations, you just changed you oil!
          Step 8 I bet youre hungry now...', 
                --Start of Ingredients
          '6-8 quarts of oil
          1 oil filter
          1 set of tools
          1 Jack or lift
          ', 'Appetizer'); --category

INSERT INTO recipes (name, description, cook_time, directions, ingredients, category) VALUES (
        'Buffalo Chicken Meatballs',  --name
        'These bites are spicy, tangy and perfectly tender, but infinitely more white-jeans-friendly.', --description
        20, --cook_time
                -- Start of Directions, by steps
         'Step 1 In a small skillet, heat 1 tablespoon of the olive oil over medium heat. Add the celery and onion, and cook until tender, 3 to 4 minutes. Let cool to room temperature.
         Step 2 In a medium bowl, mix the cooled celery mixture with the egg, mustard and ground chicken to combine. Add the bread crumbs, salt and pepper. Mix to combine.
         Step 3 Form the mixture into 1-inch balls. Heat the remaining 3 tablespoons olive oil over medium heat. Add the meatballs and cook until golden brown all over, 2 to 3 minutes per side (8 to 10 minutes total). Shake the pan to roll the meatballs around in the hot oil to ensure they’re fully cooked through.
         Step 4 In a medium pot, melt the butter over medium heat. Add the hot sauce and whisk to combine until smooth. Toss the meatballs in the sauce to coat.
         Step 5 Serve the meatballs warm with a side of blue-cheese dressing (if using). The meatballs can be made up to two days ahead and gently reheated on the stove or in the microwave.', 
                --Start of Ingredients
        '4 tablespoons olive oil, divided
        2 celery stalks, finely minced
        ½ white onion, finely minced
        1 egg, lightly beaten
        1 tablespoon mustard
        1 pound ground chicken
        1 cup bread crumbs
        1 teaspoon salt
        ½ teaspoon freshly ground black pepper
        6 tablespoons butter
        ¾ cup Buffalo-style hot sauce
        1 cup blue-cheese dressing (optional)
          ', 'Appetizer'); --category

INSERT INTO recipes (name, description, cook_time, directions, ingredients, category) VALUES (
        'Coconut Shrimp',  --name
        ' The popular appetizer may be a special treat, but why should you have to go out to enjoy it? Stay in and make this version instead.', --description
        25, --cook_time
                -- Start of Directions, by steps
         'Step 1 In a large pot, heat 3 inches of vegetable oil until it reads 350°F on a thermometer. Line a baking sheet with several layers of paper towels.
          Step 2 Prepare three shallow bowls. In one, whisk the flour with the salt, pepper and chile powder to combine. In another, whisk the eggs. In the last, place the shredded coconut. 
          Step 3 Working one at a time, dip each shrimp first into the flour mixture, then into the egg and then into the coconut. Repeat with all shrimp.
          Step 4 Fry the shrimp until they are golden and cooked through, 4 to 5 minutes. Remove them from the oil and drain on the paper towels.
          Step 5 Serve immediately with lemon wedges and sweet chile sauce.
        ', 
                --Start of Ingredients
          'Vegetable oil, for frying
        1 cup all-purpose flour
        1½ teaspoons salt
        1 teaspoon freshly ground black pepper
        Pinch of chile powder
        2 eggs, lightly whisked
        2½ cups shredded coconut
        2 pounds peeled and deveined shrimp
        1 lemon, cut into wedges
        ¾ cup store-bought sweet chile sauce, for dipping
          ', 'Appetizer'); --category

INSERT INTO recipes (name, description, cook_time, directions, ingredients, category) VALUES (
        'Zucchini Quesadillas',  --name
        'a tortilla filled with cheese and cooked vegetables. Sour cream, shredded lettuce, sliced avocado, and bottled salsa make great accompaniments to quesadillas, so serve them on the side.', --description
        35, --cook_time
                -- Start of Directions, by steps
         'Step 1 Preheat oven to 400 degrees. In a large skillet, heat 3 tablespoons oil over medium heat. Add onion and 1 teaspoon salt. Cook, stirring occasionally, until onion is soft, about 5 minutes. Stir in garlic. Cook 1 minute more.
          Step 2 Add zucchini and frozen corn kernels cook, stirring occasionally, until zucchini is soft and corn is tender, about 6 minutes. Remove from heat. stir in cilantro, if using.
          Step 3 Brush one side of all tortillas with remaining tablespoon oil. Lay 2 tortillas, oiled side down, on a baking sheet. Place half of the filling on each, and sprinkle with half the cheese. Place remaining 2 tortillas on top, oiled side up. Press down gently with a spatula to seal.
          Step 4 Bake until cheese has melted and tortillas are golden brown, turning once, about 10 minutes. Remove from oven. let cool slightly. To serve, slice each quesadilla into wedges.', 
                --Start of Ingredients
          '4 tablespoons olive oil
          1 tsp Salt
          2 medium zucchini (or 1lb), halved lengthwise and thinly sliced crosswise
          1/4 cup chopped fresh cilantro
          2 cups grated pepper jack
          1 onion, coursely chopped
          4 cloves garlic, minced
          1 cup frozen corn kernels (4oz)
          4(8-inch) flour tortillas
          ', 'Appetizer'); --category

INSERT INTO recipes (name, description, cook_time, directions, ingredients, category) VALUES (
        'Blueberry Lavender Vodka Spritzer',  --name
        'The 10-minute happy hour can be as simple or as sophisticated as you like.', --description
        10, --cook_time
                -- Start of Directions, by steps
         'Step 1 Combine the first three ingredients in a saucepan and bring to a boil stirring to dissolve sugar. Reduce heat to a low simmer and add 4 lavender sprigs (or 1 1/2 teaspoons of dried lavender) and keep on low heat for 10 minutes.
         Step 2 Strain pressing the blueberries to get all of their juice.
         Step 3 Divide the cup of blueberries between two ice cube trays and fill with water. Freeze completely, or spread them evenly on a sheet tray and freeze until solid.
         Step 4 In a glass pitcher combine the vodka, simple syrup, lime juice, and club soda. Add ice cubes. Add remaining ice cubes to glasses. Pour the mixture over top and serve with a sprig of lavender.
         ', 
                --Start of Ingredients
        '1 cup blueberries, for ice cubes
        2 cups vodka
        3/4 cup blueberry lavender simple syrup (recipe below)
        4 ounces lime juice
        Soda water
        Fresh lavender for garnish
        For the blueberry lavender simple syrup:
        1 cup water
        1 cup sugar
        1 cup blueberries
        4 lavender sprigs (or 1 1/2 teaspoons dried food-grade lavender buds)
          ', 'Beverage'); --category

INSERT INTO recipes (name, description, cook_time, directions, ingredients, category) VALUES (
        'Non-Alcoholic Sangria',  --name
        'All of the fruit goodness, with none of the spirits. A refreshing sipper.', --description
        30, --cook_time
                -- Start of Directions, by steps
         'Step 1 Pour the boiling water over tea bags and cinnamon sticks and steep for 5 minutes. Discard tea bags and stir in sugar to dissolve.
         Step 2 In a large jar or pitcher, combine tea, cinnamon sticks, pomegranate juice, orange juice, orange, lemon, lime, and apple. Refrigerate for at least 1 hour and preferably overnight.
         Step 3 Just before serving, stir in carbonated water. Serve in glasses over ice.',
            --Start of Ingredients
        '2 cups boiling water
        2 black tea bags (or 2 teaspoons loose-leaf tea in an infuser. Decaf tea is fine)
        2 cinnamon sticks
        1/2 cup sugar
        
        3 cups pomegranate juice
        1 cup freshly squeezed orange juice
        1 medium orange, sliced into thin rounds
        1 medium lemon, sliced into thin rounds
        1 medium lime, sliced into thin rounds
        1 medium apple, cored and cut into 1/2-inch chunks
        3 cups carbonated water
          ', 'Beverage'); --category

INSERT INTO recipes (name, description, cook_time, directions, ingredients, category) VALUES (
        'Hibiscus Ginger Punch',  --name
        'Whether you fizz it up with champagne or mineral water, hibiscus ginger punch will put a colorful sparkle in your celebrations.', --description
        35, --cook_time
                -- Start of Directions, by steps
         'Step 1 Combine water, hibiscus blossoms, and ginger in a pot. Bring to a boil, then lower heat and simmer for 20 minutes. Turn off heat and stir in sugar. Let cool, strain, and chill. (If you like, save some of the plumped-up hibiscus blossoms for garnish.)
         Step 2 To make punch, stir hibiscus juice with ginger ale and champagne or mineral water. Garnish if desired and serve immediately.
', 
                --Start of Ingredients
        '4 1/2 cups water
        1 cup dried hibiscus blossoms
        1 (2-inch) piece of ginger, thinly sliced
        1 cup sugar
        4 cups chilled ginger ale
        2 (750-mL) bottles chilled champagne, sparkling white wine, or sparkling mineral water
Optional: ice, garnishes of mint, lemon or lime slices

          ', 'Beverage'); --category          

INSERT INTO users (first_name, last_name, password, salt, email, phone)
        VALUES ('a', 'a', 'TkcxOZ+G2JaDh2cg0YMuxg==', '+GbyRIz87EbaECurSAvolcYBK3LwzLhwBmk2FyQ+/3xauT/pwa7pIBdFuGXfrDCO2+WrPyeEGTEoGL4B7ujl5XCv8C0DMWrtB9GEGmtdV5CgKSEHSHYkWKqDrV+StLh3CeiQP4qyX7l7KNLQW1uXY4cnjk6Mjh9W5lhUmnA+3/w=',
                'a@a', '1111111111'),
                ('b', 'b', 'Ni28xocRqR+/yshSizUEBA==', 'kgrv1tiu697SYYwHN79eQeeb41YSeFfYjXY7HMqzz3wTc3WL89+dFNJ+ANqJzzyy9FBP+xo+8mAZJUdKZDY3CS767a9EzgNJIU4Z8MgcEP6mJxJVV+4IwrFc1aG+BXbb+gkZIRSSpjS+1KYL3ZCOpA0s5hArrdOXEci2MbDnapE=', 
                'b@b', '2222222222'),
                ('c', 'c', 'cP0qmLqLa9WLAN+VjwIeaA==', '1VQ6uANweIdt9kF83M5wozKTCu/TPm1UX4CgSKlRPqCXNahvNa/AIK84omqOs+f7V9I8emO1rodr/5u5ZsmO0QtIofaIcRtgKuXpvG/BhglK3ezdGKUN1MJtUD7eW3kWtDvmQw5ouXz8fu/z53+8JDTWzLcy20mZ1U4G4xeLrxA=', 
                'c@c', '3333333333'),
                ('Dennis', 'Dover', 'KDGNyZWHXoyN1xsgIcRzkw==', 'jQ2QubYEQMS0n4c5SYocrGXpQg48XeAu331nCbOtvAMykYHZi0+h2iJdnHEm49/CrOK6qAwMXGZv5gtSwB+ycJefPTFVk4EjQbKCFsstERYjQNg85zuFX2616m3Fo5bO+tNEKFqOYBr7Ex6y2+SmuRYsh4YQLReihQ72GEaAz9c=',
                'dennis@gmail.com', '9998675309');


INSERT INTO user_recipes (user_id, recipe_id)
        VALUES (1, 1),
                (1, 2),
                (1, 3), 
                (1, 4),
                (1, 5),
                (1, 6),
                (1, 7),
                (1, 8), 
                (1, 9),
                (1, 10),
                (1, 11),
                (1, 12),
                (1, 13), 
                (1, 14),
                (1, 15),
                (2, 1),
                (2, 3),
                (2, 5);



Select * From users
SELECT * FROM recipes
