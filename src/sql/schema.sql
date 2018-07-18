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
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  date_birth DATE NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL CHECK (email ~* '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$'),
  phone VARCHAR(20) NOT NULL CHECK (phone ~* '\+{0,1}[- 0-9]+')
);

CREATE TABLE users (
  username VARCHAR(50) PRIMARY KEY NOT NULL,
  password CHAR(68) NOT NULL,
  enabled BOOLEAN DEFAULT true NOT NULL
);

CREATE TABLE authorities (
  username VARCHAR(50) REFERENCES users(username) NOT NULL,
  authority VARCHAR(50) NOT NULL
);


INSERT INTO customer(first_name, last_name, date_birth, email, phone) VALUES
	('David','Adams', '1995-04-07', 'david@email.com', '626761325'),
	('John','Doe', '1990-02-20', 'john@gmail.com', '753564243'),
	('Ajay','Rao', '1980-05-18', 'ajay@yahoo.com', '267765431'),
	('Cristina','Pacho', '2000-05-10', 'cristina@yahoo.com', '927-542-5134'),
	('Jessie','Pinkman', '1998-03-16', 'jessie@microsoft.com', '6543664335'),
	('Mary','Public', '1985-12-20', 'mary@microsoft.com', '+48 356351626'),
	('Pablo','Escobar', '1970-03-20', 'pablo@gmail.com', '6544567631'),
	('Anna','Paulson', '2000-06-06', 'anna@yahoo.com', '87651135134'),
	('Jessica','Pearson', '1989-11-18', 'jessica@microsoft.com', '+22 46543453'),
	('Mike','Burn', '1990-09-09', 'mike@yahoo.com', '+43 362524644'),
	('Maxwell','Dixon', '1982-06-12', 'max@gmail.com', '+70 242322189');

INSERT INTO users VALUES
  ('john', '{bcrypt}$2a$04$8caCtUToFH5vq63k8ZuC3uVLPILyYSebp2.Yle3w...p247iCQgSG', true),
  ('mary', '{bcrypt}$2a$04$8caCtUToFH5vq63k8ZuC3uVLPILyYSebp2.Yle3w...p247iCQgSG', true),
  ('susan', '{bcrypt}$2a$04$8caCtUToFH5vq63k8ZuC3uVLPILyYSebp2.Yle3w...p247iCQgSG', true);

INSERT INTO authorities VALUES
  ('john','ROLE_EMPLOYEE'),
  ('mary','ROLE_EMPLOYEE'),
  ('mary','ROLE_MANAGER'),
  ('susan','ROLE_EMPLOYEE'),
  ('susan','ROLE_ADMIN');