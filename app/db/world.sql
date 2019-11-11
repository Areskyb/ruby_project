DROP TABLE IF EXISTS cities ;
DROP TABLE IF EXISTS countries;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS actions;
--
-- CREATE TABLE users (
--   id SERIAL8 PRIMARY KEY,
--   name VARCHAR(255) UNIQUE NOT NULL,
--   age INT8 NOT NULL,
--   origin_city VARCHAR(255) NOT NULL
--
-- );

CREATE TABLE countries(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) UNIQUE NOT NULL,
  visited BOOLEAN NOT NULL
);

CREATE TABLE cities(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) UNIQUE NOT NULL,
  country_id INT8 REFERENCES countries(id) ON DELETE CASCADE,
  visited BOOLEAN NOT NULL
);

-- CREATE TABLE actions(
--   id SERIAL8 PRIMARY KEY,
--   user_id INT8 REFERENCES users(id),
--   city_id INT8 REFERENCES cities(id),
--   visited BOOLEAN NOT NULL,
--   img VARCHAR(255),
--   description VARCHAR(300),
-- )
