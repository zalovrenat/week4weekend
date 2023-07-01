CREATE OR REPLACE FUNCTION add_salesperson(
    f_name VARCHAR(25),
    l_name VARCHAR(25)
)
RETURNS VOID
LANGUAGE plpgsql
AS
$MAIN$
BEGIN
    INSERT INTO salesperson(first_name, last_name)
    VALUES(f_name, l_name);
END
$MAIN$;

CREATE OR REPLACE FUNCTION add_invoice(
    sp_id INTEGER,
    cust_id INTEGER,
    c_id INTEGER,
    s_d DATE,
    t_p NUMERIC(8,2)
)
RETURNS VOID
LANGUAGE plpgsql
AS
$MAIN$
BEGIN
    INSERT INTO invoice(salesperson_id,customer_id,car_id,sale_date,total_price)
    VALUES(sp_id,cust_id,c_id,s_d,t_p);
END
$MAIN$;

CREATE OR REPLACE FUNCTION add_customer(
    f_name VARCHAR(25),
    l_name VARCHAR(25),
    d_l_num VARCHAR(14),
    c_s INTEGER
)
RETURNS VOID
LANGUAGE plpgsql
AS
$MAIN$
BEGIN
    INSERT INTO customer(first_name,last_name,drivers_license_number,credit_score)
    VALUES(f_name,l_name,d_l_num,c_s);
END
$MAIN$;

CREATE OR REPLACE FUNCTION add_car(
    y INTEGER,
    mk VARCHAR(25),
    md VARCHAR(25),
    c VARCHAR(25),
    p NUMERIC(8,2),
    t VARCHAR(4)
)
RETURNS VOID
LANGUAGE plpgsql
AS
$MAIN$
BEGIN
    INSERT INTO car(year,make,model,color,price,type)
    VALUES(y,mk,md,c,p,t);
END
$MAIN$;

CREATE OR REPLACE FUNCTION add_service_history(
    c_id INTEGER,
    cust_id INTEGER
)
RETURNS VOID
LANGUAGE plpgsql
AS
$MAIN$
BEGIN
    INSERT INTO service_history(car_id,customer_id)
    VALUES(c_id,cust_id);
END
$MAIN$;

CREATE OR REPLACE FUNCTION add_service_ticket(
    s_h_id INTEGER,
    p NUMERIC(8,2),
    s VARCHAR(50),
    s_d DATE
)
RETURNS VOID
LANGUAGE plpgsql
AS
$MAIN$
BEGIN
    INSERT INTO service_ticket(service_history_id,price,service,service_date)
    VALUES(s_h_id,p,s,s_d);
END
$MAIN$;

CREATE OR REPLACE FUNCTION add_service_ticket_mechanic(
    s_t_id INTEGER,
    m_id INTEGER
)
RETURNS VOID
LANGUAGE plpgsql
AS
$MAIN$
BEGIN
    INSERT INTO service_ticket_mechanic(service_ticket_id,mechanic_id)
    VALUES(s_t_id,m_id);
END
$MAIN$;

CREATE OR REPLACE FUNCTION add_mechanic(
    f_name VARCHAR(25),
    l_name VARCHAR(25)
)
RETURNS VOID
LANGUAGE plpgsql
AS
$MAIN$
BEGIN
    INSERT INTO mechanic(first_name,last_name)
    VALUES(f_name,l_name);
END
$MAIN$;

SELECT add_salesperson('Kassie','Johnson');
SELECT add_salesperson('Trent','Summers');
SELECT add_salesperson('Andrea','Bruno');

SELECT add_mechanic('Jay','Lacey');
SELECT add_mechanic('Ken','Stone');
SELECT add_mechanic('Bart','Karsyn');
SELECT add_mechanic('Charles','Pierce');

SELECT add_customer('Renat','Zalov','IL11-1111-1111',815);
SELECT add_customer('Adik','Zalov','IL11-1111-2222',829);
SELECT add_customer('Amina','Zalova','IL11-1111-3333',817);

SELECT add_car(2023,'Chevrolet','Corvette','White',100000.00,'New');
SELECT add_car(2016,'Toyota','Camry','Gray',21000.00,'New');
SELECT add_car(2012,'Toyota','Corolla','Silver',16000.00,'New');
SELECT add_car(2022,'Jeep','Grand Cherokee L','Gray',42000.00,'New');

SELECT add_service_history(1,1);
SELECT add_service_history(2,2);
SELECT add_service_history(3,3);
SELECT add_service_history(4,1);

SELECT add_service_ticket(4,85.00,'Oil Change',DATE('2022-10-26'));
SELECT add_service_ticket(2,0.00,'Oil Change',DATE('2016-03-15'));
SELECT add_service_ticket(2,75.00,'Oil Change',DATE('2016-10-04'));
SELECT add_service_ticket(3,300.00,'Water Pump Replacement',DATE('2019-07-29'));

SELECT add_service_ticket_mechanic(1,1);
SELECT add_service_ticket_mechanic(2,2);
SELECT add_service_ticket_mechanic(3,2);
SELECT add_service_ticket_mechanic(4,3);
SELECT add_service_ticket_mechanic(4,4);

SELECT add_invoice(1,1,1,DATE('2022-12-09'),107412.34);
SELECT add_invoice(1,1,4,DATE('2022-04-19'),45514.82);
SELECT add_invoice(2,2,2,DATE('2015-09-12'),23257.21);
SELECT add_invoice(3,3,3,DATE('2012-07-03'),17493.85);