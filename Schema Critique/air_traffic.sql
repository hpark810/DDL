-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic_db;

CREATE DATABASE air_traffic_db;

\c air_traffic_db

CREATE TABLE IF NOT EXISTS passengers
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS airlines
(
  id SERIAL PRIMARY KEY,
  airline_name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS flights
(
  id SERIAL PRIMARY KEY,
  airline_id INTEGER REFERENCES airlines ON DELETE CASCADE,
  from_city TEXT NOT NULL,
  from_country TEXT NOT NULL,
  to_city TEXT NOT NULL,
  to_country TEXT NOT NULL,
  departure_time TIMESTAMP,
  arrival_time TIMESTAMP
);

CREATE TABLE IF NOT EXISTS tickets
(
  id SERIAL PRIMARY KEY,
  passenger_id INTEGER REFERENCES passengers ON DELETE SET NULL,
  flight_id INTEGER REFERENCES flights ON DELETE SET NULL,
  seat TEXT
);

INSERT INTO passengers
  (first_name, last_name)
VALUES
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley'),
  ('Waneta', 'Skeleton'),
  ('Berkie', 'Wycliff'),
  ('Alvin', 'Leathes'),
  ('Cory', 'Squibbes');

INSERT INTO airlines
  (airline_name)
VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('American Airlines'),
  ('Avianca Brasil');

INSERT INTO flights
  (departure_time, arrival_time, airline_id, from_city, from_country, to_city, to_country)
VALUES
  ('2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 'Washington DC', 'United States', 'Seattle', 'United States'),
  ('2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 'Tokyo', 'Japan', 'London', 'United Kingdom'),
  ('2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 'Los Angeles', 'United States', 'Las Vegas', 'United States'),
  ('2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 'Seattle', 'United States', 'Mexico City', 'Mexico'),
  ('2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 'Paris', 'France', 'Casablanca', 'Morocco'),
  ('2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 'Dubai', 'UAE', 'Beijing', 'China'),
  ('2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 'New York', 'United States', 'Charlotte', 'United States'),
  ('2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 'Cedar Rapids', 'United States', 'Chicago', 'United States'),
  ('2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 'Charlotte', 'United States', 'New Orleans', 'United States'),
  ('2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 'Sao Paolo', 'Brazil', 'Santiago', 'Chile');

INSERT INTO tickets
  (passenger_id, flight_id, seat)
VALUES
  (1, 1, '33B'),
  (2, 2, '8A'),
  (3, 3, '12F'),
  (1, 4, '20A'),
  (4, 5, '23D'),
  (2, 6, '18C'),
  (5, 7, '9E'),
  (6, 8, '1A'),
  (5, 9, '32B'),
  (7, 10, '10D');
