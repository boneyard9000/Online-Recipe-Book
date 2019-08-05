CREATE TABLE users (

  id serial PRIMARY KEY,
  firstName varchar(255) NOT NULL,
  lastName varchar(255) NOT NULL,   
  password varchar(32) NOT NULL,    
  salt varchar(256) NOT NULL,
  email varchar(200) NOT NULL UNIQUE,
phone varchar(10) NOL NULL UNIQUE,

  
);
