DROP SCHEMA public CASCADE;
CREATE SCHEMA public;

CREATE SEQUENCE customer_id_seq
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  NO MAXVALUE
  CACHE 1;

CREATE TABLE customer (
  id INT PRIMARY KEY DEFAULT nextval('customer_id_seq') NOT NULL,
  first_name VARCHAR(45) DEFAULT NULL,
  last_name VARCHAR(45) DEFAULT NULL,
  age INT DEFAULT NULL CHECK (age > 0 AND age < 120),
  email VARCHAR(100) DEFAULT NULL CHECK (email ~* '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$'),
  phone VARCHAR(20) DEFAULT NULL CHECK (phone ~* '\+{0,1}[- 0-9]+')
);

INSERT INTO customer(first_name, last_name, age, email, phone) VALUES
	('David','Adams', 20, 'david@email.com', '626761325'),
	('John','Doe', 30,'john@gmail.com', '753564243'),
	('Ajay','Rao', 18,'ajay@yahoo.com', '267765431'),
	('Mary','Public', 24,'mary@microsoft.com', '+48 356351626'),
	('Maxwell','Dixon', 41,'max@gmail.com', '+70 242322189');