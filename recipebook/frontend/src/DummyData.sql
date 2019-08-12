START TRANSACTION;

INSERT INTO recipes (name, description, cook_time, directions, ingredients, category)
        VALUES ('Chicken Cheesecake', 'sounds weird...is weird', '120',
        'get a chicken.  kill and butcher.  Its easier if you do it quick.  Get a cheesecake.  Put chicken in to cheesecake.  Bake at 350 until golden brown',
        'Chicken (live), Cheesecake, Killing Block', 'dessert'),


        ('Breakfast Pizza', 'The Breakfast of Champions.  Minimal effort.  maximal reward', '1 Night', 'Order Pizza from your favorite local establishment.  Eat no more than half of said pizza, you have to be considerate of your morning self.
        Leave the rest of said pizza anywhere except the refrigerator, that defeats the point.  The stovetop, the foot of a couch, or a bedroom dresser are commonly accepted locations.  You will know your pizza is ready because you will wake up and be hungry
        and it will exist; however, you must not allow yourself to consume the pizza before it has properly cured.  Double check the the ZA is room temperature and the cheese has completely resolidified.  Be aware that it cannot truly be considered breakfast pizza 
        if it is reheated or is consumed before 10AM.  This flexible treat can (and should) be combined with whatever condiments you have in your fridge, sriracha is a sure crowd pleaser.', 'pizaa, fixins', 'breakfast'),

        ('Hot Dog Margarita', 'technically edible', '300', 'purchase pack of 8 hot dogs minimum quality.  
        Beat to pulp with mortar and pestal.  Cover with generous quantity of tequila.  Let cure in sun for half day (or so)',
        'Hot Dogs, Bottle of Tequila', 'alcoholic beverage'),

        ('Literal Dirt', 'Its literally just dirt', '1000000', 'go outside.  Find some dirt.  Its not very hard to see where it goes from here.  Shovel said dirt in large bucket of your choosing.  
        Dump out said dirt.  Repeat process until entire yard has been turned.  Wait 6-8 months for delicious veggies to grow.  Eat that, not the dirt.  Its better',  
        'dirt, bucket, sunlight, large yard', 'miscelleous'),

        ('Oil Change', 'this is not a recipe, its an oil change.  How did this get in here', '60', 'let car sit at least 15 minutes to cool.  Jack up car and put on jack stands.  Open oil plug and drain in to drain pan.  
        Replace oil filter.  Refill your oil.  Replace drain plug.  Also change drain plug gasket if necessary.  Put car back on to ground.  Fill the oil and check level once settled.  Congratulations, you jsut changed you oil.  
        I bet youre hungry now...', 'motor oil, car, oil filter, oil pan, wrenches, jack stand, car jack', 'automotive'),

        ('Unboiled Water', 'Tired of burnt water?  We can fix that.', '20', 'Fill large pot with water.  Put on high an let reach a rolling boil.  Remove pot from flame and take it outside.  Throw that nastiness out.  
        Refill pot with fresh, unboiled wter from the tap.  the less boiled the better.  You have now learned how to make unboiled water.  Profit', 'water, large pot, stove', 'beverage');



        INSERT INTO users (first_name, last_name, password, salt, email, phone)
                VALUES ('a', 'a', 'TkcxOZ+G2JaDh2cg0YMuxg==', '+GbyRIz87EbaECurSAvolcYBK3LwzLhwBmk2FyQ+/3xauT/pwa7pIBdFuGXfrDCO2+WrPyeEGTEoGL4B7ujl5XCv8C0DMWrtB9GEGmtdV5CgKSEHSHYkWKqDrV+StLh3CeiQP4qyX7l7KNLQW1uXY4cnjk6Mjh9W5lhUmnA+3/w=',
                        'a@a', '1111111111'),
                        ('b', 'b', 'Ni28xocRqR+/yshSizUEBA==', 'kgrv1tiu697SYYwHN79eQeeb41YSeFfYjXY7HMqzz3wTc3WL89+dFNJ+ANqJzzyy9FBP+xo+8mAZJUdKZDY3CS767a9EzgNJIU4Z8MgcEP6mJxJVV+4IwrFc1aG+BXbb+gkZIRSSpjS+1KYL3ZCOpA0s5hArrdOXEci2MbDnapE=', 
                        'b@b', '2222222222'),
                        ('c', 'c', 'cP0qmLqLa9WLAN+VjwIeaA==', '1VQ6uANweIdt9kF83M5wozKTCu/TPm1UX4CgSKlRPqCXNahvNa/AIK84omqOs+f7V9I8emO1rodr/5u5ZsmO0QtIofaIcRtgKuXpvG/BhglK3ezdGKUN1MJtUD7eW3kWtDvmQw5ouXz8fu/z53+8JDTWzLcy20mZ1U4G4xeLrxA=', 
                        'c@c', 3333333333);

        INSERT INTO user_recipes (user_id, recipe_id)
                VALUES (1, 1),
                        (1, 2),
                        (1, 3), 
                        (1, 4),
                        (1, 5),
                        (2, 1),
                        (2, 3),
                        (2, 5);

COMMIT TRANSACTION;
