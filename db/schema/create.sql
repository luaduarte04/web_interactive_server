DROP TABLE IF EXISTS teachers CASCADE;
DROP TABLE IF EXISTS grades CASCADE;
DROP TABLE IF EXISTS subjects CASCADE;
DROP TABLE IF EXISTS levels CASCADE;
DROP TABLE IF EXISTS types CASCADE;
DROP TABLE IF EXISTS games CASCADE;
DROP TABLE IF EXISTS game_images CASCADE;
DROP TABLE IF EXISTS game_info CASCADE;
DROP TABLE IF EXISTS classroom CASCADE;

CREATE TABLE teachers (
  id SERIAL PRIMARY KEY NOT NULL,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  avatar VARCHAR(255) NOT NULL, 
  password VARCHAR(255) NOT NULL
);

CREATE TABLE grades (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE subjects (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE levels (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE types (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE games (
  id SERIAL PRIMARY KEY NOT NULL,
  grade_id INTEGER REFERENCES grades(id) ON DELETE CASCADE,
  subject_id INTEGER REFERENCES subjects(id) ON DELETE CASCADE,
  type_id INTEGER REFERENCES types(id) ON DELETE CASCADE,
  teacher_id INTEGER REFERENCES teachers(id) ON DELETE CASCADE,
  level_id INTEGER REFERENCES levels(id) ON DELETE CASCADE
);

CREATE TABLE game_images (
  id SERIAL PRIMARY KEY NOT NULL,
  game_id INTEGER REFERENCES games(id) ON DELETE CASCADE,
  image VARCHAR(255) NOT NULL
);

CREATE TABLE game_info (
  id SERIAL PRIMARY KEY NOT NULL,
  game_id INTEGER REFERENCES games(id) ON DELETE CASCADE,
  title VARCHAR(255) NOT NULL,
  description VARCHAR(255) 
);

CREATE TABLE classroom (
  id SERIAL PRIMARY KEY NOT NULL,
  teacher_id INTEGER REFERENCES teachers(id) on DELETE CASCADE,
  url VARCHAR(255) NOT NULL
);