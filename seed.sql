DROP TABLE IF EXISTS rock;

CREATE TABLE rock (

  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  body TEXT
);

INSERT INTO rock (title , body) VALUES ('Mercury' , 'one');
INSERT INTO rock (title , body) VALUES ('Venus' , 'two');
INSERT INTO rock (title , body) VALUES ('Earth' , 'here');
INSERT INTO rock (title , body) VALUES ('Mars' , 'four');
