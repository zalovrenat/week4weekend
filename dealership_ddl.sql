CREATE TABLE salesperson(
    salesperson_id SERIAL PRIMARY KEY,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL
);

CREATE TABLE customer(
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL,
    drivers_license_number VARCHAR(14) NOT NULL UNIQUE,
    credit_score INTEGER
);

ALTER TABLE customer
ALTER COLUMN drivers_license_number TYPE VARCHAR(25);

CREATE TABLE car(
    car_id SERIAL PRIMARY KEY,
    year INTEGER NOT NULL,
    make VARCHAR(25) NOT NULL,
    model VARCHAR(25) NOT NULL,
    color VARCHAR(25) NOT NULL,
    price NUMERIC(8,2) NOT NULL,
    type VARCHAR(4) NOT NULL
);

CREATE TABLE service_history(
    service_history_id SERIAL PRIMARY KEY,
    car_id INTEGER NOT NULL,
    customer_id INTEGER NOT NULL,
    FOREIGN KEY (car_id) REFERENCES car(car_id) ON DELETE CASCADE,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id) ON DELETE CASCADE
);

CREATE TABLE invoice(
    invoice_id SERIAL PRIMARY KEY,
    salesperson_id INTEGER NOT NULL,
    customer_id INTEGER NOT NULL,
    car_id INTEGER NOT NULL,
    sale_date DATE DEFAULT CURRENT_DATE,
    total_price NUMERIC(8,2) NOT NULL
);

ALTER TABLE invoice
ADD FOREIGN KEY (salesperson_id) REFERENCES salesperson(salesperson_id) ON DELETE CASCADE,
ADD FOREIGN KEY (customer_id) REFERENCES customer(customer_id) ON DELETE CASCADE,
ADD FOREIGN KEY (car_id) REFERENCES car(car_id) ON DELETE CASCADE;

CREATE TABLE service_ticket(
    service_ticket_id SERIAL PRIMARY KEY,
    service_history_id INTEGER NOT NULL,
    price NUMERIC(8,2) NOT NULL,
    service VARCHAR(50) NOT NULL,
    service_date DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (service_history_id) REFERENCES service_history(service_history_id) ON DELETE CASCADE
);

CREATE TABLE mechanic(
    mechanic_id SERIAL PRIMARY KEY,
    first_name VARCHAR(25),
    last_name VARCHAR(25)
);

CREATE TABLE service_ticket_mechanic(
    service_ticket_mechanic_id SERIAL PRIMARY KEY,
    service_ticket_id INTEGER NOT NULL,
    mechanic_id INTEGER NOT NULL,
    FOREIGN KEY (service_ticket_id) REFERENCES service_ticket(service_ticket_id) ON DELETE CASCADE,
    FOREIGN KEY (mechanic_id) REFERENCES mechanic(mechanic_id) ON DELETE CASCADE
);