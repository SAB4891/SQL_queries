CREATE DATABASE IF NOT EXISTS test_DB;
USE test_DB;

CREATE TABLE country (
    country_code CHAR(2) NOT NULL,
    country_name VARCHAR(30) NOT NULL,
    PRIMARY KEY (country_code)
);

CREATE TABLE customer_details (
    customer_id SMALLINT NOT NULL,
    customer_name VARCHAR(10) NOT NULL,
    country_code CHAR(2) NOT NULL,
    PRIMARY KEY (customer_id),
    CONSTRAINT FK_CountryCustomer FOREIGN KEY (country_code)
        REFERENCES country (country_code)
);

CREATE TABLE orders_v1 (
    order_id MEDIUMINT NOT NULL,
    customer_id SMALLINT,
    deliver_fee_lc SMALLINT,
    exchange_rate_EU DECIMAL(5 , 4 ),
    PRIMARY KEY (order_id),
    CONSTRAINT FK_CustomerOrder FOREIGN KEY (customer_id)
        REFERENCES customer_details (customer_id)
        ON DELETE CASCADE
);


INSERT INTO country (country_code, country_name)
    VALUES('bh', 'Bahrain'), ('ae','United Arab Emirates'), 
    ('eg', 'Egypt'), ('kw', 'Kuwait'), ('om', 'Oman');
    
    
INSERT INTO customer_details (customer_id, customer_name, country_code) 
VALUES (1, 'Sam','ae'),  (4, 'Anish','kw'), (8, 'Taha', 'eg');


/* (84564 6 2000 0.0007) last row was deleted since a customer with an id 6 does not exsist in the customer_details table */

INSERT INTO orders_v1 (order_id, customer_id, deliver_fee_lc, exchange_rate_EU)
VALUES (14567, 1, 7, 0.26), (61528, 8, 12, 0.05), (12323, 8, 15, 0.05),
(83293, 1, 9, 0.26), (23342, 8, 7, 0.05), (67543, 1, 4, 0.26), (76433, 1, 9, 0.26);