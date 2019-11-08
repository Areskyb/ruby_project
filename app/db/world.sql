DROP TABLE IF EXISTS cities ;
DROP TABLE IF EXISTS countries;


CREATE TABLE countries(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255) UNIQUE NOT NULL,
  visited BOOLEAN NOT NULL
);

CREATE TABLE cities(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  country_id INT4 REFERENCES countries(id) ON DELETE CASCADE,
  visited BOOLEAN NOT NULL
);
