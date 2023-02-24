CREATE TABLE IF NOT EXISTS `mydb`.`customers` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `cst_name` VARCHAR(45) NOT NULL,
  `cst_firstname` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb`.`orders` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `amount` DECIMAL(6,2) NOT NULL,
  `customers_id` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_orders_customers_idx` (`customers_id` ASC),
  CONSTRAINT `fk_orders_customers`
    FOREIGN KEY (`customers_id`)
    REFERENCES `mydb`.`customers` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;