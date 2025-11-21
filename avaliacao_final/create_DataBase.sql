-- Criar a base de dados
CREATE DATABASE loja_virtual;
USE loja_virtual;

-- Empresa
CREATE TABLE company (
  id INT AUTO_INCREMENT PRIMARY KEY,
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

-- Cliente
CREATE TABLE customer (
  id INT AUTO_INCREMENT PRIMARY KEY,
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

-- Cartão de fidelidade (1:1 com customer)
CREATE TABLE loyalty_card (
  id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id BIGINT UNIQUE NOT NULL,
  code VARCHAR(64) UNIQUE NOT NULL,
  points INT DEFAULT 0,
  tier ENUM('bronze','silver','gold','platinum') DEFAULT 'bronze',
  issued_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (customer_id) REFERENCES customer(id) ON DELETE CASCADE
);

-- Fornecedor
CREATE TABLE supplier (
  id INT AUTO_INCREMENT PRIMARY KEY,
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

-- Categoria (com hierarquia)
CREATE TABLE category (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  parent_category_id BIGINT,
  FOREIGN KEY (parent_category_id) REFERENCES category(id) ON DELETE SET NULL
);

-- Depósito
CREATE TABLE warehouse (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  address_street VARCHAR(255),
  address_number VARCHAR(32),
  address_district VARCHAR(128),
  address_city VARCHAR(128),
  address_state VARCHAR(64),
  address_cep VARCHAR(16)
);

-- Produto
CREATE TABLE product (
  id INT AUTO_INCREMENT PRIMARY KEY,
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

-- Imagem de produto (atributo multivalorado)
CREATE TABLE product_image (
  id INT AUTO_INCREMENT PRIMARY KEY,
  product_id BIGINT NOT NULL,
  url TEXT NOT NULL,
  alt_text VARCHAR(255),
  FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE
);

-- Relação N:N produto-categoria
CREATE TABLE product_category (
  product_id INT NOT NULL,
  category_id INT NOT NULL,
  PRIMARY KEY (product_id, category_id),
  FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE,
  FOREIGN KEY (category_id) REFERENCES category(id) ON DELETE CASCADE
);

-- Relação N:N produto-fornecedor
CREATE TABLE product_supplier (
  product_id INT NOT NULL,
  supplier_id INT NOT NULL,
  supplier_sku VARCHAR(64),
  cost_price DECIMAL(12,2),
  PRIMARY KEY (product_id, supplier_id),
  FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE,
  FOREIGN KEY (supplier_id) REFERENCES supplier(id) ON DELETE CASCADE
);

-- Estoque (Inventory)
CREATE TABLE inventory (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  product_id INT NOT NULL,
  warehouse_id INT NOT NULL,
  quantity_on_hand INT NOT NULL DEFAULT 0,
  quantity_reserved INT NOT NULL DEFAULT 0,
  UNIQUE (product_id, warehouse_id),
  FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE,
  FOREIGN KEY (warehouse_id) REFERENCES warehouse(id) ON DELETE CASCADE
);

-- Pedido
CREATE TABLE `order` (
  id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id BIGINT NOT NULL,
  order_number VARCHAR(64) UNIQUE NOT NULL,
  order_date DATE NOT NULL,
  status ENUM('created','confirmed','shipped','delivered','canceled') DEFAULT 'created',
  FOREIGN KEY (customer_id) REFERENCES customer(id) ON DELETE RESTRICT
);

-- Item do pedido
CREATE TABLE order_item (
  id INT AUTO_INCREMENT PRIMARY KEY,
  order_id BIGINT NOT NULL,
  product_id BIGINT NOT NULL,
  quantity INT NOT NULL,
  unit_price DECIMAL(12,2) NOT NULL,
  discount_percent DECIMAL(5,2) DEFAULT 0,
  FOREIGN KEY (order_id) REFERENCES `order`(id) ON DELETE CASCADE,
  FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE RESTRICT
);

-- Pagamento (1:1 com pedido)
CREATE TABLE payment (
  id INT AUTO_INCREMENT PRIMARY KEY,
  order_id BIGINT UNIQUE NOT NULL,
  method VARCHAR(64) NOT NULL,
  amount DECIMAL(12,2) NOT NULL,
  status ENUM('pending','paid','failed','refunded') DEFAULT 'pending',
  paid_at DATETIME,
  FOREIGN KEY (order_id) REFERENCES `order`(id) ON DELETE CASCADE
);

-- Remessa (Shipment)
CREATE TABLE shipment (
  id INT AUTO_INCREMENT PRIMARY KEY,
  order_id BIGINT NOT NULL,
  carrier VARCHAR(128) NOT NULL,
  tracking_code VARCHAR(64) NOT NULL,
  shipped_at DATETIME,
  delivered_at DATETIME,
  status ENUM('ready','in_transit','delivered','returned') DEFAULT 'ready',
  FOREIGN KEY (order_id) REFERENCES `order`(id) ON DELETE CASCADE
);
