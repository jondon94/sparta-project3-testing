DROP TABLE IF EXISTS neo;

CREATE TABLE neo (

  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  body TEXT

);

insert into neo (name, id) values ('Open-architected', 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim.');
