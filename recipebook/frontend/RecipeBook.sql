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
       
INSERT INTO recipes (name, description, cook_time, directions, ingredients, category, recipe_pic) VALUES (
        'Quick and Easy Chicken Noodle Soup',  --name
        'No Time for the traditional? This is a good substitute', --description
        30, --cook_time
                -- Start of Directions, by steps
         'Step 1 In a large pot over medium heat, melt butter. Cook onion and celery in butter until just tender, 5 minutes.
          Step 2 Pour in chicken and vegetable broths and stir in chicken, noodles, carrots, basil, oregano, salt and pepper. 
          Step 3 Bring to a boil, then reduce heat and simmer 20 minutes before serving.', 
                --Start of Ingredients
'1 Tbsp(s) butter
0.5 Cup(s) chopped onion
0.5 Cup(s) chopped celery
4 (14.5 Fl oz) cans chicken broth
1 (14.5 Fl oz) can vegetable broth
0.5 Pound(s) chopped cooked chicken breast
1.5 Cup(s) egg noodles
1 Cup(s) sliced carrots
0.5 Tsp(s) dried basil
0.5 Tsp(s) dried oregano', 'Lunch',
          'https://i.ytimg.com/vi/o91gT73mQhg/maxresdefault.jpg'); --category

INSERT INTO recipes (name, description, cook_time, directions, ingredients, category, recipe_pic) VALUES (
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
1 killing block', 'Dessert',
          'http://images.sweetauthoring.com/recipe/540x540/104972_971.jpg'); --category

INSERT INTO recipes (name, description, cook_time, directions, ingredients, category, recipe_pic) VALUES (
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
1 pack of American cheese
1 Pound(s) Bologne, sliced thin', 'Dinner',
          'http://1.bp.blogspot.com/-XpEgqddVmJY/UhqHHhlZJvI/AAAAAAAACMw/iqCJH_R213U/s1600/Eggs+in+Bologna+Cups.jpg'); --category

INSERT INTO recipes (name, description, cook_time, directions, ingredients, category, recipe_pic) VALUES (
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
1 amount of wait time', 'Dessert',
          'https://www.williams-sonoma.com/wsimgs/ab/images/dp/wcm/201922/0465/img14c.jpg'); --category

INSERT INTO recipes (name, description, cook_time, directions, ingredients, category, recipe_pic) VALUES (
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
1 misc Pizza Fixins', 'Breakfast',
          'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2014/2/7/1/FNM_030114-Breakfast-Pizza-Recipe_s4x3.jpg.rend.hgtvcom.616.462.suffix/1391877822055.jpeg'); --category

INSERT INTO recipes (name, description, cook_time, directions, ingredients, category, recipe_pic) VALUES (
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
64 oz Tequilla
8 Fine Martini Glasses', 'Beverage',
          'https://timeincsecure-a.akamaihd.net/rtmp_uds/429048911/201703/1018/429048911_5376504367001_5376172885001-vs.jpg?pubId=429048911&videoId=5376172885001'); --category
          
INSERT INTO recipes (name, description, cook_time, directions, ingredients, category, recipe_pic) VALUES (
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
6 months of Sunshine
1 Large Yard', 'Lunch',
          'https://www.tasteofhome.com/wp-content/uploads/2017/10/exps3954_FF1227370D14B-1.jpg'); --category

INSERT INTO recipes (name, description, cook_time, directions, ingredients, category, recipe_pic) VALUES (
        'Unboiled Water',  --name
        'Tired of burnt water?  We can fix that.', --description
        20, --cook_time
                -- Start of Directions, by steps
         'Step 1 Fill large pot with water.  Put on high and let reach a rolling boil.
          Step 2 Remove pot from flame and take it outside.  Throw that nastiness out. 
          Step 3 Refill pot with fresh, unboiled water from the tap.  the less boiled the better.  You have now learned how to make unboiled water.', 
                --Start of Ingredients
'1 Large Pot
1 gallon Water
1 Irrelevant Stove', 'Beverage',
          'https://d1alt1wkdk73qo.cloudfront.net/images/guide/398660cdb95a48f58ebe147bce9ca901/640x960.jpg'); --category

INSERT INTO recipes (name, description, cook_time, directions, ingredients, category, recipe_pic) VALUES (
        'Oil Change',  --name
        'This is not a recipe, its an oil change.  How did this get in here?!', --description
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
'6 quarts of oil
1 oil filter
1 set of tools
1 Jack or lift', 'Appetizer',
          'https://www.kahlua.com/globalassets/images/cocktails/2018/opt/kahluadrinks_wide_coffee1.png'); --category

INSERT INTO recipes (name, description, cook_time, directions, ingredients, category, recipe_pic) VALUES (
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
'4 Tbsp(s) olive oil divided
2 celery stalks finely minced
0.5 white onion finely minced
1 egg, lightly beaten
1 Tbsp(s) mustard
1 Pound(s) ground chicken
1 Cup(s) bread crumbs
1 Tsp(s) salt
0.5 Tsp(s) freshly ground black pepper
6 Tbsp(s) butter
0.75 Cup(s) Buffalo-style hot sauce', 'Appetizer',
          'https://whatgreatgrandmaate.com/wp-content/uploads/2016/11/IMG_9842-e1478050633263.jpg'); --category

INSERT INTO recipes (name, description, cook_time, directions, ingredients, category, recipe_pic) VALUES (
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
1 Cup(s) all-purpose flour
1.5 Tsp(s) salt
1 Tsp(s) freshly ground black pepper
2 eggs lightly whisked
2.5 Cup(s) shredded coconut
2 Pound(s) peeled and deveined shrimp
1 lemon cut into wedges
0.75 Cup(s) store-bought sweet chile sauce', 'Appetizer',
          'https://www.culinaryhill.com/wp-content/uploads/2017/09/Coconut-Shrimp-Culinary-Hill-6.jpg'); --category

INSERT INTO recipes (name, description, cook_time, directions, ingredients, category, recipe_pic) VALUES (
        'Zucchini Quesadillas',  --name
        'a tortilla filled with cheese and cooked vegetables. Sour cream, shredded lettuce, sliced avocado, and bottled salsa make great accompaniments to quesadillas, so serve them on the side.', --description
        35, --cook_time
                -- Start of Directions, by steps
         'Step 1 Preheat oven to 400 degrees. In a large skillet, heat 3 tablespoons oil over medium heat. Add onion and 1 teaspoon salt. Cook, stirring occasionally, until onion is soft, about 5 minutes. Stir in garlic. Cook 1 minute more.
          Step 2 Add zucchini and frozen corn kernels cook, stirring occasionally, until zucchini is soft and corn is tender, about 6 minutes. Remove from heat. stir in cilantro, if using.
          Step 3 Brush one side of all tortillas with remaining tablespoon oil. Lay 2 tortillas, oiled side down, on a baking sheet. Place half of the filling on each, and sprinkle with half the cheese. Place remaining 2 tortillas on top, oiled side up. Press down gently with a spatula to seal.
          Step 4 Bake until cheese has melted and tortillas are golden brown, turning once, about 10 minutes. Remove from oven. let cool slightly. To serve, slice each quesadilla into wedges.', 
                --Start of Ingredients
'4 Tbsp(s) olive oil
1 Tsp(s) Salt
2 medium zucchini
0.25 Cup(s) chopped fresh cilantro
2 Cup(s) grated pepper jack
1 onion
4 cloves garlic, minced
1 Cup(s) frozen corn kernels (4oz)
4 (8-inch) flour tortillas', 'Appetizer',
          'http://www.ezrapoundcake.com/wp-content/uploads/2009/06/zucchini-quesadillas-1.jpg'); --category

INSERT INTO recipes (name, description, cook_time, directions, ingredients, category, recipe_pic) VALUES (
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
'1 Cup(s) blueberries
2 Cup(s) vodka
4 Fl oz lime juice
1 Cup(s) water
1 Cup(s) sugar
1 Cup(s) blueberries
4 lavender sprigs', 'Beverage',
          'https://s23209.pcdn.co/wp-content/uploads/2014/05/IMG_8952edit.jpg'); --category

INSERT INTO recipes (name, description, cook_time, directions, ingredients, category, recipe_pic) VALUES (
        'Non-Alcoholic Sangria',  --name
        'All of the fruit goodness, with none of the spirits. A refreshing sipper.', --description
        30, --cook_time
                -- Start of Directions, by steps
         'Step 1 Pour the boiling water over tea bags and cinnamon sticks and steep for 5 minutes. Discard tea bags and stir in sugar to dissolve.
         Step 2 In a large jar or pitcher, combine tea, cinnamon sticks, pomegranate juice, orange juice, orange, lemon, lime, and apple. Refrigerate for at least 1 hour and preferably overnight.
         Step 3 Just before serving, stir in carbonated water. Serve in glasses over ice.',
            --Start of Ingredients
'2 Cup(s) boiling water
2 black tea bags
2 cinnamon sticks
.5 Cup(s) sugar
3 Cup(s) pomegranate juice
1 Cup(s) freshly squeezed orange juice
1 medium orange
1 medium lemon
1 medium lime
1 medium apple
3 Cup(s) carbonated water', 'Beverage',
          'https://www.recipegirl.com/wp-content/uploads/2008/11/Winter-Holiday-Sangria-2.jpg'); --category

INSERT INTO recipes (name, description, cook_time, directions, ingredients, category, recipe_pic) VALUES (
        'Hibiscus Ginger Punch',  --name
        'Whether you fizz it up with champagne or mineral water, hibiscus ginger punch will put a colorful sparkle in your celebrations.', --description
        35, --cook_time
                -- Start of Directions, by steps
         'Step 1 Combine water, hibiscus blossoms, and ginger in a pot. Bring to a boil, then lower heat and simmer for 20 minutes. Turn off heat and stir in sugar. Let cool, strain, and chill. (If you like, save some of the plumped-up hibiscus blossoms for garnish.)
         Step 2 To make punch, stir hibiscus juice with ginger ale and champagne or mineral water. Garnish if desired and serve immediately.
', 
                --Start of Ingredients
'4 Cup(s) water
1 Cup(s) dried hibiscus blossoms
1 piece of ginger
1 Cup(s) sugar
4 Cup(s) chilled ginger ale
2 bottles chilled champagne', 'Beverage',
          'https://media2.s-nbcnews.com/j/newscms/2017_18/1212485/paloma-mezcal-cocktail-today-170505-tease_09c0f329288292d501e73ab546a2ddc9.today-inline-large.jpg'); --category   
          
INSERT INTO recipes (name, description, cook_time, directions, ingredients, category, recipe_pic) VALUES (
        'Creamy Ham and Cheese Quiche',  --name
        'This quiche is creamy, simple, and delicious!', --description
        50, --cook_time
                -- Start of Directions, by steps
         'Step 1 Preheat oven to 400 degrees F (200 degrees C).
          Step 2 Press pie pasty into the bottom of a 9-inch pie plate.
          Step 3 Bake pie crust in preheated oven for 5 minutes, use a fork to poke holes into the crust, and continue cooking until lightly browned, about 5 minutes more.
          Step 4 Reduce oven heat to 350 degrees F (175 degrees C).
          Step 5 Mix 1/2 cup Cheddar cheese, Swiss cheese, and 1 tablespoon flour in a bowl, spread over the warm pie crust.
          Step 6 Stir ham and honey mustard together in a bowl to coat the ham completely, spoon over the cheese mixture.
          Step 7 Mix half-and-half, eggs, green onions, 1 tablespoon flour, and salt together in bowl. Pour mixture carefully over the ham layer, top with remaining Cheddar cheese.
          Step 8 Bake in preheated oven until set in the center, 40 to 50 minutes. Cool for 10 minutes before cutting.', 
                --Start of Ingredients
'1 (9 inch) pastry for a 9-inch pie crust
1 Cup(s) shredded Cheddar cheese
.5 Cup(s) shredded Swiss cheese
2 Tbsp(s) all-purpose flour
.5 Cup(s) diced cooked ham
2 Tbsp(s) honey mustard
1.25 Cup(s) half-and-half
5 eggs, beaten
.25 Cup(s) green onions
.25 Tsp(s) salt', 'Breakfast',
          'https://www.thereciperebel.com/wp-content/uploads/2018/07/easy-ham-quiche-www.thereciperebel.com-600-12-of-16.jpg'); --category     

INSERT INTO recipes (name, description, cook_time, directions, ingredients, category, recipe_pic) VALUES (
        'Fluffy Pancakes',  --name
        'Tall and fluffy. These pancakes are just right. Topped with strawberries and whipped cream, they are impossible to resist.', --description
        25, --cook_time
                -- Start of Directions, by steps
         'Step 1 Combine milk with vinegar in a medium bowl and set aside for 5 minutes to "sour".
          Step 2 Combine flour, sugar, baking powder, baking soda, and salt in a large mixing bowl. Whisk egg and butter into "soured" milk. Pour the flour mixture into the wet ingredients and whisk until lumps are gone.
          Step 3 Heat a large skillet over medium heat, and coat with cooking spray. Pour 1/4 cupfuls of batter onto the skillet, and cook until bubbles appear on the surface. Flip with a spatula, and cook until browned on the other side.', 
                --Start of Ingredients
'0.5 Tsp(s) baking soda
1 Cup(s) all-purpose flour          
1 Tsp(s) baking powder
2 Tbsp(s) white sugar
0.5 Fl oz cooking spray
2 Tbsp(s) distilled white vinegar
2 Tbsp(s) butter
0.75 Cup(s) milk
1 eggs
0.5 Tsp(s) salt', 'Breakfast',
          'https://d1doqjmisr497k.cloudfront.net/-/media/mccormick-us/recipes/mccormick/h/800/homemade_fluffy_pancakes_800x800.jpg'); --category       

INSERT INTO recipes (name, description, cook_time, directions, ingredients, category, recipe_pic) VALUES (
        'Breakfast Apples',  --name
        'This is a fun and yummy breakfast that is great for a snack or dessert as well!', --description
        16, --cook_time
                -- Start of Directions, by steps
         'Step 1 Place the apple, rice cereal, cinnamon, and coconut oil into a microwave-safe bowl.
          Step 2 Cook in a microwave oven until the coconut oil has melted, 30 to 45 seconds. Stir to combine.
          Step 3 Serve topped with berries and walnuts, if desired.', 
                --Start of Ingredients
'1 apple, cored and chopped
2 Tsp(s) coconut oil         
0.5 Cup(s) sliced fresh strawberries (optional)
0.5 Cup(s) crispy rice cereal squares (such as Rice Chex®)
2 Tsp(s) ground cinnamon
0.25 Cup(s) chopped walnuts (optional)', 'Breakfast',
          'https://images.media-allrecipes.com/userphotos/560x315/2438212.jpg'); --category                

INSERT INTO recipes (name, description, cook_time, directions, ingredients, category, recipe_pic) VALUES (
        'Ultimate Grilled Cheese',  --name
        'Its time to up your grilled cheese game!', --description
        15, --cook_time
                -- Start of Directions, by steps
         'Step 1 Lightly butter 1 side of each bread slice. Place 2 bread slices, buttered side down, on work surface. Top each with 2 prosciutto slices, then 4 basil leaves, then 4 cheese slices. Sprinkle with salt and crushed red pepper. Top with remaining 2 bread slices, buttered side up.
          Step 2 Heat olive oil in heavy large ovenproof skillet over medium-high heat. Add sandwiches to skillet and cook until golden on bottom, about 4 minutes. Turn sandwiches over.
          Step 3 Transfer skillet to oven and bake until golden and cheese melts, about 5 minutes. Remove from oven.
          Step 4 Carefully lift off top bread slices from sandwiches and insert 3 tomato slices into each, then cover with bread tops and serve.
        ', 
                --Start of Ingredients
'0.25 Cup(s) Butter
4 slices country white sourdough bread
4 thin slices prosciutto
8 large fresh basil leaves
0.25 Tsp(s) dried crushed red pepper
2 Tbsp(s) olive oil
1 large heirloom tomato', 'Lunch',
          'https://www.thechunkychef.com/wp-content/uploads/2016/08/Ultimate-Grilled-Cheese-6.jpg'); --category

INSERT INTO recipes (name, description, cook_time, directions, ingredients, category, recipe_pic) VALUES (
        'Grilled Chicken Wrap',  --name
        'Southwestern-inspired chicken spiced with chili powder goes perfectly with a combination of beans, corn and bell peppers.', --description
        15, --cook_time
                -- Start of Directions, by steps
         'Step 1 Combine beans, corn, bell pepper, lime juice, cilantro and hot pepper sauce, if desired, in small bowl, set aside.
          Step 2 Coat chicken with chili powder. Cook on oiled preheated grill 6 minutes per side or until no longer pink. Cut chicken into thin slices.
          Step 3 Wrap tortillas in plastic wrap. Microwave on HIGH 1 minute. For each sandwich, place three cheese slice halves down center of one tortilla. Top with chicken breast slices and bean mixture. Roll and secure with wooden pick in two places. Cut in half.
        ', 
                --Start of Ingredients
'1 can (15 oz.) black beans
1 can (8 oz.) whole kernel corn
.5 Cup(s) chopped red bell pepper or plum tomato
3 Tbsp(s) fresh lime juice
2 Tbsp(s) chopped fresh cilantro
.25 Tbsp(s) red pepper sauce (optional)
4 boneless
2 Tbsp(s) chili powder
4 (10-inch) flour tortillas
6 slices Sargento® Sliced Colby Cheese', 'Lunch',
          'https://www.sweetbabyrays.com/getattachment/8a65615e-2d6d-49e2-843b-e93fa446e09a/Buffalo-Grilled-Chicken-Wraps'); --category

INSERT INTO recipes (name, description, cook_time, directions, ingredients, category, recipe_pic) VALUES (
        'the Big Salad',  --name
        'Youve worked in offices before, George! You understand "LUNCH"!', --description
        10, --cook_time
                -- Start of Directions, by steps
         'Step 1 Place greens in bottom of serving bowl. Add grains in an even layer over greens. Repeat with the roasted vegetables, then the raw vegetables.
          Step 2 Top with dressing, and toss gently. Fan out avocado on top on one side of bowl.
          Step 3 Place hard-boiled egg pieces on the side opposite the avocado. Top with chives and nuts. Serve with whole-grain bread.
        ', 
                --Start of Ingredients
'2 Cup(s) sturdy salad greens
0.5 Cup(s) cooked grains
1 Cup(s) roasted vegetables
0.25 Cup(s) thinly sliced raw vegetables
0.75 Cup(s) salad dressing
0.5 avocado, thinly sliced
1 hard-boiled egg
2 Tsp(s) snipped chives, plus more to taste
2 Tsp(s) sliced or chopped nuts
Whole-grain bread', 'Lunch',
          'https://i.pinimg.com/originals/08/c4/6b/08c46b543c38550b9b380e518d9d2dfe.jpg'); --category

INSERT INTO recipes (name, description, cook_time, directions, ingredients, category, recipe_pic) VALUES (
        'Philly Steak Sandwiches',  --name
        'Steak, grilled onions and melted cheese as the good Lord intended!', --description
        22, --cook_time
                -- Start of Directions, by steps
         'Step 1 Heat a medium saucepan over medium high heat. Add 1 tablespoon extra-virgin olive oil, 1 turn of the pan. Add onions and season with salt and pepper or steak seasoning blend. Cook onions, stirring occasionally, 10 minutes or until onions are soft and caramel in color.
          Step 2 Heat a heavy griddle pan over medium high to high heat. Wipe griddle with a drizzle of oil using a paper towel. Sear and cook thin sliced steaks until brown but not crisp, about 2 minutes on each side. Cook steaks in single layers in 2 batches and tenderize by cutting into meat with the side of your spatula while they cook. When the steaks are browned, just before you remove them from heat, sprinkle them with garlic salt and pepper. When all of the steaks are cooked, line each of your split rolls with 2 slices of provolone cheese. Pile .25 of your meat and onions on to the griddle and mix together with your spatula. Pile the meat and onions into rolls on top of the cheese. The heat from the meat and onions will melt the cheese. Repeat for remaining servings and serve.
        ', 
                --Start of Ingredients
'1 Tbsp(s) extra-virgin olive oil
2 large yellow skinned onions
2 Tsp(s) extra-virgin olive oil
1.5 Pound(s) lean beef tenderloin or sirloin
1 Tsp(s) garlic salt
8 slices provolone cheese
4 soft Italian sandwich hogie rolls', 'Lunch',
          'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2003/10/16/0/tm1b67_philly_steak_sandwich.jpg.rend.hgtvcom.826.620.suffix/1547587334190.jpeg'); --category

INSERT INTO recipes (name, description, cook_time, directions, ingredients, category, recipe_pic) VALUES (
        'Chicken Pot Pie',  --name
        'Chock-full of poultry, potatoes, peas and corn, this recipe for easy chicken pot pie makes two golden pies, so you can serve one at supper and save the other for a busy night.', --description
        75, --cook_time
                -- Start of Directions, by steps
         'Step 1 Preheat oven to 425°. Place potatoes and carrots in a large saucepan, add water to cover. Bring to a boil. Reduce heat, cook, covered, 8-10 minutes or until crisp-tender, drain.
         Step 2 In a large skillet, heat butter over medium-high heat. Add onion, cook and stir until tender. Stir in flour and seasonings until blended. Gradually stir in broth and milk. Bring to a boil, stirring constantly, cook and stir 2 minutes or until thickened. Stir in chicken, peas, corn and potato mixture, remove from heat.
         Step 3 Unroll a pie crust into each of two 9-in. pie plates, trim even with rims. Add chicken mixture. Unroll remaining crusts, place over filling. Trim, seal and flute edges. Cut slits in tops.
         Step 4 Bake 35-40 minutes or until crust is lightly browned. Let stand 15 minutes before cutting. Freeze option: Cover and freeze unbaked pies. To use, remove from freezer 30 minutes before baking (do not thaw). Preheat oven to 425°. Place pies on baking sheets, cover edges loosely with foil. Bake 30 minutes. Reduce oven setting to 350°, bake 70-80 minutes longer or until crust is golden brown and a thermometer inserted in center reads 165°.
         ', 
                --Start of Ingredients
'2 Cup(s) diced peeled potatoes
1.75 Cup(s) sliced carrots
1 Cup(s) butter
.50 Cup(s) chopped onion
1 Cup(s) all-purpose flour
1.75 Tsp(s) salt
1 Tsp(s) dried thyme
.75 Tsp(s) pepper
3 Cup(s) chicken broth
1.5 Cup(s) whole milk
4 Cup(s) cubed cooked chicken
1 Cup(s) frozen peas
1 Cup(s) frozen corn
4 sheets refrigerated pie crust', 'Dinner',
          'https://images-gmi-pmc.edge-generalmills.com/0f8b0cba-584d-461f-9f06-32b085bd8f43.jpg'); --category

INSERT INTO recipes (name, description, cook_time, directions, ingredients, category, recipe_pic) VALUES (
        'Classic Beef Stew',  --name
        'A good old-fashioned easy beef stew recipe with rich beef gravy that lets the flavor of the potatoes and carrots come through.', --description
        60, --cook_time
                -- Start of Directions, by steps
         'Step 1 In an oven-safe Dutch oven, brown beef in batches in oil, drain. Return all meat to the pan. Add onions, tomatoes, broth, tapioca, garlic, parsley, salt, pepper and bay leaf. Bring to a boil.
         Step 2 Cover stew and bake at 350° for 1 hour. Stir in carrots, potatoes and celery. Bake, covered, 1 hour longer or until meat and vegetables are tender. Discard bay leaf.
         ', 
                --Start of Ingredients
'2 Pound(s) beef stew meat
1 to 2 Tbsp(s) canola oil
1.5 Cup(s) chopped onions
1 can (14-1/2 Fl oz) diced tomatoes
1 can (10-1/2 Fl oz) condensed beef broth
3 Tbsp(s) quick-cooking tapioca
1 garlic clove, minced
1 Tbsp(s) dried parsley flakes
1 Tsp(s) salt
.25 Tsp(s) pepper
1 bay leaf
6 medium carrots
3 medium potatoes
1 Cup(s) sliced celery (1-inch lengths)', 'Beverage',
          'https://lifemadesweeter.com/wp-content/uploads/Instant-Pot-Beef-Stew-Recipe-Photo-Recipe-1-of-1-12-e1507849409918.jpg'); --category

INSERT INTO recipes (name, description, cook_time, directions, ingredients, category, recipe_pic) VALUES (
        'Skillet Mac & Cheese',  --name
        'This super creamy mac and cheese is so simple it seems almost too easy!', --description
        25, --cook_time
                -- Start of Directions, by steps
         'Step 1 Cook macaroni according to package directions, drain.
         Step 2 Meanwhile, in a large cast-iron or other heavy skillet, melt butter over medium heat. Stir in flour until smooth, gradually whisk in cream. Bring to a boil, stirring constantly. Cook and stir until thickened, about 2 minutes. Reduce heat, stir in cheese until melted.
         Step 3 Add macaroni, cook and stir until heated through. Top as desired.
         ', 
                --Start of Ingredients
'2 Cup(s) uncooked elbow macaroni (about 8 Fl oz)
2 Tbsp(s) butter
2 Tbsp(s) all-purpose flour
1.5 Cup(s) half-and-half cream
3/4 Pound(s) process cheese', 'Appetizer',
          'https://img1.southernliving.timeinc.net/sites/default/files/styles/4_3_horizontal_-_1200x900/public/image/2016/12/main/january-2017-recipes-2504001_winte_27011.jpg?itok=lsq6IUHW'); --category

INSERT INTO recipes (name, description, cook_time, directions, ingredients, category, recipe_pic) VALUES (
        'Garlic Beef Enchiladas',  --name
        'Beef enchiladas prepared in flour tortillas in this saucy casserole that has irresistible home-cooked flavor and a subtle kick.', --description
        70, --cook_time
                -- Start of Directions, by steps
         'Step 1 Preheat oven to 350°. In a large skillet, cook beef and onion over medium heat, crumbling meat, until beef is no longer pink, 6-8 minutes, drain. Stir in flour and seasonings. Add tomatoes, bring to a boil. Reduce heat, simmer, covered, 15 minutes.
         Step 2 In a saucepan, heat butter over medium-high heat. Add garlic, cook and stir 1 minute or until tender. Stir in flour until blended, gradually whisk in broth. Bring to a boil, cook and stir until thickened, about 2 minutes. Stir in tomato sauce and seasonings, heat through.
         Step 3 Pour 1-1/2 cups sauce into an ungreased 13x9-in. baking dish. Place about 1/4 Cup(s) beef mixture off center on each tortilla, top with 1-2 tablespoons cheese. Roll up and place over sauce, seam side down. Top with remaining sauce.
         Step 4 Bake, covered, until heated through, 30-35 minutes. Sprinkle with remaining cheese. Bake, uncovered, until cheese is melted, 10-15 minutes longer. Serve with toppings as desired.
         ', 
                --Start of Ingredients
'1 Pound(s) ground beef
1 medium onion
1 Tsp(s) salt
1 Tsp(s) garlic powder
.5 Tsp(s) ground cumin
.25 Tsp(s) rubbed sage
1 can (14-1/2 Fl oz) stewed tomatoes
.33 Cup(s) butter
4 to 6 garlic cloves
.5 Cup(s) all-purpose flour
1 can (14-1/2 Fl oz) beef broth
1 can (15 Fl oz) tomato sauce
3 Tbsp(s) chili powder
1 to 2 Tsp(s) ground cumin
1 to 2 Tsp(s) rubbed sage
.5 Tsp(s) salt
10 flour tortillas (6 inches)
2 Cup(s) shredded Colby-Monterey Jack cheese, divided', 'Dinner',
          'https://s23209.pcdn.co/wp-content/uploads/2014/01/IMG_8465edit.jpg'); --category

INSERT INTO recipes (name, description, cook_time, directions, ingredients, category, recipe_pic) VALUES (
        'Pork Chops with Scalloped Potatoes',  --name
        'This all-in-one comforting pork chops recipe reminds me of home.', --description
        120, --cook_time
                -- Start of Directions, by steps
         'Step 1 In a small saucepan, melt butter, stir in the flour, salt and pepper until smooth. Add broth. Bring to a boil, cook and stir for 1 minute or until thickened. Remove from the heat and set aside.
         Step 2 In a large skillet, brown the pork chops on both sides in oil, sprinkle with additional salt and pepper if desired.
         Step 3 In a greased 13-in. x 9-in. baking dish, layer potatoes and onion. Pour broth mixture over layers. Place pork chops on top.
         Step 4 Cover and bake at 350° for 1 hour, uncover and bake 30 minutes longer or until meat and potatoes are tender. If desired, sprinkle with paprika and parsley.
         ', 
                --Start of Ingredients
'3 Tbsp(s) butter
3 Tbsp(s) all-purpose flour
1.5 Tsp(s) salt
.25 Tsp(s) pepper
6 pork rib or loin chops (3/4 inch thick)
6 Cup(s) thinly sliced peeled potatoes
1 medium onion
Paprika and minced fresh parsley', 'Dinner',
          'https://whisktc.com/wp-content/uploads/2017/10/dpcsp.jpg'); --category

INSERT INTO recipes (name, description, cook_time, directions, ingredients, category, recipe_pic) VALUES (
        'Lime Chicken Tacos',  --name
        'Our fun, simple chicken taco recipe is perfect for a relaxing dinner with friends.', --description
        300, --cook_time
                -- Start of Directions, by steps
         'Step 1 Place chicken in a 3-qt. slow cooker. Combine lime juice and chili powder, pour over chicken. Cook, covered, on low until chicken is tender, 5-6 hours.
         Step 2 Remove chicken. When cool enough to handle, shred meat with two forks, return to slow cooker. Stir in corn and salsa. Cook, covered, on low until heated through, about 30 minutes. Place filling on tortillas, if desired, serve with sour cream, pickled onions, lettuce and cheese.
         ', 
                --Start of Ingredients
'1.5 Pound(s) boneless skinless chicken breast halves
3 Tbsp(s) lime juice
1 Tbsp(s) chili powder
1 Cup(s) frozen corn, thawed
1 Cup(s) chunky salsa
12 fat-free flour tortillas
Sour cream, pickled onions', 'Dinner',
          'https://lifemadesimplebakes.com/wp-content/uploads/2016/05/Chili-Lime-Chicken-Tacos-3.jpg'); --category

INSERT INTO recipes (name, description, cook_time, directions, ingredients, category, recipe_pic) VALUES (
        'Monkey bread',  --name
        'A soft, sweet, sticky pastry served in the United States for breakfast or as a treat. It is often served at fairs and festivals', --description
        15, --cook_time
                -- Start of Directions, by steps
         'Step 1 Heat oven to 350°F. Generously grease 12-cup fluted tube pan with shortening or cooking spray. In large 1-gallon plastic food storage bag, mix granulated sugar and cinnamon.
          Step 2 Separate dough into 16 biscuits, cut each into quarters. Shake in bag to coat. Arrange in pan, adding walnuts and raisins among the biscuit pieces. Sprinkle any remaining sugar over biscuits.
          Step 3 In small bowl, mix brown sugar and butter, pour over biscuit pieces.
          Step 4 Bake 30 to 40 minutes or until golden brown and no longer doughy in center. Loosen edges of pan with metal spatula. Cool in pan 5 minutes. Turn upside down onto serving plate, replacing any biscuit pieces and caramel from pan. Pull apart to serve. Serve warm.
        ', 
                --Start of Ingredients
'.5 Cup(s) granulated sugar
1 Tsp(s) cinnamon
2 cans (16.3 oz each) Pillsbury™ Grands!™
.5 Cup(s) chopped walnuts, if desired
.5 Cup(s) raisins, if desired
1 Cup(s) firmly packed brown sugar
.75 Cup(s) butter or margarine', 'Breakfast',
          'https://images-gmi-pmc.edge-generalmills.com/3c78f8b9-85d9-4584-bd96-7623a109674a.jpg'); --category
          
INSERT INTO recipes (name, description, cook_time, directions, ingredients, category, recipe_pic) VALUES (
        'Fluffy Pancakes',  --name
        'Tall and fluffy. These pancakes are just right. Topped with strawberries and whipped cream, they are impossible to resist.', --description
        25, --cook_time
                -- Start of Directions, by steps
         'Step 1 Combine milk with vinegar in a medium bowl and set aside for 5 minutes to "sour".
          Step 2 Combine flour, sugar, baking powder, baking soda, and salt in a large mixing bowl. Whisk egg and butter into "soured" milk. Pour the flour mixture into the wet ingredients and whisk until lumps are gone.
          Step 3 Heat a large skillet over medium heat, and coat with cooking spray. Pour 1/4 cupfuls of batter onto the skillet, and cook until bubbles appear on the surface. Flip with a spatula, and cook until browned on the other side.', 
                --Start of Ingredients
'.5 Tsp(s) baking soda
1 Cup(s) all-purpose flour          
1 Tsp(s) baking powder
2 Tbsp(s) white sugar
.5 Fl oz cooking spray
2 Tbsp(s) distilled white vinegar
2 Tbsp(s) butter
3/4 Cup(s) milk
1 eggs
.5 Tsp(s) salt', 'Breakfast',
          'http://www.runningwithspoons.com/wp-content/uploads/2016/04/Cinnamon-Roll-Greek-Yogurt-Pancakes.jpg'); --category


INSERT INTO recipes (name, description, cook_time, directions, ingredients, category, recipe_pic) VALUES (
        'Luscious Slush Punch',  --name
        'Without a doubt the best punch you have ever had.', --description
        20, --cook_time
                -- Start of Directions, by steps
         'Step 1 Bring the sugar, water, and strawberry flavored gelatin to a boil in a large saucepan, boil for 3 minutes. Stir in the pineapple juice, lemon juice, and orange juice. Divide mixture into 2 separate containers and freeze.
          Step 2 Combine the contents of 1 container with 1 bottle of the lemon-lime flavored carbonated beverage in a punch bowl, stir until slushy. Repeat with remaining portions as needed.
         ', 
                --Start of Ingredients
'2.5 Cup(s) white sugar
6 Cup(s) water
2 (3 Fl oz) packages strawberry flavored Jell-O® mix
1 (46 fluid Fl oz) can pineapple juice
.67 Cup(s) lemon juice
1 quart orange juice
2 (2 liter) bottles lemon-lime flavored carbonated beverage', 'Beverage',
        'https://cdn.cpnscdn.com/static.coupons.com/ext/kitchme/images/recipes/300x200/strawberry-sangria_18501.jpg'); --category


INSERT INTO recipes (name, description, cook_time, directions, ingredients, category, recipe_pic) VALUES (
        'Apple Pie Moonshine',  --name
        'Just a spoonful of sugar helps the medicine go down', --description
        25, --cook_time
                -- Start of Directions, by steps
         'Step 1 Bring the apple cider, apple juice, cinnamon sticks, whole clove, white sugar, and brown sugar to a boil in a large pot, reduce heat to medium low and simmer for 20 minutes. Remove from heat and cool completely.
          Step 2 Stir the grain alcohol and vanilla vodka into the cooled mixture. Pour into bottles and refrigerate.', 
                --Start of Ingredients
'.5 gallon apple cider
.5 gallon apple juice
4 cinnamon sticks
1 whole clove
1 Cup(s) white sugar
1 Cup(s) brown sugar
3 Cup(s) 190 proof grain alcohol
2 Cup(s) vanilla vodka', 'Beverage',
          'https://images-gmi-pmc.edge-generalmills.com/94e767da-3f8a-427c-bc15-036b04545a43.jpg'); --category


INSERT INTO recipes (name, description, cook_time, directions, ingredients, category, recipe_pic) VALUES (
        'Sangria',  --name
        'Wine soaked fruit, follow their lead.', --description
        30, --cook_time
                -- Start of Directions, by steps
         'Step 1 In a large pitcher or bowl, mix together the brandy, lemon juice, lemonade concentrate, orange juice, red wine, triple sec, and sugar. Float slices of lemon, orange and lime, and maraschino cherries in the mixture. Refrigerate overnight for best flavor. For a fizzy sangria, add club soda just before serving.
        ', 
                --Start of Ingredients
'.5 Cup(s) brandy
.25 Cup(s) lemon juice
.33 Cup(s) frozen lemonade concentrate
.34 Cup(s) orange juice
1 (750 Milliliter) bottle dry red wine
.5 Cup(s) triple sec
1 lemon
1 orange
1 lime
.25 Cup(s) white sugar (optional)
8 maraschino cherries
2 Cup(s) ginger ale', 'Beverage',
          'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2011/4/25/0/CCWM_Traditional-Sangria_s4x3.jpg.rend.hgtvcom.826.620.suffix/1483737021903.jpeg'); --category


INSERT INTO recipes (name, description, cook_time, directions, ingredients, category, recipe_pic) VALUES (
        'Coquito',  --name
        'Very yummy creamy tropical coconut eggnog made with spices and white rum.', --description
        25, --cook_time
                -- Start of Directions, by steps
         'Step 1 In the top of a double boiler, combine egg yolks and evaporated milk. Stirring constantly, cook over lightly simmering water until mixture reaches a temperature of 160 degrees F (71 degrees C). The mixture should be thick enough to coat the back of a spoon.
          Step 2 Transfer mixture to a blender, and add cream of coconut, sweetened condensed milk, rum, water, cloves, cinnamon, and vanilla. Blend for about 30 seconds. Pour into glass bottles and chill overnight.
        ', 
                --Start of Ingredients
'2 egg yolks
1 (12 fluid Fl oz) can evaporated milk
1 (14 Fl oz) can cream of coconut
1 (14 Fl oz) can sweetened condensed milk
.5 Cup(s) white rum
.5 Cup(s) water
.25 Tsp(s) ground cloves
.5 Tsp(s) ground cinnamon
1 Tsp(s) vanilla extract', 'Beverage',
          'https://www.babemadeblog.com/wp-content/uploads/2018/11/Coquito-2.jpg'); --category


INSERT INTO recipes (name, description, cook_time, directions, ingredients, category, recipe_pic) VALUES (
        'Masala Chai',  --name
        'Indian milk tea made with a blend of spices such as cardamom and ginger.', --description
        7, --cook_time
                -- Start of Directions, by steps
         'Step 1 With a mortar and pestle, crack the cardamom pods and discard pod.  Grind the cardamom into fine powder.  If you use ginger, cut into one thin slice.
          Step 2 In a small saucepan, pour the water from the cups. Add cardamom, sugar, and ginger if you like, and bring it to boil. When boiling, add tea leaves. Simmer for 2-3 minutes.
          Step 3 Add milk and bring it to boil again. When boiling again, reduce heat and keep simmering for another 2 minutes.
          Step 4 Remove from heat and strain tea with a strainer.  Serve with a biscuit or cookie.', 
                --Start of Ingredients
'2 tea Cup(s) water
4 pods green cardamom
2 Tsp(s) sugar
1 slice ginger (optional)
3 Tsp(s) loose black tea', 'Beverage',
        'https://assets.epicurious.com/photos/579909083a12dd9d56024018/master/pass/spiced-milk-tea-masala-chai.jpg'); --category


INSERT INTO recipes (name, description, cook_time, directions, ingredients, category, recipe_pic) VALUES (
        'Ham and Cheese Breakfast Quiche',  --name
        'Here is one great idea for what to do with that leftover ham! My picky eaters loved it and it is easy to make!', --description
        16, --cook_time
                -- Start of Directions, by steps
         'Step 1 Preheat oven to 425 degrees F (220 degrees C).
          Step 2 Squeeze any excess moisture from the potatoes and combine them with the melted butter or margarine in a small bowl. Press this mixture into the bottom and sides of an ungreased 10 inch pie pan.
          Step 3 Bake at 425 degrees F (220 degrees C) for 25 minutes.
          Step 4 Remove pan from oven and arrange the ham and cheese evenly over the potatoes. In a separate small bowl, beat together the eggs and the cream. Pour this over the ham and cheese.
          Step 5 Return pan to oven and bake for 425 degrees F (220 degrees C) for 30 minutes, or until the custard has completely set.
          ', 
                --Start of Ingredients
'2 (12 Fl oz) packages frozen hash brown potatoes
.33 Cup(s) butter    
1 Cup(s) cooked diced ham
.5 Cup(s) heavy whipping cream
2 eggs
1 Cup(s) shredded Monterey Jack cheese', 'Breakfast',
          'https://www.homemadeinterest.com/wp-content/uploads/2018/03/Low-Carb-Ham-Cheese-Crustless-Quiche_IG-2.jpg'); --category   

INSERT INTO recipes (name, description, cook_time, directions, ingredients, category, recipe_pic) VALUES (
        'Authentic Mexican Breakfast Tacos',  --name
        'Quick Easy and Delicious! I learned this recipe from many years of eating with the Mexican cooks at my restaurant. I have grown to LOVE this breakfast. If you like spicy food, you will love this.', --description
        27, --cook_time
                -- Start of Directions, by steps
         'Step 1 Crumble the sausage into a skillet over medium-high heat. Cook and stir until evenly brown. Set aside.
          Step 2 Heat one skillet over medium heat, and heat another skillet over high heat. The skillet over high heat is for warming tortillas. In a medium bowl, whisk together the eggs, milk, salt and pepper. Spray the medium heat skillet with some cooking spray, and pour in the eggs. Cook and stir until almost firm. Add the sausage, and continue cooking and stirring until firm.
          Step 3 Meanwhile, warm tortillas for about 45 seconds per side in the other skillet, so they are hot and crispy on the edges, but still pliable.
          Step 4 Sprinkle a little shredded cheese onto each tortilla while it is still hot. Top with some of the scrambled egg and sausage, then add hot pepper sauce and salsa to your liking.
          ', 
                --Start of Ingredients
'6 Fl oz chorizo sausage
8 (6 inch) corn tortillas       
6 eggs
.25 Cup(s) milk
.5 Tsp(s) pepper
.5 Tsp(s) salt
1 Cup(s) shredded Monterey Jack cheese
1 dash hot pepper sauce
.5 Cup(s) salsa', 'Breakfast',
          'https://www.cookingclassy.com/wp-content/uploads/2015/04/breakfast-tacos5-srgb..jpg'); --category    

INSERT INTO recipes (name, description, cook_time, directions, ingredients, category, recipe_pic) VALUES (
        'Breakfast Quinoa',  --name
        'Delicious, filling, and comforting on a cold morning. It is really flexible, so substitute in your favorite nuts and fruit. Cashews and cherries are just my personal favorite.', --description
        16, --cook_time
                -- Start of Directions, by steps
         'Step 1 Bring quinoa, water, milk, cinnamon, and vanilla extract to a boil in a saucepan. Reduce heat to medium-low, cover, and simmer until quinoa is tender and has absorbed the water, 10 to 15 minutes. Remove saucepan from heat.
          Step 2 Mix cherries, cashews, and honey into the quinoa mixture, top with blackberries and creme fraiche.
          ', 
                --Start of Ingredients
'.5 Cup(s) quinoa
.5 Cup(s) water       
.5 Cup(s) skim milk
.5 Tsp(s) ground cinnamon
.5 Tsp(s) vanilla extract
.5 Cup(s) dried cherries
1 Tbsp(s) honey
.5 Cup(s) fresh blackberries
2 Tbsp(s) creme fraiche (optional)', 'Breakfast',
          'http://images.media-allrecipes.com/userphotos/960x960/3758218.jpg'); --category                   


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

