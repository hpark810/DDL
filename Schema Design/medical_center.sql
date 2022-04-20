-- Create schemas

-- Create tables
DROP DATABASE IF EXISTS medical_center_db;

CREATE DATABASE medical_center_db;

\c medical_center_db

CREATE TABLE IF NOT EXISTS doctors
(
    id SERIAL PRIMARY KEY,
    last_name VARCHAR(20) NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    specialty_id INTEGER,
    center_id INTEGER
);

CREATE TABLE IF NOT EXISTS patients
(
    id SERIAL PRIMARY KEY,
    last_name VARCHAR(20) NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    id_primary_doctor INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS diagnoses
(
    id SERIAL PRIMARY KEY,
    visit_id INTEGER,
    diagnostic_code INTEGER
);

CREATE TABLE IF NOT EXISTS visits
(
    id SERIAL PRIMARY KEY,
    visit_date DATE NOT NULL,
    patient_id INTEGER NOT NULL UNIQUE,
    doctor_id INTEGER NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS diseases
(
    id SERIAL PRIMARY KEY,
    diagnosis_name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS medical_centers
(
    id SERIAL PRIMARY KEY,
    street_address INTEGER NOT NULL,
    city VARCHAR(20) NOT NULL,
    state VARCHAR(20) NOT NULL,
    phone_number TEXT
);

CREATE TABLE IF NOT EXISTS medical_specialties
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);


-- Create Foreign Keys
ALTER TABLE patients
    ADD    FOREIGN KEY (id_primary_doctor)
    REFERENCES doctors(id);
    
ALTER TABLE diagnoses
    ADD    FOREIGN KEY (diagnostic_code)
    REFERENCES diseases(id);
    
ALTER TABLE visits
    ADD    FOREIGN KEY (patient_id)
    REFERENCES patients(id);
    
ALTER TABLE visits
    ADD    FOREIGN KEY (doctor_id)
    REFERENCES doctors(id);
    
ALTER TABLE diagnoses
    ADD    FOREIGN KEY (visit_id)
    REFERENCES visits(id);
    
ALTER TABLE doctors
    ADD    FOREIGN KEY (specialty_id)
    REFERENCES medical_specialties(id);
    
ALTER TABLE doctors
    ADD    FOREIGN KEY (center_id)
    REFERENCES medical_centers(id);

INSERT INTO medical_specialties
  (name)
VALUES
  ('Family Medicine'),
  ('OB/GYN'),
  ('Pediatrics');

INSERT INTO diseases
  (diagnosis_name)
VALUES
  ('chicken pox'),
  ('measles'),
  ('Covid-19');

INSERT INTO medical_centers
  (street_address, city, state, phone_number)
VALUES
  (1234, 'Springfield', 'MO', '111-111-1111'),
  (9657, 'Columbus', 'MN', '2222222222');

INSERT INTO doctors
  (last_name, first_name, specialty_id, center_id)
VALUES
  ('Fredricksen', 'John', 3, 1),
  ('Jackson', 'Keri', 1, 2),
  ('Smith', 'Kara', 2, 1);

INSERT INTO patients
  (last_name, first_name, id_primary_doctor)
VALUES
  ('Johnson', 'Jenn', 2),
  ('Swanson', 'Freda', 1),
  ('Doliner', 'Michael', 3);

INSERT INTO visits
  (visit_date, patient_id, doctor_id)
VALUES
  ('2020-01-09', 2, 3),
  ('2020-06-26', 3, 1);

INSERT INTO diagnoses
  (visit_id, diagnostic_code)
VALUES
  (2, 1),
  (2, 3),
  (1, 2);