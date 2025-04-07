

DROP TABLE IF EXISTS request_feedback CASCADE;
DROP TABLE IF EXISTS property_requests CASCADE;
DROP TABLE IF EXISTS customers CASCADE;

-- Tabela customers
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    customer_code VARCHAR(10),
    full_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    registration_date DATE,
    country VARCHAR(50),
    city VARCHAR(50)
);

-- Tabela property_requests
CREATE TABLE property_requests (
    request_id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(id),
    request_date DATE,
    property_type VARCHAR(50),
    max_budget NUMERIC(12,2),
    min_surface INTEGER,
    preferred_city VARCHAR(50),
    request_status VARCHAR(20)
);

-- Tabela request_feedback
CREATE TABLE request_feedback (
    id SERIAL PRIMARY KEY,
    request_id INTEGER REFERENCES property_requests(request_id),
    feedback_date DATE,
    rating INTEGER CHECK (rating BETWEEN 1 AND 5),
    comments TEXT
);
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    customer_code VARCHAR(10),
    full_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    registration_date DATE,
    country VARCHAR(50),
    city VARCHAR(50)
);
COPY property_requests(request_id, customer_id, request_date, property_type, max_budget, min_surface, preferred_city, request_status)
FROM 'C:/Users/Claudia/Desktop/property_requests.csv'
DELIMITER ',' CSV HEADER ENCODING 'UTF8';

