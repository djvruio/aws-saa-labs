CREATE TABLE IF NOT EXISTS accounts (
	user_id serial PRIMARY KEY,
	username VARCHAR ( 50 ) UNIQUE NOT NULL,
	password VARCHAR ( 50 ) NOT NULL,
	email VARCHAR ( 255 ) UNIQUE NOT NULL,
	created_on TIMESTAMP NOT NULL,
    last_login TIMESTAMP 
);

INSERT INTO accounts(username,password, email, created_on, last_login)
VALUES ('pepita', 'pasword01', 'pepita@pepito.com', '2013-06-01', '2013-06-01');

INSERT INTO accounts(username,password, email, created_on, last_login)
VALUES ('rafito', 'pasword02', 'rafito@rafita.com', '2013-06-01', '2013-06-01');

SELECT * FROM accounts;