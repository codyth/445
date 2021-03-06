-- MySQL Script generated by MySQL Workbench
-- 06/03/14 16:02:55
-- Model: New Model    Version: 1.0
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema drinks
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `drinks` ;
CREATE SCHEMA IF NOT EXISTS `drinks` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `drinks` ;

-- -----------------------------------------------------
-- Table `drinks`.`User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `drinks`.`User` ;

CREATE TABLE IF NOT EXISTS `drinks`.`User` (
  `idUser` INT NOT NULL,
  `uName` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`idUser`))
ENGINE = InnoDB;

INSERT INTO User VALUES
(1, 'Cody'), (2, 'Greg'), (3, 'Scott'), (4, 'Bill');

-- -----------------------------------------------------
-- Table `drinks`.`Recipes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `drinks`.`Recipes` ;

CREATE TABLE IF NOT EXISTS `drinks`.`Recipes` (
  `idRecipies` INT NOT NULL,
  `drinkName` VARCHAR(45) NOT NULL,
  `mainAlcohol` VARCHAR(45) NOT NULL,
  `description` VARCHAR(300) NOT NULL,
  `category` VARCHAR(45) NOT NULL,
  `User_idUser` INT NOT NULL,
  PRIMARY KEY (`idRecipies`),
  INDEX `fk_Recipies_User1_idx` (`User_idUser` ASC),
  CONSTRAINT `fk_Recipies_User1`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `drinks`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO Recipes VALUES
(1, 'Jager Bomb', 'Jagermeister', 'Pour red bull into a medium sized glass. Add a shot glass 
of jagermeister, and enjoy', 'Shots and Shooters', 2), (2, 'Tropical Fix', 'Coconut Rum', 
'Shake ingredients in a cocktail shaker with ice. Strain into glass. Let a wedge of mango 
and lime, and a strawberry sit on a straw in the glass.', 'Cocktails', 4), (3, 'Long Island Ice Tea',
'Voldka', 'Mix ingredients together over ice in a glass. Pour into a shaker and give one brisk shake. 
Pour back into the glass and make sure there is a touch of fizz at the top. Garnish with lemon.',
'Cocktails', 2), (4, 'Mojito', 'White Rum', 'Place mint leaves in bottom of glass. Add crushed ice, 
White Rum, sugar, and lime juice, and muddle. Add soda water and garnish with mint leaves.', 'Cocktails', 1),
(5, 'Blue Hawaiian', 'White Rum', 'Blend light rum, blue curacao, pineapple juice, and cream of 
coconut with one cup ice in an electric blender at high speed. Pour contents into a highball 
glass. Decorate with the slice of pineapple and a cherry.', 'Blended Cocktails', 3);

-- -----------------------------------------------------
-- Table `drinks`.`Mixer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `drinks`.`Mixer` ;

CREATE TABLE IF NOT EXISTS `drinks`.`Mixer` (
  `idMixer` INT NOT NULL,
  `mixerName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idMixer`))
ENGINE = InnoDB;

INSERT INTO Mixer VALUES
(0, 'Empty'), (1, 'Red Bull'), (2, 'Cherry Cola'), (3, 'Sweet and Sour Mix'), (4, 'Coca Cola'), 
(5, 'Mint Leaves'), (6, 'Sugar'), (7, 'Lime Juice'), (8, 'Soda'), (9, 'Cherry'),
(10, 'Pineapple Juice'), (11, 'Cream of Coconut'), (12, 'Pineapple');
-- -----------------------------------------------------
-- Table `drinks`.`Alcohol`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `drinks`.`Alcohol` ;

CREATE TABLE IF NOT EXISTS `drinks`.`Alcohol` (
  `idAlcohol` INT NOT NULL,
  `alcoholName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAlcohol`))
ENGINE = InnoDB;

INSERT INTO Alcohol VALUES
(0, 'Empty'), (1, 'Voldka'), (2, 'White Rum'), (3, 'Dark Rum'), (4, 'Whiskey'), (5, 'Triple Sec'), 
(6, 'Peppermint Schnapps'), (7, 'Peach Schnapps'), (8, 'Jagermeister'),
(9, 'Blue Curacao'), (10, 'Gin'), (11, 'Coffee Liqueur'), (12, 'Tequilla'), 
(13, 'Coconut Rum');
-- -----------------------------------------------------
-- Table `drinks`.`Bar`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `drinks`.`Bar` ;

CREATE TABLE IF NOT EXISTS `drinks`.`Bar` (
  `idBar` INT NOT NULL,
  `location` VARCHAR(45) NULL,
  `User_idUser` INT NOT NULL,
  PRIMARY KEY (`idBar`, `User_idUser`),
  INDEX `fk_Bar_User1_idx` (`User_idUser` ASC),
  CONSTRAINT `fk_Bar_User1`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `drinks`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO Bar VALUES
(3001, 'Home', 1), (3002, 'Home', 2), (3003, 'Work', 2), (3004, 'Home', 3), (3005, 'Home', 4);
-- -----------------------------------------------------
-- Table `drinks`.`Ingredient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `drinks`.`Ingredient` ;

CREATE TABLE IF NOT EXISTS `drinks`.`Ingredient` (
  `quantity` DECIMAL(10,2) NOT NULL,
  `unit` VARCHAR(45) NOT NULL,
  `Recipies_idRecipies` INT NOT NULL,
  `Alcohol_idAlcohol` INT NOT NULL,
  `Mixer_idMixer` INT NOT NULL,
  INDEX `fk_Ingredient_Recipies1_idx` (`Recipies_idRecipies` ASC),
  PRIMARY KEY (`Recipies_idRecipies`, `Alcohol_idAlcohol`, `Mixer_idMixer`),
  INDEX `fk_Ingredient_Mixer1_idx` (`Mixer_idMixer` ASC),
  CONSTRAINT `fk_Ingredient_Recipies1`
    FOREIGN KEY (`Recipies_idRecipies`)
    REFERENCES `drinks`.`Recipes` (`idRecipies`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ingredient_Alcohol1`
    FOREIGN KEY (`Alcohol_idAlcohol`)
    REFERENCES `drinks`.`Alcohol` (`idAlcohol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ingredient_Mixer1`
    FOREIGN KEY (`Mixer_idMixer`)
    REFERENCES `drinks`.`Mixer` (`idMixer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO Ingredient VALUES
(200, 'Ounces', 1, 8, 0), (50, 'Can', 1, 0, 1), (200, 'Ounces', 2, 13, 0), (100, 'Ounces', 2, 9, 0),
(500, 'Ounces', 2, 0, 2), (100, 'Part', 3, 1, 0), (100, 'Part', 3, 12, 0), (100, 'Part', 3, 2, 0), 
(100, 'Part', 3, 10, 0), (100, 'Part', 3, 5, 0), (150, 'Part', 3, 0, 3), (100, 'Splash', 3, 0, 4),
(125, 'Ounces', 4, 2, 0), (1200, 'Whole', 4, 0, 5), (100, 'Tbsp', 4, 0, 6), (50, 'Ounces', 4, 0, 7),
(200, 'Ounces', 4, 0, 8), (100, 'Ounces', 5, 2, 0), (100, 'Ounces', 5, 9, 0), (100, 'Whole', 5, 0, 9),
(200, 'Ounces', 5, 0, 10), (100, 'Ounces', 5, 0, 11), (100, 'Slice', 5, 0, 12);

-- -----------------------------------------------------
-- Table `drinks`.`Bottle`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `drinks`.`Bottle` ;

CREATE TABLE IF NOT EXISTS `drinks`.`Bottle` (
  `botQuantity` DECIMAL(10,2) NOT NULL,
  `botUnit` VARCHAR(45) NOT NULL,
  `Bar_idBar` INT NOT NULL,
  `Alcohol_idAlcohol` INT NOT NULL,
  INDEX `fk_Bottle_Bar1_idx` (`Bar_idBar` ASC),
  PRIMARY KEY (`Alcohol_idAlcohol`, `Bar_idBar`),
  CONSTRAINT `fk_Bottle_Bar1`
    FOREIGN KEY (`Bar_idBar`)
    REFERENCES `drinks`.`Bar` (`idBar`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Bottle_Alcohol1`
    FOREIGN KEY (`Alcohol_idAlcohol`)
    REFERENCES `drinks`.`Alcohol` (`idAlcohol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO Bottle VALUES
(4000, 'Ounces', 3001, 1), (200, 'Liters', 3001, 2), (3000, 'Ounces', 3001, 4), (3500, 'Ounces', 3001, 6),
(175, 'Liters', 3001, 10), (100, 'Liters', 3001, 12), (100, 'Liters', 3001, 13), (1500, 'Ounces', 3001, 7),
(4000, 'Ounces', 3002, 2), (200, 'Liters', 3002, 1), (3000, 'Ounces', 3002, 12), (3500, 'Ounces', 3002, 8),
(175, 'Liters', 3002, 9), (100, 'Liters', 3002, 13), (100, 'Liters', 3002, 4), (1500, 'Ounces', 3002, 5),
(175, 'Liters', 3003, 9), (100, 'Liters', 3003, 13), (100, 'Liters', 3003, 4), (1500, 'Ounces', 3003, 5),
(4000, 'Ounces', 3004, 3), (200, 'Liters', 3004, 4), (3000, 'Ounces', 3004, 5), (3500, 'Ounces', 3004, 6),
(175, 'Liters', 3004, 7), (100, 'Liters', 3004, 8), (100, 'Liters', 3004, 9), (1500, 'Ounces', 3004, 12),
(4000, 'Ounces', 3005, 9), (200, 'Liters', 3005, 10), (3000, 'Ounces', 3005, 11), (3500, 'Ounces', 3005, 12),
(175, 'Liters', 3005, 13), (100, 'Liters', 3005, 1), (100, 'Liters', 3005, 2), (1500, 'Ounces', 3005, 3);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


SELECT * FROM recipes NATURAL JOIN alcohol
NATURAL JOIN bottle 
WHERE mainAlcohol = alcoholName 
AND idAlcohol = Alcohol_idAlcohol 
AND Bar_idBar = (SELECT idBar FROM bar WHERE User_idUser = 1);

SELECT * FROM recipes WHERE mainAlcohol = 
ANY(SELECT alcoholName FROM alcohol WHERE idAlcohol=
(SELECT Alcohol_idAlcohol FROM bottle WHERE Bar_idBar = 
(SELECT idBar FROM bar WHERE User_idUser = 1)))
