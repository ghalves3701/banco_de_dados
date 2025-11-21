DELIMITER $$

CREATE PROCEDURE carga_company()
BEGIN
  DECLARE i INT DEFAULT 1;
  WHILE i <= 5 DO
    INSERT INTO company (name, cnpj, email, phone, address_city, address_state)
    VALUES (
      CONCAT('Empresa ', i),
      LPAD(i, 14, '0'),
      CONCAT('empresa', i, '@mail.com'),
      CONCAT('(16)9', LPAD(i, 8, '0')),
      'Franca',
      'SP'
    );
    SET i = i + 1;
  END WHILE;
END$$

DELIMITER ;

-- Executar procedure
CALL carga_company();

--Clientes
DELIMITER $$

CREATE PROCEDURE carga_customer()
BEGIN
  DECLARE i INT DEFAULT 1;
  WHILE i <= 500 DO
    INSERT INTO customer (full_name, cpf, email, phone, address_city, address_state)
    VALUES (
      CONCAT('Cliente ', i),
      LPAD(i, 11, '0'),
      CONCAT('cliente', i, '@mail.com'),
      CONCAT('(16)9', LPAD(i, 8, '0')),
      'Franca',
      'SP'
    );
    SET i = i + 1;
  END WHILE;
END$$

DELIMITER ;

CALL carga_customer();


--produtos
DELIMITER $$

CREATE PROCEDURE carga_product()
BEGIN
  DECLARE i INT DEFAULT 1;
  WHILE i <= 500 DO
    INSERT INTO product (company_id, sku, name, unit_price)
    VALUES (
      (i % 500) + 1,
      CONCAT('SKU-', LPAD(i, 6, '0')),
      CONCAT('Produto ', i),
      (50 + (i % 200))
    );
    SET i = i + 1;
  END WHILE;
END$$

DELIMITER ;

CALL carga_product();

--pedidos

DELIMITER $$

CREATE PROCEDURE carga_order()
BEGIN
  DECLARE i INT DEFAULT 1;
  WHILE i <= 500 DO
    INSERT INTO `order` (customer_id, order_number, order_date)
    VALUES (
      (i % 500) + 1,
      CONCAT('ORD-', LPAD(i, 6, '0')),
      DATE_ADD('2025-01-01', INTERVAL (i % 180) DAY)
    );
    SET i = i + 1;
  END WHILE;
END$$

DELIMITER ;

CALL carga_order();


--itens do pedido
DELIMITER $$

CREATE PROCEDURE carga_order_item()
BEGIN
  DECLARE i INT DEFAULT 1;
  DECLARE j INT;
  WHILE i <= 500 DO
    SET j = 1;
    WHILE j <= 3 DO
      INSERT INTO order_item (order_id, product_id, quantity, unit_price)
      VALUES (
        i,
        ((i + j) % 500) + 1,
        1 + (j % 5),
        100 + (j * 10)
      );
      SET j = j + 1;
    END WHILE;
    SET i = i + 1;
  END WHILE;
END$$

DELIMITER ;

CALL carga_order_item();


--forneced
DELIMITER $$

CREATE PROCEDURE carga_supplier()
BEGIN
  DECLARE i INT DEFAULT 1;
  WHILE i <= 500 DO
    INSERT INTO supplier (name, cnpj, email, phone, address_city, address_state)
    VALUES (
      CONCAT('Fornecedor ', i),
      LPAD(i, 14, '0'),
      CONCAT('fornecedor', i, '@mail.com'),
      CONCAT('(11)3', LPAD(i, 8, '0')),
      'São Paulo',
      'SP'
    );
    SET i = i + 1;
  END WHILE;
END$$

DELIMITER ;

CALL carga_supplier();


--categorias
DELIMITER $$

CREATE PROCEDURE carga_category()
BEGIN
  DECLARE i INT DEFAULT 1;
  WHILE i <= 500 DO
    INSERT INTO category (name, description, parent_category_id)
    VALUES (
      CONCAT('Categoria ', i),
      CONCAT('Descrição da categoria ', i),
      CASE WHEN i % 10 = 0 THEN NULL ELSE FLOOR(i/10) END
    );
    SET i = i + 1;
  END WHILE;
END$$

DELIMITER ;

CALL carga_category();

--Depositos

DELIMITER $$

CREATE PROCEDURE carga_warehouse()
BEGIN
  DECLARE i INT DEFAULT 1;
  WHILE i <= 500 DO
    INSERT INTO warehouse (name, address_city, address_state)
    VALUES (
      CONCAT('Depósito ', i),
      CASE WHEN i % 3 = 0 THEN 'Ribeirão Preto'
           WHEN i % 3 = 1 THEN 'Franca'
           ELSE 'Uberaba' END,
      CASE WHEN i % 3 = 2 THEN 'MG' ELSE 'SP' END
    );
    SET i = i + 1;
  END WHILE;
END$$

DELIMITER ;

CALL carga_warehouse();

--cartões fidelidade

DELIMITER $$

CREATE PROCEDURE carga_loyalty_card()
BEGIN
  DECLARE i INT DEFAULT 1;
  WHILE i <= 500 DO
    INSERT INTO loyalty_card (customer_id, code, points, tier)
    VALUES (
      i,
      CONCAT('CARD-', i),
      (i % 100) * 10,
      CASE WHEN i % 4 = 0 THEN 'bronze'
           WHEN i % 4 = 1 THEN 'silver'
           WHEN i % 4 = 2 THEN 'gold'
           ELSE 'platinum' END
    );
    SET i = i + 1;
  END WHILE;
END$$

DELIMITER ;

CALL carga_loyalty_card();

--pagamentos

DELIMITER $$

CREATE PROCEDURE carga_payment()
BEGIN
  DECLARE i INT DEFAULT 1;
  WHILE i <= 500 DO
    INSERT INTO payment (order_id, method, amount, status, paid_at)
    VALUES (
      i,
      CASE WHEN i % 4 = 0 THEN 'pix'
           WHEN i % 4 = 1 THEN 'credit_card'
           WHEN i % 4 = 2 THEN 'boleto'
           ELSE 'debit_card' END,
      100 + (i % 50),
      CASE WHEN i % 2 = 0 THEN 'paid' ELSE 'pending' END,
      NOW()
    );
    SET i = i + 1;
  END WHILE;
END$$

DELIMITER ;

CALL carga_payment();

--remessas

DELIMITER $$

CREATE PROCEDURE carga_shipment()
BEGIN
  DECLARE i INT DEFAULT 1;
  WHILE i <= 500 DO
    INSERT INTO shipment (order_id, carrier, tracking_code, shipped_at, delivered_at, status)
    VALUES (
      i,
      CASE WHEN i % 3 = 0 THEN 'Correios'
           WHEN i % 3 = 1 THEN 'Jadlog'
           ELSE 'Sequoia' END,
      CONCAT('TRK-', LPAD(i, 8, '0')),
      NOW(),
      CASE WHEN i % 5 = 0 THEN NOW() ELSE NULL END,
      CASE WHEN i % 5 = 0 THEN 'delivered'
           WHEN i % 5 = 1 THEN 'in_transit'
           ELSE 'ready' END
    );
    SET i = i + 1;
  END WHILE;
END$$

DELIMITER ;

CALL carga_shipment();

--