/****** EXERCÍCIO DE FIXAÇÃO 1b ******/

CREATE DATABASE locadora;

USE locadora;

CREATE TABLE veiculos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    placa CHAR(7) NOT NULL UNIQUE,
    modelo VARCHAR(50) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    categoria ENUM('básico', 'suv', 'luxo') NOT NULL,
    ano INT NOT NULL,
    cor VARCHAR(20) NOT NULL,
    quilometragem INT NOT NULL,
    diaria DECIMAL(10, 2) NOT NULL,
    disponivel BOOLEAN DEFAULT TRUE,
    tipo_combustivel VARCHAR(15) NOT NULL
);

/* Inserindo registros na tabela livro */
INSERT INTO veiculos (placa, modelo, marca, categoria, ano, cor, quilometragem, diaria, disponivel, tipo_combustivel) VALUES('ABC1234', 'Gol', 'Volkswagen', 'básico', 2020, 'Branco', 15000, 100.00, TRUE, 'gasolina');
INSERT INTO veiculos (placa, modelo, marca, categoria, ano, cor, quilometragem, diaria, disponivel, tipo_combustivel) VALUES('DEF5678', 'Onix', 'Chevrolet', 'básico', 2019, 'Prata', 20000, 110.00, TRUE, 'flex');
INSERT INTO veiculos (placa, modelo, marca, categoria, ano, cor, quilometragem, diaria, disponivel, tipo_combustivel) VALUES('GHI9012', 'HB20', 'Hyundai', 'básico', 2021, 'Preto', 10000, 120.00, TRUE, 'flex');
INSERT INTO veiculos (placa, modelo, marca, categoria, ano, cor, quilometragem, diaria, disponivel, tipo_combustivel) VALUES
('JKL3456', 'Ka', 'Ford', 'básico', 2018, 'Vermelho', 25000, 90.00, TRUE, 'gasolina');
INSERT INTO veiculos (placa, modelo, marca, categoria, ano, cor, quilometragem, diaria, disponivel, tipo_combustivel) VALUES
('MNO7890', 'Compass', 'Jeep', 'suv', 2020, 'Branco', 18000, 200.00, TRUE, 'flex');
INSERT INTO veiculos (placa, modelo, marca, categoria, ano, cor, quilometragem, diaria, disponivel, tipo_combustivel) VALUES
('PQR1234', 'CR-V', 'Honda', 'suv', 2019, 'Prata', 22000, 210.00, TRUE, 'gasolina');
INSERT INTO veiculos (placa, modelo, marca, categoria, ano, cor, quilometragem, diaria, disponivel, tipo_combustivel) VALUES('STU5678', 'Tiguan', 'Volkswagen', 'suv', 2021, 'Preto', 12000, 220.00, TRUE, 'flex');
INSERT INTO veiculos (placa, modelo, marca, categoria, ano, cor, quilometragem, diaria, disponivel, tipo_combustivel) VALUES('VWX9012', 'Renegade', 'Jeep', 'suv', 2018, 'Vermelho', 30000, 190.00, TRUE, 'flex');
INSERT INTO veiculos (placa, modelo, marca, categoria, ano, cor, quilometragem, diaria, disponivel, tipo_combustivel) VALUES('YZA3456', 'A3', 'Audi', 'luxo', 2020, 'Branco', 15000, 300.00, TRUE, 'gasolina');
INSERT INTO veiculos (placa, modelo, marca, categoria, ano, cor, quilometragem, diaria, disponivel, tipo_combustivel) VALUES('BCD7890', '320i', 'BMW', 'luxo', 2019, 'Prata', 20000, 310.00, TRUE, 'gasolina');
INSERT INTO veiculos (placa, modelo, marca, categoria, ano, cor, quilometragem, diaria, disponivel, tipo_combustivel) VALUES('CDE1234', 'C180', 'Mercedes-Benz', 'luxo', 2021, 'Preto', 10000, 320.00, TRUE, 'gasolina');
INSERT INTO veiculos (placa, modelo, marca, categoria, ano, cor, quilometragem, diaria, disponivel, tipo_combustivel) VALUES('DEF5678', 'A4', 'Audi', 'luxo', 2018, 'Vermelho', 25000, 290.00, TRUE, 'flex');
INSERT INTO veiculos (placa, modelo, marca, categoria, ano, cor, quilometragem, diaria, disponivel, tipo_combustivel) VALUES('EFG9012', 'Civic', 'Honda', 'básico', 2020, 'Branco', 15000, 100.00, TRUE, 'flex');
INSERT INTO veiculos (placa, modelo, marca, categoria, ano, cor, quilometragem, diaria, disponivel, tipo_combustivel) VALUES('FGH3456', 'Corolla', 'Toyota', 'básico', 2019, 'Prata', 20000, 110.00, TRUE, 'flex');
INSERT INTO veiculos (placa, modelo, marca, categoria, ano, cor, quilometragem, diaria, disponivel, tipo_combustivel) VALUES('GHI7890', 'Fit', 'Honda', 'básico', 2021, 'Preto', 10000, 120.00, TRUE, 'flex');
INSERT INTO veiculos (placa, modelo, marca, categoria, ano, cor, quilometragem, diaria, disponivel, tipo_combustivel) VALUES('HIJ1234', 'Yaris', 'Toyota', 'básico', 2018, 'Vermelho', 25000, 90.00, TRUE, 'gasolina');
INSERT INTO veiculos (placa, modelo, marca, categoria, ano, cor, quilometragem, diaria, disponivel, tipo_combustivel) VALUES('IJK5678', 'Tucson', 'Hyundai', 'suv', 2020, 'Branco', 18000, 200.00, TRUE, 'flex');
INSERT INTO veiculos (placa, modelo, marca, categoria, ano, cor, quilometragem, diaria, disponivel, tipo_combustivel) VALUES('JKL9012', 'Rav4', 'Toyota', 'suv', 2019, 'Prata', 22000, 210.00, TRUE, 'gasolina');
INSERT INTO veiculos (placa, modelo, marca, categoria, ano, cor, quilometragem, diaria, disponivel, tipo_combustivel) VALUES('KLM3456', 'Kicks', 'Nissan', 'suv', 2021, 'Preto', 12000, 220.00, TRUE, 'flex');
INSERT INTO veiculos (placa, modelo, marca, categoria, ano, cor, quilometragem, diaria, disponivel, tipo_combustivel) VALUES('LMN7890', 'Duster', 'Renault', 'suv', 2018, 'Vermelho', 30000, 190.00, TRUE, 'flex');
INSERT INTO veiculos (placa, modelo, marca, categoria, ano, cor, quilometragem, diaria, disponivel, tipo_combustivel) VALUES('MNO1234', 'Q3', 'Audi', 'luxo', 2020, 'Branco', 15000, 300.00, TRUE, 'gasolina');
INSERT INTO veiculos (placa, modelo, marca, categoria, ano, cor, quilometragem, diaria, disponivel, tipo_combustivel) VALUES('NOP5678', 'X1', 'BMW', 'luxo', 2019, 'Prata', 20000, 310.00, TRUE, 'gasolina');
INSERT INTO veiculos (placa, modelo, marca, categoria, ano, cor, quilometragem, diaria, disponivel, tipo_combustivel) VALUES('OPQ9012', 'GLA', 'Mercedes-Benz', 'luxo', 2021, 'Preto', 10000, 320.00, TRUE, 'gasolina');
INSERT INTO veiculos (placa, modelo, marca, categoria, ano, cor, quilometragem, diaria, disponivel, tipo_combustivel) VALUES('PQR3456', 'Q5', 'Audi', 'luxo', 2018, 'Vermelho', 25000, 290.00, TRUE, 'flex');
INSERT INTO veiculos (placa, modelo, marca, categoria, ano, cor, quilometragem, diaria, disponivel, tipo_combustivel) VALUES('QRS7890', 'Model S', 'Tesla', 'luxo', 2022, 'Branco', 5000, 400.00, TRUE, 'elétrico');
INSERT INTO veiculos (placa, modelo, marca, categoria, ano, cor, quilometragem, diaria, disponivel, tipo_combustivel) VALUES('RST1234', 'Model 3', 'Tesla', 'luxo', 2021, 'Preto', 10000, 350.00, TRUE, 'elétrico');
INSERT INTO veiculos (placa, modelo, marca, categoria, ano, cor, quilometragem, diaria, disponivel, tipo_combustivel) VALUES('STU5678', 'Toro', 'Fiat', 'suv', 2020, 'Branco', 18000, 200.00, TRUE, 'diesel');
INSERT INTO veiculos (placa, modelo, marca, categoria, ano, cor, quilometragem, diaria, disponivel, tipo_combustivel) VALUES('TUV9012', 'Hilux', 'Toyota', 'suv', 2019, 'Prata', 22000, 210.00, TRUE, 'diesel');
INSERT INTO veiculos (placa, modelo, marca, categoria, ano, cor, quilometragem, diaria, disponivel, tipo_combustivel) VALUES('UVW3456', 'S10', 'Chevrolet', 'suv', 2021, 'Preto', 12000, 220.00, TRUE, 'diesel');
INSERT INTO veiculos (placa, modelo, marca, categoria, ano, cor, quilometragem, diaria, disponivel, tipo_combustivel) VALUES('VWX7890', 'Ranger', 'Ford', 'suv', 2018, 'Vermelho', 30000, 190.00, TRUE, 'diesel');
INSERT INTO veiculos (placa, modelo, marca, categoria, ano, cor, quilometragem, diaria, disponivel, tipo_combustivel) VALUES('WXY1234', 'Fusca', 'Volkswagen', 'básico', 1970, 'Azul', 100000, 50.00, TRUE, 'gasolina');
INSERT INTO veiculos (placa, modelo, marca, categoria, ano, cor, quilometragem, diaria, disponivel, tipo_combustivel) VALUES('XYZ5678', 'Brasília', 'Volkswagen', 'básico', 1980, 'Amarelo', 80000, 60.00, TRUE, 'etanol');
INSERT INTO veiculos (placa, modelo, marca, categoria, ano, cor, quilometragem, diaria, disponivel, tipo_combustivel) VALUES('YZA9012', 'Chevette', 'Chevrolet', 'básico', 1985, 'Verde', 90000, 70.00, TRUE, 'gasolina');
INSERT INTO veiculos (placa, modelo, marca, categoria, ano, cor, quilometragem, diaria, disponivel, tipo_combustivel) VALUES('ZAB3456', 'Opala', 'Chevrolet', 'luxo', 1990, 'Preto', 70000, 150.00, TRUE, 'gasolina');
INSERT INTO veiculos (placa, modelo, marca, categoria, ano, cor, quilometragem, diaria, disponivel, tipo_combustivel) VALUES('ABC7890', 'Fusca', 'Volkswagen', 'básico', 1975, 'Vermelho', 95000, 55.00, TRUE, 'gasolina');
INSERT INTO veiculos (placa, modelo, marca, categoria, ano, cor, quilometragem, diaria, disponivel, tipo_combustivel) VALUES('BCD1234', 'Brasília', 'Volkswagen', 'básico', 1982, 'Branco', 85000, 65.00, TRUE, 'etanol');
INSERT INTO veiculos (placa, modelo, marca, categoria, ano, cor, quilometragem, diaria, disponivel, tipo_combustivel) VALUES('CDE5678', 'Chevette', 'Chevrolet', 'básico', 1987, 'Azul', 92000, 75.00, TRUE, 'gasolina');
INSERT INTO veiculos (placa, modelo, marca, categoria, ano, cor, quilometragem, diaria, disponivel, tipo_combustivel) VALUES('DEF9012', 'Opala', 'Chevrolet', 'luxo', 1992, 'Prata', 68000, 160.00, TRUE, 'gasolina');
INSERT INTO veiculos (placa, modelo, marca, categoria, ano, cor, quilometragem, diaria, disponivel, tipo_combustivel) VALUES('EFG3456', 'Fusca', 'Volkswagen', 'básico', 1978, 'Amarelo', 97000, 52.00, TRUE, 'gasolina');
INSERT INTO veiculos (placa, modelo, marca, categoria, ano, cor, quilometragem, diaria, disponivel, tipo_combustivel) VALUES('FGH7890', 'Brasília', 'Volkswagen', 'básico', 1983, 'Verde', 87000, 62.00, TRUE, 'etanol');
INSERT INTO veiculos (placa, modelo, marca, categoria, ano, cor, quilometragem, diaria, disponivel, tipo_combustivel) VALUES('GHI1234', 'Chevette', 'Chevrolet', 'básico', 1988, 'Preto', 93000, 72.00, TRUE, 'gasolina');
INSERT INTO veiculos (placa, modelo, marca, categoria, ano, cor, quilometragem, diaria, disponivel, tipo_combustivel) VALUES('HIJ5678', 'Opala', 'Chevrolet', 'luxo', 1993, 'Branco', 67000, 155.00, TRUE, 'gasolina');
INSERT INTO veiculos (placa, modelo, marca, categoria, ano, cor, quilometragem, diaria, disponivel, tipo_combustivel) VALUES('IJK9012', 'Fusca', 'Volkswagen', 'básico', 1979, 'Azul', 98000, 53.00, TRUE, 'gasolina');
INSERT INTO veiculos (placa, modelo, marca, categoria, ano, cor, quilometragem, diaria, disponivel, tipo_combustivel) VALUES('JKL3456', 'Brasília', 'Volkswagen', 'básico', 1984, 'Amarelo', 88000, 63.00, TRUE, 'etanol');
INSERT INTO veiculos (placa, modelo, marca, categoria, ano, cor, quilometragem, diaria, disponivel, tipo_combustivel) VALUES('KLM7890', 'Chevette', 'Chevrolet', 'básico', 1989, 'Verde', 94000, 73.00, TRUE, 'gasolina');
INSERT INTO veiculos (placa, modelo, marca, categoria, ano, cor, quilometragem, diaria, disponivel, tipo_combustivel) VALUES('LMN1234', 'Opala', 'Chevrolet', 'luxo', 1994, 'Preto', 66000, 150.00, TRUE, 'gasolina');
INSERT INTO veiculos (placa, modelo, marca, categoria, ano, cor, quilometragem, diaria, disponivel, tipo_combustivel) VALUES('MNO5678', 'Fusca', 'Volkswagen', 'básico', 1980, 'Vermelho', 99000, 54.00, TRUE, 'gasolina');
INSERT INTO veiculos (placa, modelo, marca, categoria, ano, cor, quilometragem, diaria, disponivel, tipo_combustivel) VALUES('NOP9012', 'Brasília', 'Volkswagen', 'básico', 1985, 'Branco', 89000, 64.00, TRUE, 'etanol');
INSERT INTO veiculos (placa, modelo, marca, categoria, ano, cor, quilometragem, diaria, disponivel, tipo_combustivel) VALUES('OPQ3456', 'Chevette', 'Chevrolet', 'básico', 1990, 'Azul', 95000, 74.00, TRUE, 'gasolina');
INSERT INTO veiculos (placa, modelo, marca, categoria, ano, cor, quilometragem, diaria, disponivel, tipo_combustivel) VALUES('PQR7890', 'Opala', 'Chevrolet', 'luxo', 1995, 'Prata', 65000, 160.00, TRUE, 'gasolina');


/* 1. Selecione o modelo e a marca dos veículos acima do ano 2000*/

/* 2. Selecione o modelo, a marca e a diária dos veículos da categoria suv, ordenados pelo preço da diária em ordem crescente */

/* 3. Selecione os veiculos que possuem quilometragem menor que 10000 e que são da marca Volkswagen */

/* 4. Selecione a categoria o modelo e a cor dos veículos que possuem diária entre 100 e 200 reais */

/* 5. Selecione o modelo, a marca e a cor dos veículos que possuem diária entre 100 e 200 reais e que são da categoria básico */

/* 6. Selecione o modelo, a marca dos veículos que seja suv, que possuem diária entre 100 e 200 reais e que possuem quilometragem menor que 20000 */

/* 7. Selecione o modelo, a marca e a cor dos veículos que possuem diária entre 100 e 200 reais e que são da categoria básico ou suv */

/* 8. Traga a quantidade de veículos por categoria */

/* 9. Selecione os veículos que não utilizam gasolina ou diesel */

/* 10. Selecione os veículos que possuem diária maior que 200 reais e que são da categoria luxo e que estão disponíveis */

/* 11. Selecione os veículos que possuem diária maior que 200 reais e que são da categoria luxo e que estão disponíveis e que possuem quilometragem menor que 20000 */

/* 12. Selecione os veículos da marca honda que possuem diária menor que 150 reais e que não são da categoria básico */

/* 13. Selecione os veículos que possuem diária menor que 150 reais e que não são da categoria básico e ordenar por marca e modelo */

/* 14. Selecione a kilometragem média dos veículos da categoria básico */

/* 15. Selecione o modelo e marca dos veículos com a kilometragem abaixo da média geral */

/* 16. Selecione o modelo e marca dos veículos com a kilometragem abaixo da média da sua categoria */

/* 17. Selecione o modelo e marca dos veículos com a kilometragem abaixo da média da sua categoria e que possuem diária menor que 150 reais */

/* 18. Selecione o modelo e marca dos veículos com a kilometragem abaixo da média da sua categoria e que possuem diária menor que 150 reais e que são da marca Volkswagen */

/* 19. Selecione o modelo e marca dos veículos com a diaŕia abaixo da média geral */

/* 20. Selecione o modelo e marca dos veículos com a diaŕia abaixo da média da sua categoria */