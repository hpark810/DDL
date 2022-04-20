-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE galaxies
(
  id SERIAL PRIMARY KEY,
  galaxy_name TEXT NOT NULL
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  planet_name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbit_star_id TEXT NOT NULL,
  galaxy_id INTEGER NOT NULL REFERENCES galaxies,
  has_moon BOOLEAN NOT NULL
);

CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  moon_name TEXT NOT NULL,
  planet_id INTEGER REFERENCES planets
);

CREATE TABLE stars
(
  id SERIAL PRIMARY KEY,
  star_name TEXT NOT NULL
);

INSERT INTO galaxies
  (galaxy_name)
VALUES
  ('Milky Way');

INSERT INTO planets
  (planet_name, orbital_period_in_years, orbit_star_id, galaxy_id, has_moon)
VALUES
  ('Venus', 0.62, 1, 1, false),
  ('Earth', 1.00, 1, 1, true),
  ('Mars', 1.88, 1, 1, true), 
  ('Neptune', 164.8, 1, 1, true),
  ('Proxima Centauri b', 0.03, 2, 1, false),
  ('Gliese 876 b', 0.23, 3, 1, false);

INSERT INTO moons
  (moon_name, planet_id)
VALUES
  ('The Moon', 2),
  ('Phobos', 3),
  ('Deimos', 3),
  ('Naiad', 4),
  ('Thalassa', 4),
  ('Despina', 4),
  ('Galatea', 4),
  ('Larissa', 4),
  ('S/2004 N 1', 4),
  ('Proteus', 4),
  ('Triton', 4),
  ('Nereid', 4),
  ('Halimede', 4),
  ('Sao', 4),
  ('Laomedeia', 4),
  ('Psamathe', 4),
  ('Neso', 4);

INSERT INTO stars
  (star_name)
VALUES
  ('The Sun'),
  ('Proxima Centauri'),
  ('Gliese 876');
