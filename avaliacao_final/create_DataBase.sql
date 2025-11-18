-- Tipos ENUM
CREATE TABLE company (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  cnpj VARCHAR(32) NOT NULL,
  email VARCHAR(255),
  phone VARCHAR(32),
  address_street VARCHAR(255),
  address_number VARCHAR(32),
  address_district VARCHAR(128),
  address_city VARCHAR(128),
  address_state VARCHAR(64),
  address_cep VARCHAR(16)
);

CREATE TABLE customer (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  full_name VARCHAR(255) NOT NULL,
  cpf VARCHAR(16) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  phone VARCHAR(32),
  address_street VARCHAR(255),
  address_number VARCHAR(32),
  address_district VARCHAR(128),
  address_city VARCHAR(128),
  address_state VARCHAR(64),
  address_cep VARCHAR(16),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE loyalty_card (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  customer_id BIGINT UNIQUE NOT NULL,
  code VARCHAR(64) UNIQUE NOT NULL,
  points INT DEFAULT 0,
  tier ENUM('bronze','silver','gold','platinum') DEFAULT 'bronze',
  issued_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (customer_id) REFERENCES customer(id) ON DELETE CASCADE
);

CREATE TABLE supplier (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  cnpj VARCHAR(32) NOT NULL,
  email VARCHAR(255),
  phone VARCHAR(32),
  address_street VARCHAR(255),
  address_number VARCHAR(32),
  address_district VARCHAR(128),
  address_city VARCHAR(128),
  address_state VARCHAR(64),
  address_cep VARCHAR(16)
);

CREATE TABLE category (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  parent_category_id BIGINT,
  FOREIGN KEY (parent_category_id) REFERENCES category(id) ON DELETE SET NULL
);

CREATE TABLE warehouse (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  address_street VARCHAR(255),
  address_number VARCHAR(32),
  address_district VARCHAR(128),
  address_city VARCHAR(128),
  address_state VARCHAR(64),
  address_cep VARCHAR(16)
);

CREATE TABLE product (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  company_id BIGINT NOT NULL,
  sku VARCHAR(64) UNIQUE NOT NULL,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  brand VARCHAR(128),
  unit_price DECIMAL(12,2) NOT NULL,
  voltage VARCHAR(32),
  power_watts INT,
  warranty_months INT DEFAULT 12,
  tags JSON,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (company_id) REFERENCES company(id) ON DELETE CASCADE
);

CREATE TABLE product_image (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  product_id BIGINT NOT NULL,
  url TEXT NOT NULL,
  alt_text VARCHAR(255),
  FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE
);

CREATE TABLE product_category (
  product_id BIGINT NOT NULL,
  category_id BIGINT NOT NULL,
  PRIMARY KEY (product_id, category_id),
  FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE,
  FOREIGN KEY (category_id) REFERENCES category(id) ON DELETE CASCADE
);

CREATE TABLE product_supplier (
  product_id BIGINT NOT NULL,
  supplier_id BIGINT NOT NULL,
  supplier_sku VARCHAR(64),
  cost_price DECIMAL(12,2),
  PRIMARY KEY (product_id, supplier_id),
  FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE,
  FOREIGN KEY (supplier_id) REFERENCES supplier(id) ON DELETE CASCADE
);

CREATE TABLE inventory (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  product_id BIGINT NOT NULL,
  warehouse_id BIGINT NOT NULL,
  quantity_on_hand INT NOT NULL DEFAULT 0,
  quantity_reserved INT NOT NULL DEFAULT 0,
  UNIQUE (product_id, warehouse_id),
  FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE,
  FOREIGN KEY (warehouse_id) REFERENCES warehouse(id) ON DELETE CASCADE
);

CREATE TABLE `order` (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  customer_id BIGINT NOT NULL,
  order_number VARCHAR(64) UNIQUE NOT NULL,
  order_date DATE NOT NULL,
  status ENUM('created','confirmed','shipped','delivered','canceled') DEFAULT 'created',
  FOREIGN KEY (customer_id) REFERENCES customer(id) ON DELETE RESTRICT
);

CREATE TABLE order_item (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  order_id BIGINT NOT NULL,
  product_id BIGINT NOT NULL,
  quantity INT NOT NULL,
  unit_price DECIMAL(12,2) NOT