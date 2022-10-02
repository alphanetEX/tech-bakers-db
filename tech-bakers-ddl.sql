CREATE DATABASE IF NOT EXISTS tech_bakers_db;
USE tech_bakers_db; 


CREATE TABLE IF NOT EXISTS roles(
    name VARCHAR(255),
    createdAt DATETIME,
    updatedAt DATETIME,
    roleId MEDIUMINT NOT NULL AUTO_INCREMENT UNIQUE, 
    CONSTRAINT role_pk PRIMARY KEY (roleId)
);


CREATE TABLE IF NOT EXISTS discounts (
    name VARCHAR(255),
    createdAt DATETIME,
    updatedAt DATETIME,
    discountId MEDIUMINT NOT NULL AUTO_INCREMENT, 
    CONSTRAINT discount_pk PRIMARY KEY (discountId)
);

CREATE TABLE IF NOT EXISTS vounchers (
    name VARCHAR(255), 
    createdAt DATETIME,
    updatedAt DATETIME,
    vouncherId MEDIUMINT NOT NULL AUTO_INCREMENT, 
    CONSTRAINT vouncher_pk PRIMARY KEY (vouncherId)
);


CREATE TABLE IF NOT EXISTS payments (
    name VARCHAR(255),
    createdAt DATETIME, 
    updatedAt DATETIME,
    paymentId MEDIUMINT NOT NULL AUTO_INCREMENT, 
    CONSTRAINT payment_pk PRIMARY KEY (paymentId)
);

CREATE TABLE IF NOT EXISTS categories (
    name VARCHAR(255),
    createdAt DATETIME, 
    updatedAt DATETIME,
    categorieId MEDIUMINT NOT NULL AUTO_INCREMENT, 
    CONSTRAINT categorie_pk PRIMARY KEY (categorieId)
);

CREATE TABLE IF NOT EXISTS types ( 
    name VARCHAR(255),
    createdAt DATETIME, 
    updatedAt DATETIME,
    typeId MEDIUMINT NOT NULL AUTO_INCREMENT, 
    CONSTRAINT type_pk PRIMARY KEY (typeId)
);
-------------------ONE RELATION-------------------

CREATE TABLE IF NOT EXISTS users(
    fullname VARCHAR(255),
    lastname VARCHAR(255),
    email VARCHAR(255),
    phonenumber INT(11),
    address VARCHAR(255),
    city VARCHAR(255), 
    password VARCHAR(255),
    terms VARCHAR(255),
    createdAt DATETIME, 
    updatedAt DATETIME,
    roleId MEDIUMINT NOT NULL,
    userId MEDIUMINT NOT NULL AUTO_INCREMENT UNIQUE, 
    CONSTRAINT user_pk PRIMARY KEY (userId)
);

CREATE TABLE IF NOT EXISTS photos(
    name VARCHAR(255),
    createdAt DATETIME, 
    updatedAt DATETIME,
    userId MEDIUMINT, 
    photoId MEDIUMINT NOT NULL AUTO_INCREMENT, 
    CONSTRAINT photo_pk PRIMARY KEY (photoId)
);



ALTER TABLE users ADD CONSTRAINT role_fk 
FOREIGN KEY (roleId) REFERENCES roles(roleId)
ON DELETE NO ACTION
ON UPDATE CASCADE;

ALTER TABLE photos ADD CONSTRAINT user_fk
FOREIGN KEY (userId) REFERENCES users(userId)
ON DELETE NO ACTION
ON UPDATE CASCADE; 

-------------------TWO RELATIONS-------------------
CREATE TABLE IF NOT EXISTS products(
    createdAt DATETIME, 
    updatedAt DATETIME,
    name VARCHAR(255),
    description TEXT,
    stock INT(11),
    price DECIMAL(10,0),
    discount DECIMAL(10,0),
    categoryId MEDIUMINT,
    typeId MEDIUMINT,
    productId MEDIUMINT NOT NULL AUTO_INCREMENT,
    CONSTRAINT producs_pk PRIMARY KEY (productId)
);


ALTER TABLE products ADD CONSTRAINT type_fk
FOREIGN KEY (typeId) REFERENCES types(typeId)
ON DELETE NO ACTION 
ON UPDATE CASCADE; 


ALTER TABLE products ADD CONSTRAINT category_fk
FOREIGN KEY (categoryId) REFERENCES categories(categorieId)
ON DELETE NO ACTION
ON UPDATE CASCADE; 

-------------------DEPENCIES OF MULTIPLE RELATION PATHER TABLE-------------------

CREATE TABLE IF NOT EXISTS images(
    createdAt DATETIME, 
    updatedAt DATETIME,
    name VARCHAR(255),
    productId MEDIUMINT, 
    imageId MEDIUMINT NOT NULL AUTO_INCREMENT,
    CONSTRAINT image_pk PRIMARY KEY (imageId) 
);

ALTER TABLE images ADD CONSTRAINT producs_fk
FOREIGN KEY (productId) REFERENCES products(productId)
ON DELETE NO ACTION 
ON UPDATE CASCADE;

-------------------TRANSITIVES-------------------


CREATE TABLE IF NOT EXISTS discounts(
    createdAt DATETIME, 
    updatedAt DATETIME,
    name VARCHAR(255),
    vouncherId MEDIUMINT,
    userId MEDIUMINT,
    discountId MEDIUMINT NOT NULL AUTO_INCREMENT,
    CONSTRAINT discount_pk PRIMARY KEY (discountId)
);


ALTER TABLE discounts ADD CONSTRAINT discount_user_fk
FOREIGN KEY (userId) REFERENCES  users(userId)
ON DELETE NO ACTION
ON UPDATE CASCADE;


ALTER TABLE discounts ADD CONSTRAINT discount_vouncher_fk
FOREIGN KEY (vouncherId) REFERENCES  vounchers(vouncherId)
ON DELETE NO ACTION
ON UPDATE CASCADE;


CREATE TABLE IF NOT EXISTS sales(
    createdAt DATETIME, 
    updatedAt DATETIME,
    date DATETIME,
    name VARCHAR(255),
    ticket_number VARCHAR(255),
    userId MEDIUMINT,
    paymentId MEDIUMINT,
    productId MEDIUMINT,
    saleId MEDIUMINT NOT NULL AUTO_INCREMENT,
    CONSTRAINT sale_pk PRIMARY KEY (saleId)
);



ALTER TABLE sales ADD CONSTRAINT users_fk
FOREIGN KEY (userId) REFERENCES  users(userId)
ON DELETE NO ACTION
ON UPDATE CASCADE; 

ALTER TABLE sales ADD CONSTRAINT payment_fk
FOREIGN KEY (paymentId) REFERENCES payments(paymentId)
ON DELETE NO ACTION 
ON UPDATE CASCADE; 


ALTER TABLE sales ADD CONSTRAINT product_fk
FOREIGN KEY (productId) REFERENCES products(productId)
ON DELETE NO ACTION
ON UPDATE CASCADE; 

