-- Verbundene Tabellen + Inserts

DROP DATABASE IF EXISTS mydb;
CREATE DATABASE IF NOT EXISTS mydb;

-- Servants: ohne Fremdschlüssel
CREATE TABLE IF NOT EXISTS `mydb`.`servants` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `servant_name` VARCHAR(45) NOT NULL,
  `yrs_served` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

DESCRIBE mydb.servants;

INSERT INTO `mydb`.`servants` (`id`, `servant_name`, `yrs_served`) VALUES (DEFAULT, "Patrick", 5);
INSERT INTO `mydb`.`servants` (`id`, `servant_name`, `yrs_served`) VALUES (DEFAULT, "Martin", 4);

SELECT * FROM mydb.servants;

-- Products: ohne Fremdschlüssel
CREATE TABLE IF NOT EXISTS `mydb`.`products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(45) NOT NULL,
  `product_price` DECIMAL(4,2) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

DESCRIBE mydb.products;

INSERT INTO `mydb`.`products` (`id`, `product_name`, `product_price`) VALUES (DEFAULT, "Whiskas|Lachs", 2.75);
INSERT INTO `mydb`.`products` (`id`, `product_name`, `product_price`) VALUES (DEFAULT, "Whiskas|Huhn", 2.80);
INSERT INTO `mydb`.`products` (`id`, `product_name`, `product_price`) VALUES (DEFAULT, "Felix|Jelly", 3.75);
INSERT INTO `mydb`.`products` (`id`, `product_name`, `product_price`) VALUES (DEFAULT, "Felix|Sauce", 3.80);

SELECT * FROM mydb.products;

-- Servants/Products
CREATE TABLE IF NOT EXISTS `mydb`.`purchases` (
  `servants_id` INT NOT NULL,
  `products_id` INT NOT NULL,
  PRIMARY KEY (`servants_id`, `products_id`),
  INDEX `fk_servants_has_products_products1_idx` (`products_id` ASC),
  INDEX `fk_servants_has_products_servants_idx` (`servants_id` ASC),
  CONSTRAINT `fk_servants_has_products_servants`
    FOREIGN KEY (`servants_id`)
    REFERENCES `mydb`.`servants` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servants_has_products_products1`
    FOREIGN KEY (`products_id`)
    REFERENCES `mydb`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

DESCRIBE mydb.purchases;

INSERT INTO `mydb`.`purchases` (`servants_id`, `products_id`) VALUES (1, 2);
INSERT INTO `mydb`.`purchases` (`servants_id`, `products_id`) VALUES (1, 3);
INSERT INTO `mydb`.`purchases` (`servants_id`, `products_id`) VALUES (2, 1);
INSERT INTO `mydb`.`purchases` (`servants_id`, `products_id`) VALUES (2, 2);
INSERT INTO `mydb`.`purchases` (`servants_id`, `products_id`) VALUES (2, 3);
INSERT INTO `mydb`.`purchases` (`servants_id`, `products_id`) VALUES (2, 4);

SELECT * FROM mydb.purchases;