  	--create database if not exists erp2;

use erp2;

drop table if exists orderdetails;
drop table if exists products;
drop table if exists customer_region;
drop table if exists customer_salespeople;
drop table if exists salespeoplephone;
drop table if exists customerspouse;
drop table if exists customerqualification;
drop table if exists customer_address;
drop table if exists customerphone;
drop table if exists salespeople;
drop table if exists region;
drop table if exists manufacturer;
drop table if exists orders;
drop table if exists `customer`;


CREATE TABLE `customer` (
  `id` INT NOT NULL,
  `firstName` VARCHAR(45) NULL,
  `lastName` VARCHAR(45) NULL,
  `dob` DATE NULL,
  `emailid` VARCHAR(128) NULL,
  PRIMARY KEY (`id`));


CREATE TABLE `customerphone` (
  `id` INT NOT NULL,
  `customerID` INT NULL,
  `number` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_phone_idx` (`customerID` ASC) VISIBLE,
  CONSTRAINT `fk_phone`
    FOREIGN KEY (`customerID`)
    REFERENCES `customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);




CREATE TABLE `customer_address` (
  `id` INT NOT NULL,
  `CustomerID` INT NULL,
  `address` VARCHAR(245) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_address_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `fk_address`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE TABLE `customerqualification` (
  `id` INT NOT NULL,
  `customerId` INT NULL,
  `name` VARCHAR(145) NULL,
  `college` VARCHAR(145) NULL,
  `university` VARCHAR(145) NULL,
  `marks` INT NULL,
  `year` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_qualification_idx` (`customerId` ASC) VISIBLE,
  CONSTRAINT `fk_qualification`
    FOREIGN KEY (`customerId`)
    REFERENCES `customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



CREATE TABLE `customerspouse` (
  `id` INT NOT NULL,
  `customerID` INT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_spouse_idx` (`customerID` ASC) VISIBLE,
  CONSTRAINT `fk_spouse`
    FOREIGN KEY (`customerID`)
    REFERENCES `customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE TABLE `salespeople` (
  `id` INT NOT NULL,
  `firstName` VARCHAR(45) NULL,
  `lastName` VARCHAR(45) NULL,
  `dob` DATE NULL,
  `emailid` VARCHAR(145) NULL,
  PRIMARY KEY (`id`));


CREATE TABLE `salespeoplephone` (
  `id` INT NOT NULL,
  `salespeopleID` INT NULL,
  `number` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_sales_phone_idx` (`salespeopleID` ASC) VISIBLE,
  CONSTRAINT `fk_sales_phone`
    FOREIGN KEY (`salespeopleID`)
    REFERENCES `salespeople` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



CREATE TABLE `customer_salespeople` (
  `id` INT NOT NULL,
  `customerID` INT NULL,
  `salespeopleID` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fn_cust_idx` (`customerID` ASC) VISIBLE,
  INDEX `fk_sales_idx` (`salespeopleID` ASC) VISIBLE,
  CONSTRAINT `fk_cust`
    FOREIGN KEY (`customerID`)
    REFERENCES `customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sales`
    FOREIGN KEY (`salespeopleID`)
    REFERENCES `salespeople` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



CREATE TABLE `region` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));


CREATE TABLE `customer_region` (
  `id` INT NOT NULL,
  `customerID` INT NULL,
  `regionID` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cust_id_idx` (`customerID` ASC) VISIBLE,
  INDEX `fk_resion_id_idx` (`regionID` ASC) VISIBLE,
  CONSTRAINT `fk_cust_id`
    FOREIGN KEY (`customerID`)
    REFERENCES `customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_resion_id`
    FOREIGN KEY (`regionID`)
    REFERENCES `region` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE TABLE `manufacturer` (
  `id` INT NOT NULL,
  `name` VARCHAR(145) NULL,
  PRIMARY KEY (`id`));



CREATE TABLE `products` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `manufacuterID` INT NULL,
  `rate` INT NULL,
  `discountper` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_manuId_idx` (`manufacuterID` ASC) VISIBLE,
  CONSTRAINT `fk_manuId`
    FOREIGN KEY (`manufacuterID`)
    REFERENCES `manufacturer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



CREATE TABLE `orders` (
  `id` INT NOT NULL,
  `customerID` INT NULL,
  `odate` DATE NULL,
  `amount` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ord_idx` (`customerID` ASC) VISIBLE,
  CONSTRAINT `fk_ord`
    FOREIGN KEY (`customerID`)
    REFERENCES `customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);




CREATE TABLE `orderdetails` (
  `id` INT NOT NULL,
  `orderID` INT NULL,
  `productID` INT NULL,
  `qty` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_oid_idx` (`orderID` ASC) VISIBLE,
  INDEX `fk_product_idx` (`productID` ASC) VISIBLE,
  CONSTRAINT `fk_oid`
    FOREIGN KEY (`orderID`)
    REFERENCES `orders` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product`
    FOREIGN KEY (`productID`)
    REFERENCES `products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-------------------------------

INSERT INTO `customer` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('1', 'Darpan', 'Ahluwalia', '1964-06-12', 'darpan.ahluwalia@gmail.com');
INSERT INTO `customer` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('2', 'Seema', 'Suri', '1964-10-25', 'seema.suri@gmail.com');
INSERT INTO `customer` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('3', 'Krishna', 'Shukla', '1964-10-25', 'krishna.shukla@gmail.com');
INSERT INTO `customer` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('4', 'Sohail', 'Anthony', '1965-10-31', 'sohail.anthony@gmail.com');
INSERT INTO `customer` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('5', 'Chandni', 'Sunder', '1965-01-12', 'chandni.sunder@gmail.com');
INSERT INTO `customer` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('6', 'Krishna', 'Bir', '1965-12-01', 'krishna.bir@gmail.com');
INSERT INTO `customer` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('7', 'Raju', 'Pandey', '1960-12-14', 'raju.pandey@gmail.com');
INSERT INTO `customer` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('8', 'Nancy', 'Dave', '1960-12-29', 'nancy.dave@gmail.com');
INSERT INTO `customer` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('9', 'Umesh', 'Nair', '1982-10-26', 'umesh.nair@gmail.com');
INSERT INTO `customer` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('10', 'Animesh', 'Ray', '1983-10-26', 'animesh.ray@gmail.com');
INSERT INTO `customer` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('11', 'Chitra', 'Subramanian', '1984-10-30', 'chitra.subramanian@gmail.com');
INSERT INTO `customer` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('12', 'Kasturi', 'Brar', '1984-11-30', 'kasturi.brar@gmail.com');
INSERT INTO `customer` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('13', 'Peter', 'Ramroop', '1985-12-01', 'peter.ramroop@gmail.com');
INSERT INTO `customer` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('14', 'Hetan', 'Shroff', '1986-12-15', 'hetan.shroff@gmail.com');
INSERT INTO `customer` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('15', 'Vicky', 'Inani', '1987-12-30', 'vicky.inani@gmail.com');
INSERT INTO `customer` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('16', 'Neela', 'Sabharwal', '1965-12-01', 'neela.sabharwal@gmail.com');
INSERT INTO `customer` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('17', 'Chitranjan', 'Mahal', '1982-10-26', 'chitranjan.mahal@gmail.com');
INSERT INTO `customer` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('18', 'Mohit', 'Pillay', '1964-06-12', 'mohit.pillay@gmail.com');
INSERT INTO `customer` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('19', 'Bhaagyasree', 'Bains', '1963-11-13', 'bhaagyasree.bains@gmail.com');
INSERT INTO `customer` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('20', 'Amrit', 'Banerjee', '1962-07-30', 'amrit.banerjee@gmail.com');
INSERT INTO `customer` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('21', 'Farah', 'Menon', '1964-06-12', 'farah.menon@gmail.com');
INSERT INTO `customer` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('22', 'Aarushi', 'Dugal', '1964-10-25', 'aarushi.dugal@gmail.com');
INSERT INTO `customer` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('23', 'Ricky', 'Subramaniam', '1964-10-25', 'ricky.subramaniam@gmail.com');
INSERT INTO `customer` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('24', 'Nikita', 'Grewal', '1965-10-31', 'nikita.grewal@gmail.com');
INSERT INTO `customer` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('25', 'Sukriti', 'Virk', '1965-01-12', 'sukriti.virk@gmail.com');
INSERT INTO `customer` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('26', 'Dhiraj', 'Ramachandran', '1965-12-01', 'dhiraj.ramachandran@gmail.com');
INSERT INTO `customer` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('27', 'Gayatri', 'Thakkar', '1960-12-14', 'gayatri.thakkar@gmail.com');
INSERT INTO `customer` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('28', 'Afreen', 'Iyer', '1960-12-29', 'afreen.iyer@gmail.com');
INSERT INTO `customer` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('29', 'Hetan', 'Ganesan', '1982-10-26', 'hetan.ganesan@gmail.com');
INSERT INTO `customer` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('30', 'Nancy', 'Dubey', '1983-10-26', 'nancy.dubey@gmail.com');
INSERT INTO `customer` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('31', 'Payal', 'Seshadri', '1984-10-30', 'payal.seshadri@gmail.com');
INSERT INTO `customer` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('32', 'Chameli', 'Padmanabhan', '1984-11-30', 'chameli.padmanabhan@gmail.com');
INSERT INTO `customer` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('33', 'Supriya', 'Dani', '1985-12-01', 'supriya.dani@gmail.com');
INSERT INTO `customer` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('34', 'Labeen', 'Nayar', '1986-12-15', 'labeen.nayar@gmail.com');
INSERT INTO `customer` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('35', 'Akhil', 'Pingle', '1987-12-30', 'akhil.pingle@gmail.com');
INSERT INTO `customer` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('36', 'Manoj', 'Goswami', '1965-12-01', 'manoj.goswami@gmail.com');
INSERT INTO `customer` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('37', 'Vijayent', 'Soni', '1982-10-26', 'vijayent.soni@gmail.com');
INSERT INTO `customer` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('38', 'Bhanupriya', 'Biyani', '1964-06-12', 'bhanupriya.biyani@gmail.com');
INSERT INTO `customer` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('39', 'Jyoti', 'Chaudhuri', '1963-11-13', 'jyoti.chaudhuri@gmail.com');
INSERT INTO `customer` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('40', 'Madhavi', 'Bhavsar', '1962-07-30', 'madhavi.bhavsar@gmail.com');
INSERT INTO `customer` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('41', 'Hetan', 'Natt', '1982-10-26', 'hetan.natt@gmail.com');
INSERT INTO `customer` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('42', 'Parveen', 'Upadhyay', '1983-10-26', 'parveen.upadhyay@gmail.com');
INSERT INTO `customer` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('43', 'Kirti', 'Wable', '1984-10-30', 'kirti.wable@gmail.com');
INSERT INTO `customer` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('44', 'Astha', 'Nori', '1984-11-30', 'astha.nori@gmail.com');
INSERT INTO `customer` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('45', 'Kajal', 'Somani', '1985-12-01', 'kajal.somani@gmail.com');
INSERT INTO `customer` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('46', 'Riddhi', 'Kale', '1986-12-15', 'riddhi.kale@gmail.com');
INSERT INTO `customer` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('47', 'Maya', 'Tara', '1987-12-30', 'maya.tara@gmail.com');
INSERT INTO `customer` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('48', 'Subhash', 'Nigam', '1965-12-01', 'subhash.nigam@gmail.com');
INSERT INTO `customer` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('49', 'Upasana', 'Kabra', '1960-12-14', 'upasana.kabra@gmail.com');
INSERT INTO `customer` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('50', 'Omar', 'Kota', '1960-12-14', 'omar.kota@gmail.com');




INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('1', '35', '9844705600');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('2', '43', '9844708411');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('3', '2', '9844707938');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('4', '28', '9844703946');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('5', '33', '9844702922');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('6', '11', '9844703043');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('7', '10', '9844707433');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('8', '18', '9844700567');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('9', '6', '9844706020');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('10', '19', '9844709985');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('11', '13', '9844705448');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('12', '2', '9844706588');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('13', '13', '9844702642');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('14', '28', '9844700308');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('15', '6', '9844702371');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('16', '16', '9844701624');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('17', '7', '9844709661');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('18', '12', '9844706708');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('19', '46', '9844708483');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('20', '36', '9844703249');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('21', '22', '9844700738');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('22', '1', '9844700014');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('23', '49', '9844709783');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('24', '30', '9844703744');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('25', '45', '9844704563');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('26', '45', '9844700650');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('27', '31', '9844701992');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('28', '22', '9844708509');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('29', '10', '9844703729');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('30', '26', '9844700658');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('31', '31', '9844708254');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('32', '26', '9844706873');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('33', '35', '9844706759');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('34', '32', '9844705188');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('35', '5', '9844707624');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('36', '1', '9844706380');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('37', '34', '9844708127');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('38', '25', '9844709663');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('39', '47', '9844705395');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('40', '46', '9844708576');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('41', '39', '9844703191');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('42', '17', '9844701850');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('43', '5', '9844709087');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('44', '19', '9844706792');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('45', '25', '9844706549');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('46', '47', '9844702282');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('47', '31', '9844701253');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('48', '50', '9844704403');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('49', '22', '9844701695');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('50', '38', '9844707304');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('51', '30', '9844708836');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('52', '32', '9844706996');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('53', '10', '9844700383');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('54', '4', '9844708711');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('55', '47', '9844702477');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('56', '46', '9844704471');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('57', '30', '9844701734');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('58', '37', '9844700108');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('59', '47', '9844709049');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('60', '6', '9844701148');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('61', '10', '9844701804');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('62', '20', '9844707880');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('63', '6', '9844704054');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('64', '14', '9844708464');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('65', '43', '9844707988');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('66', '19', '9844705328');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('67', '9', '9844704233');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('68', '15', '9844709151');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('69', '35', '9844709665');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('70', '50', '9844700042');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('71', '28', '9844708928');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('72', '21', '9844705685');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('73', '21', '9844709551');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('74', '37', '9844705833');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('75', '26', '9844702977');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('76', '13', '9844705740');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('77', '22', '9844701545');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('78', '18', '9844709037');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('79', '40', '9844705853');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('80', '44', '9844707143');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('81', '1', '9844703311');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('82', '11', '9844701043');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('83', '11', '9844708887');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('84', '35', '9844706998');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('85', '27', '9844704960');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('86', '28', '9844706097');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('87', '18', '9844704331');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('88', '23', '9844709642');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('89', '16', '9844700543');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('90', '32', '9844709957');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('91', '41', '9844705641');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('92', '46', '9844702135');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('93', '9', '9844707460');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('94', '35', '9844702786');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('95', '18', '9844706526');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('96', '19', '9844709564');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('97', '10', '9844709545');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('98', '47', '9844709803');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('99', '2', '9844704659');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('100', '43', '9844706828');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('101', '38', '9844700382');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('102', '41', '9844709498');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('103', '21', '9844706498');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('104', '40', '9844709880');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('105', '48', '9844709826');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('106', '5', '9844700803');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('107', '37', '9844706540');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('108', '33', '9844707526');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('109', '30', '9844703918');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('110', '31', '9844702728');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('111', '44', '9844706960');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('112', '23', '9844709970');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('113', '36', '9844700536');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('114', '22', '9844702982');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('115', '25', '9844701739');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('116', '30', '9844704103');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('117', '32', '9844707278');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('118', '6', '9844702723');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('119', '33', '9844704774');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('120', '49', '9844708230');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('121', '25', '9844705530');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('122', '23', '9844704838');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('123', '18', '9844704092');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('124', '24', '9844708407');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('125', '50', '9844701857');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('126', '24', '9844705994');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('127', '38', '9844705730');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('128', '2', '9844701425');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('129', '23', '9844704137');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('130', '23', '9844705795');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('131', '40', '9844701594');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('132', '27', '9844709227');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('133', '17', '9844702081');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('134', '10', '9844700997');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('135', '5', '9844703203');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('136', '35', '9844705366');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('137', '29', '9844708540');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('138', '29', '9844700813');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('139', '14', '9844705224');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('140', '11', '9844702413');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('141', '12', '9844708700');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('142', '11', '9844708547');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('143', '35', '9844705338');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('144', '16', '9844700795');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('145', '15', '9844704467');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('146', '21', '9844709295');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('147', '6', '9844702602');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('148', '27', '9844706684');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('149', '12', '9844704072');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('150', '46', '9844703121');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('151', '27', '9844706214');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('152', '14', '9844702879');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('153', '11', '9844701129');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('154', '22', '9844707297');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('155', '46', '9844709549');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('156', '35', '9844701312');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('157', '9', '9844701546');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('158', '26', '9844701075');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('159', '47', '9844700033');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('160', '4', '9844704692');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('161', '21', '9844701547');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('162', '10', '9844702314');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('163', '17', '9844700303');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('164', '47', '9844705383');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('165', '48', '9844708041');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('166', '2', '9844706854');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('167', '26', '9844707130');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('168', '17', '9844705880');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('169', '32', '9844707985');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('170', '32', '9844702388');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('171', '14', '9844701755');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('172', '20', '9844706672');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('173', '1', '9844704898');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('174', '34', '9844707020');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('175', '15', '9844709668');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('176', '22', '9844704371');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('177', '28', '9844702536');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('178', '7', '9844701980');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('179', '19', '9844708500');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('180', '33', '9844702857');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('181', '36', '9844705760');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('182', '45', '9844708661');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('183', '43', '9844700276');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('184', '6', '9844707717');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('185', '38', '9844704128');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('186', '21', '9844709878');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('187', '10', '9844709779');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('188', '49', '9844701892');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('189', '16', '9844700260');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('190', '12', '9844709697');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('191', '21', '9844703584');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('192', '26', '9844709091');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('193', '23', '9844708114');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('194', '25', '9844703213');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('195', '48', '9844705154');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('196', '45', '9844707728');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('197', '3', '9844701122');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('198', '43', '9844701505');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('199', '24', '9844707545');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('200', '21', '9844701560');
INSERT INTO `customerphone` (`id`, `customerID`, `number`) VALUES ('201', '24', '9844709176');




INSERT INTO `customer_address` (`id`, `CustomerID`, `address`) VALUES ('1', '1', '13758 Dogwood, St, Trona, CA, Los Angeles, 93562');
INSERT INTO `customer_address` (`id`, `CustomerID`, `address`) VALUES ('2', '2', '2263 Ga 17 Hwy N, Millen, GA, Atlanta, 30442');
INSERT INTO `customer_address` (`id`, `CustomerID`, `address`) VALUES ('3', '3', '409 Berry St, Louisa, KY, San Jose, 41230');
INSERT INTO `customer_address` (`id`, `CustomerID`, `address`) VALUES ('4', '4', '7720 Covington Rd, Pink Stand, TN, San Francisco, 37188');
INSERT INTO `customer_address` (`id`, `CustomerID`, `address`) VALUES ('5', '5', '15 Hempstead, St, Saugus, MA, Las Vega, 1906');
INSERT INTO `customer_address` (`id`, `CustomerID`, `address`) VALUES ('6', '6', '165 Village Dr., P.O. Box 3700, Oakland, TN, Oakland, 38060');
INSERT INTO `customer_address` (`id`, `CustomerID`, `address`) VALUES ('7', '7', 'Po Box 83, Faith, NC, New Jersey, 28041');
INSERT INTO `customer_address` (`id`, `CustomerID`, `address`) VALUES ('8', '8', '3402 Buccaneer Rose Ave, Bakersfield, CA, Boston, 93313');
INSERT INTO `customer_address` (`id`, `CustomerID`, `address`) VALUES ('9', '9', '1615 Town Hall   , Oakland, TN, Oakland, 38060');
INSERT INTO `customer_address` (`id`, `CustomerID`, `address`) VALUES ('10', '10', '7710 Covington Rd , New State Road, New York, 37188');
INSERT INTO `customer_address` (`id`, `CustomerID`, `address`) VALUES ('11', '11', '15 Hempstead St, Saugus, MA, Boston, 1906');
INSERT INTO `customer_address` (`id`, `CustomerID`, `address`) VALUES ('12', '12', '165 Ken city, P.O. Box 942873, 50 Higuera Street, Oakland, 38060');
INSERT INTO `customer_address` (`id`, `CustomerID`, `address`) VALUES ('13', '13', 'Po Box 83, Faith, NC, null, New York, 28041');
INSERT INTO `customer_address` (`id`, `CustomerID`, `address`) VALUES ('14', '14', '808 Rocky Hill Rd, Plymouth 1993 Cross lane, Boston, 32360');
INSERT INTO `customer_address` (`id`, `CustomerID`, `address`) VALUES ('15', '15', '118 Lippitt Ave Warwick, 100 S. Main Street, Los Angeles, 12889');
INSERT INTO `customer_address` (`id`, `CustomerID`, `address`) VALUES ('16', '16', '5973 Moon Shadow Dr. Herriman, null, Atlanta, 2345');
INSERT INTO `customer_address` (`id`, `CustomerID`, `address`) VALUES ('17', '17', '13758 Dogwood St, Trona, null, San Jose, 93562');
INSERT INTO `customer_address` (`id`, `CustomerID`, `address`) VALUES ('18', '18', '2263 Ga 17 Hwy N, Millen, null, Las Vega, 30442');
INSERT INTO `customer_address` (`id`, `CustomerID`, `address`) VALUES ('19', '19', '321/vimal park, karve road, pune, 411038');
INSERT INTO `customer_address` (`id`, `CustomerID`, `address`) VALUES ('20', '20', 'Prashant Society, Kothrud, pune, 411038');
INSERT INTO `customer_address` (`id`, `CustomerID`, `address`) VALUES ('21', '21', '7982 E. Summer St. Battle Ground, WA 98604');
INSERT INTO `customer_address` (`id`, `CustomerID`, `address`) VALUES ('22', '22', '2 Glen Eagles St. Freeport, NY 11520');
INSERT INTO `customer_address` (`id`, `CustomerID`, `address`) VALUES ('23', '23', '9062 Shady Street Chattanooga, TN 37421');
INSERT INTO `customer_address` (`id`, `CustomerID`, `address`) VALUES ('24', '24', '802 Bishop Ave. Hendersonville, NC 28792');
INSERT INTO `customer_address` (`id`, `CustomerID`, `address`) VALUES ('25', '25', '37 South Shore Lane North Attleboro, MA 02760');
INSERT INTO `customer_address` (`id`, `CustomerID`, `address`) VALUES ('26', '26', '7 Willow Road Clementon, NJ 08021');
INSERT INTO `customer_address` (`id`, `CustomerID`, `address`) VALUES ('27', '27', '7099 Leatherwood Ave. Moncks Corner, SC 29461');
INSERT INTO `customer_address` (`id`, `CustomerID`, `address`) VALUES ('28', '28', '282 E. Marshall St. Bettendorf, IA 52722');
INSERT INTO `customer_address` (`id`, `CustomerID`, `address`) VALUES ('29', '29', '28 E. Kent St. Jonesboro, GA 30236');
INSERT INTO `customer_address` (`id`, `CustomerID`, `address`) VALUES ('30', '30', '9834 Sunnyslope Lane Maineville, OH 45039');
INSERT INTO `customer_address` (`id`, `CustomerID`, `address`) VALUES ('31', '31', '9348 Greenrose Street Seymour, IN 47274');
INSERT INTO `customer_address` (`id`, `CustomerID`, `address`) VALUES ('32', '32', '13 Windfall St. Pueblo, CO 81001');
INSERT INTO `customer_address` (`id`, `CustomerID`, `address`) VALUES ('33', '33', '845 Selby Street Hilliard, OH 43026');
INSERT INTO `customer_address` (`id`, `CustomerID`, `address`) VALUES ('34', '34', '9124 Thorne Drive Plattsburgh, NY 12901');
INSERT INTO `customer_address` (`id`, `CustomerID`, `address`) VALUES ('35', '35', '8780 Philmont Ave. West Deptford, NJ 08096');
INSERT INTO `customer_address` (`id`, `CustomerID`, `address`) VALUES ('36', '36', '28 East Manhattan Drive Miami Gardens, FL 33056');
INSERT INTO `customer_address` (`id`, `CustomerID`, `address`) VALUES ('37', '37', '7 Greenview St. Fairborn, OH 45324');
INSERT INTO `customer_address` (`id`, `CustomerID`, `address`) VALUES ('38', '38', '8191 Manhattan Rd. Clinton, MD 20735');
INSERT INTO `customer_address` (`id`, `CustomerID`, `address`) VALUES ('39', '39', '3 Nichols Dr. Medina, OH 44256');
INSERT INTO `customer_address` (`id`, `CustomerID`, `address`) VALUES ('40', '40', '853 Rock Creek Drive Albany, NY 12203');
INSERT INTO `customer_address` (`id`, `CustomerID`, `address`) VALUES ('41', '41', '68 Edgefield Ave. Baton Rouge, LA 70806');
INSERT INTO `customer_address` (`id`, `CustomerID`, `address`) VALUES ('42', '42', '186 Glenwood St.Park Forest, IL 60466');
INSERT INTO `customer_address` (`id`, `CustomerID`, `address`) VALUES ('43', '43', '19 Cottage Ave.Vicksburg, MS 39180');
INSERT INTO `customer_address` (`id`, `CustomerID`, `address`) VALUES ('44', '44', '811 East Howard Dr.Longwood, FL 32779');
INSERT INTO `customer_address` (`id`, `CustomerID`, `address`) VALUES ('45', '45', '604 S. Manchester Ave.Fresh Meadows, NY 11365');
INSERT INTO `customer_address` (`id`, `CustomerID`, `address`) VALUES ('46', '46', '398 Lilac Court Elk Grove Village, IL 60007');
INSERT INTO `customer_address` (`id`, `CustomerID`, `address`) VALUES ('47', '47', '9514 Glenlake Avenue Hopewell, VA 23860');
INSERT INTO `customer_address` (`id`, `CustomerID`, `address`) VALUES ('48', '48', '305 Courtland Road Acworth, GA 30101');
INSERT INTO `customer_address` (`id`, `CustomerID`, `address`) VALUES ('49', '49', '643 Beaver Ridge Lane Woodside, NY 11377');
INSERT INTO `customer_address` (`id`, `CustomerID`, `address`) VALUES ('50', '50', '431 Cedarwood Drive Colonial Heights, VA 23834');




INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('1', '1', '10', 'Alabama', 'Stanford University', '67', '2012');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('2', '1', '12', 'Alaska', 'Harvard University', '74', '2014');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('3', '1', 'BE', 'Arizona', 'Harvard University', '68', '2018');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('4', '2', '10', 'Alaska', 'University of Chicago', '68', '2013');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('5', '2', '12', 'New York', 'Yale University', '56', '2015');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('6', '2', 'B.Com', 'Arkansas', 'Yale University', '64', '2019');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('7', '3', '10', 'Arizona', 'Yale University', '75', '2011');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('8', '3', '12', 'California', 'California University', '86', '2013');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('9', '3', 'BE', 'Florida', 'University of Florida', '67', '2017');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('10', '4', '10', 'Idaho', 'Pennsylvania University', '58', '2010');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('11', '4', '12', 'New Hampshire', 'Yale University', '97', '2012');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('12', '4', 'M.Com.', 'Montana', 'Columbia University', '77', '2016');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('13', '5', '10', 'Alabama', 'Yale University', '56', '2008');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('14', '5', '12', 'Michigan', 'University of Michigan', '57', '2010');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('15', '5', 'M.Com.', 'Oklahoma', 'Stanford University', '86', '2014');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('16', '6', '10', 'Mississippi', 'Harvard University', '56', '2009');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('17', '6', '12', 'Alabama', 'Harvard University', '76', '2011');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('18', '6', 'BE', 'Indiana', 'University of Chicago', '87', '2015');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('19', '7', '10', 'Ohio', 'University of Ohio', '87', '2011');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('20', '7', '12', 'Iowa', 'Stanford University', '78', '2013');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('21', '7', 'BE', 'Kentucky', 'Harvard University', '97', '2017');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('22', '8', '10', 'Maryland', 'University Maryland', '56', '2010');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('23', '8', '12', 'Alabama', 'California University', '467', '2012');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('24', '8', 'M.Com.', 'Virginia', 'University of Florida', '87', '2016');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('25', '9', '10', 'Maine', 'Pennsylvania University', '98', '2012');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('26', '9', '12', 'Vermont', 'Yale University', '67', '2014');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('27', '9', 'BE', 'Kansas', 'Columbia University', '87', '2018');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('28', '10', '10', 'Texas', 'Yale University', '65', '2012');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('29', '10', '12', 'Oregon', 'University of Michigan', '76', '2014');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('30', '10', 'M.Com.', 'New Mexico', 'California University', '61', '2018');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('31', '11', '10', 'Nevada', 'University of Florida', '62', '2011');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('32', '11', '12', 'Indiana', 'Pennsylvania University', '63', '2013');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('33', '11', 'M.Com.', 'Ohio', 'University of Ohio', '56', '2017');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('34', '12', '10', 'New Hampshire', 'Yale University', '75', '2010');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('35', '12', '12', 'Montana', 'Stanford University', '45', '2012');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('36', '12', 'B.Com.', 'West Virginia', 'Harvard University', '50', '2016');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('37', '13', '10', 'Virginia', 'Harvard University', '67', '2012');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('38', '13', '12', 'Maine', 'University of Chicago', '78', '2014');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('39', '13', 'BE', 'Texas', 'University of Florida', '68', '2018');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('40', '14', '10', 'Oregon', 'University of Florida', '67', '2013');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('41', '14', '12', 'Florida', 'University of Florida', '87', '2015');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('42', '14', 'BE', 'Idaho', 'Yale University', '57', '2019');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('43', '15', '10', 'New Hampshire', 'California University', '96', '2011');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('44', '15', '12', 'Montana', 'University of Florida', '56', '2013');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('45', '15', 'BE', 'Alabama', 'Pennsylvania University', '65', '2017');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('46', '16', '10', 'Michigan', 'University of Michigan', '76', '2012');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('47', '16', '12', 'Oklahoma', 'Columbia University', '56', '2014');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('48', '16', 'BE', 'Mississippi', 'University of Michigan', '76', '2018');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('49', '17', '10', 'Alabama', 'University of Michigan', '88', '2013');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('50', '17', '12', 'Indiana', 'University of Michigan', '76', '2015');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('51', '17', 'BE', 'Ohio', 'University of Ohio', '68', '2019');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('52', '18', '10', 'Iowa', 'Stanford University', '86', '2011');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('53', '18', '12', 'Kentucky', 'Harvard University', '57', '2013');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('54', '18', 'BE', 'Maryland', 'Harvard University', '75', '2017');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('55', '19', '10', 'Alabama', 'University of Chicago', '69', '2013');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('56', '19', '12', 'Virginia', 'California University', '60', '2015');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('57', '19', 'BE', 'Maine', 'University of Florida', '61', '2019');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('58', '20', '10', 'Vermont', 'Pennsylvania University', '72', '2013');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('59', '20', '12', 'Iowa', 'Yale University', '83', '2015');
INSERT INTO `customerqualification` (`id`, `customerId`, `name`, `college`, `university`, `marks`, `year`) VALUES ('60', '20', 'BE', 'Maryland', 'Columbia University', '72', '2019');



INSERT INTO `customerspouse` (`id`, `customerID`, `name`) VALUES ('1', '1', 'marry');
INSERT INTO `customerspouse` (`id`, `customerID`, `name`) VALUES ('2', '2', 'jones');
INSERT INTO `customerspouse` (`id`, `customerID`, `name`) VALUES ('3', '3', 'leesa');
INSERT INTO `customerspouse` (`id`, `customerID`, `name`) VALUES ('4', '4', 'ket');
INSERT INTO `customerspouse` (`id`, `customerID`, `name`) VALUES ('5', '5', 'james');
INSERT INTO `customerspouse` (`id`, `customerID`, `name`) VALUES ('6', '6', 'brook');
INSERT INTO `customerspouse` (`id`, `customerID`, `name`) VALUES ('7', '7', 'jones');
INSERT INTO `customerspouse` (`id`, `customerID`, `name`) VALUES ('8', '8', 'denis');
INSERT INTO `customerspouse` (`id`, `customerID`, `name`) VALUES ('9', '9', 'holde');
INSERT INTO `customerspouse` (`id`, `customerID`, `name`) VALUES ('10', '10', 'richard');
INSERT INTO `customerspouse` (`id`, `customerID`, `name`) VALUES ('11', '11', 'marry');
INSERT INTO `customerspouse` (`id`, `customerID`, `name`) VALUES ('12', '12', 'brook');
INSERT INTO `customerspouse` (`id`, `customerID`, `name`) VALUES ('13', '13', 'betty');
INSERT INTO `customerspouse` (`id`, `customerID`, `name`) VALUES ('14', '14', 'sharon');
INSERT INTO `customerspouse` (`id`, `customerID`, `name`) VALUES ('15', '15', 'martin');
INSERT INTO `customerspouse` (`id`, `customerID`, `name`) VALUES ('16', '16', 'smith');
INSERT INTO `customerspouse` (`id`, `customerID`, `name`) VALUES ('17', '17', 'ali');
INSERT INTO `customerspouse` (`id`, `customerID`, `name`) VALUES ('18', '18', 'philip');
INSERT INTO `customerspouse` (`id`, `customerID`, `name`) VALUES ('19', '19', 'rajesh');
INSERT INTO `customerspouse` (`id`, `customerID`, `name`) VALUES ('20', '20', 'rahul');


INSERT INTO `salespeople` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('1', 'Preet', 'Philip', '1964-06-12', 'preet.philip@gmail.com');
INSERT INTO `salespeople` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('2', 'Sumit', 'Munshi', '1964-10-25', 'sumit.munshi@gmail.com');
INSERT INTO `salespeople` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('3', 'Maya', 'Mahajan', '1964-10-25', 'maya.mahajan@gmail.com');
INSERT INTO `salespeople` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('4', 'Elias', 'Aggarwal', '1965-10-31', 'elias.aggarwal@gmail.com');
INSERT INTO `salespeople` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('5', 'Tulsi', 'Mehta', '1965-01-12', 'tulsi.mehta@gmail.com');
INSERT INTO `salespeople` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('6', 'Naseer', 'Palla', '1965-12-01', 'naseer.palla@gmail.com');
INSERT INTO `salespeople` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('7', 'Anil', 'Khatri', '1960-12-14', 'anil.khatri@gmail.com');
INSERT INTO `salespeople` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('8', 'Vineeta', 'Bala', '1960-12-29', 'vineeta.bala@gmail.com');
INSERT INTO `salespeople` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('9', 'Amir', 'Hari', '1982-10-26', 'amir.hari@gmail.com');
INSERT INTO `salespeople` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('10', 'Kajal', 'Agarwal', '1983-10-26', 'kajal.agarwal@gmail.com');
INSERT INTO `salespeople` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('11', 'Maya', 'Bahl', '1984-10-30', 'maya.bahl@gmail.com');
INSERT INTO `salespeople` (`id`, `firstName`, `lastName`, `dob`, `emailid`) VALUES ('12', 'Neha', 'Dixit', '1984-11-30', 'neha.dixit@gmail.com');




INSERT INTO `salespeoplephone` (`id`, `salespeopleID`, `number`) VALUES ('1', '5', '9844709056');
INSERT INTO `salespeoplephone` (`id`, `salespeopleID`, `number`) VALUES ('2', '11', '9844702152');
INSERT INTO `salespeoplephone` (`id`, `salespeopleID`, `number`) VALUES ('3', '1', '9844702990');
INSERT INTO `salespeoplephone` (`id`, `salespeopleID`, `number`) VALUES ('4', '5', '9844701784');
INSERT INTO `salespeoplephone` (`id`, `salespeopleID`, `number`) VALUES ('5', '10', '9844700152');
INSERT INTO `salespeoplephone` (`id`, `salespeopleID`, `number`) VALUES ('6', '1', '9844701514');
INSERT INTO `salespeoplephone` (`id`, `salespeopleID`, `number`) VALUES ('7', '10', '9844708168');
INSERT INTO `salespeoplephone` (`id`, `salespeopleID`, `number`) VALUES ('8', '6', '9844703318');
INSERT INTO `salespeoplephone` (`id`, `salespeopleID`, `number`) VALUES ('9', '11', '9844707227');
INSERT INTO `salespeoplephone` (`id`, `salespeopleID`, `number`) VALUES ('10', '6', '9844705010');
INSERT INTO `salespeoplephone` (`id`, `salespeopleID`, `number`) VALUES ('11', '8', '9844708520');
INSERT INTO `salespeoplephone` (`id`, `salespeopleID`, `number`) VALUES ('12', '7', '9844704936');
INSERT INTO `salespeoplephone` (`id`, `salespeopleID`, `number`) VALUES ('13', '1', '9844703371');
INSERT INTO `salespeoplephone` (`id`, `salespeopleID`, `number`) VALUES ('14', '8', '9844707850');
INSERT INTO `salespeoplephone` (`id`, `salespeopleID`, `number`) VALUES ('15', '5', '9844702850');
INSERT INTO `salespeoplephone` (`id`, `salespeopleID`, `number`) VALUES ('16', '2', '9844700696');
INSERT INTO `salespeoplephone` (`id`, `salespeopleID`, `number`) VALUES ('17', '8', '9844704012');
INSERT INTO `salespeoplephone` (`id`, `salespeopleID`, `number`) VALUES ('18', '4', '9844704895');
INSERT INTO `salespeoplephone` (`id`, `salespeopleID`, `number`) VALUES ('19', '1', '9844705612');
INSERT INTO `salespeoplephone` (`id`, `salespeopleID`, `number`) VALUES ('20', '6', '9844708104');
INSERT INTO `salespeoplephone` (`id`, `salespeopleID`, `number`) VALUES ('21', '12', '9844708748');
INSERT INTO `salespeoplephone` (`id`, `salespeopleID`, `number`) VALUES ('22', '10', '9844708289');
INSERT INTO `salespeoplephone` (`id`, `salespeopleID`, `number`) VALUES ('23', '1', '9844705005');
INSERT INTO `salespeoplephone` (`id`, `salespeopleID`, `number`) VALUES ('24', '7', '9844705871');
INSERT INTO `salespeoplephone` (`id`, `salespeopleID`, `number`) VALUES ('25', '11', '9844709395');
INSERT INTO `salespeoplephone` (`id`, `salespeopleID`, `number`) VALUES ('26', '4', '9844701142');
INSERT INTO `salespeoplephone` (`id`, `salespeopleID`, `number`) VALUES ('27', '1', '9844708278');
INSERT INTO `salespeoplephone` (`id`, `salespeopleID`, `number`) VALUES ('28', '3', '9844709043');
INSERT INTO `salespeoplephone` (`id`, `salespeopleID`, `number`) VALUES ('29', '6', '9844708378');
INSERT INTO `salespeoplephone` (`id`, `salespeopleID`, `number`) VALUES ('30', '12', '9844702761');
INSERT INTO `salespeoplephone` (`id`, `salespeopleID`, `number`) VALUES ('31', '1', '9844702404');
INSERT INTO `salespeoplephone` (`id`, `salespeopleID`, `number`) VALUES ('32', '4', '9844705353');
INSERT INTO `salespeoplephone` (`id`, `salespeopleID`, `number`) VALUES ('33', '2', '9844709979');
INSERT INTO `salespeoplephone` (`id`, `salespeopleID`, `number`) VALUES ('34', '12', '9844703271');
INSERT INTO `salespeoplephone` (`id`, `salespeopleID`, `number`) VALUES ('35', '6', '9844707883');
INSERT INTO `salespeoplephone` (`id`, `salespeopleID`, `number`) VALUES ('36', '12', '9844701403');
INSERT INTO `salespeoplephone` (`id`, `salespeopleID`, `number`) VALUES ('37', '2', '9844705870');
INSERT INTO `salespeoplephone` (`id`, `salespeopleID`, `number`) VALUES ('38', '1', '9844706147');
INSERT INTO `salespeoplephone` (`id`, `salespeopleID`, `number`) VALUES ('39', '8', '9844701009');
INSERT INTO `salespeoplephone` (`id`, `salespeopleID`, `number`) VALUES ('40', '3', '9844706055');
INSERT INTO `salespeoplephone` (`id`, `salespeopleID`, `number`) VALUES ('41', '1', '9844708355');
INSERT INTO `salespeoplephone` (`id`, `salespeopleID`, `number`) VALUES ('42', '6', '9844707467');
INSERT INTO `salespeoplephone` (`id`, `salespeopleID`, `number`) VALUES ('43', '12', '9844703340');
INSERT INTO `salespeoplephone` (`id`, `salespeopleID`, `number`) VALUES ('44', '10', '9844701547');
INSERT INTO `salespeoplephone` (`id`, `salespeopleID`, `number`) VALUES ('45', '1', '9844701261');
INSERT INTO `salespeoplephone` (`id`, `salespeopleID`, `number`) VALUES ('46', '7', '9844700821');
INSERT INTO `salespeoplephone` (`id`, `salespeopleID`, `number`) VALUES ('47', '11', '9844702864');
INSERT INTO `salespeoplephone` (`id`, `salespeopleID`, `number`) VALUES ('48', '4', '9844707254');
INSERT INTO `salespeoplephone` (`id`, `salespeopleID`, `number`) VALUES ('49', '1', '9844702418');
INSERT INTO `salespeoplephone` (`id`, `salespeopleID`, `number`) VALUES ('50', '5', '9844704774');
INSERT INTO `salespeoplephone` (`id`, `salespeopleID`, `number`) VALUES ('51', '11', '9844705889');
INSERT INTO `salespeoplephone` (`id`, `salespeopleID`, `number`) VALUES ('52', '1', '9844700151');
INSERT INTO `salespeoplephone` (`id`, `salespeopleID`, `number`) VALUES ('53', '5', '9844700903');
INSERT INTO `salespeoplephone` (`id`, `salespeopleID`, `number`) VALUES ('54', '10', '9844705981');
INSERT INTO `salespeoplephone` (`id`, `salespeopleID`, `number`) VALUES ('55', '1', '9844707046');
INSERT INTO `salespeoplephone` (`id`, `salespeopleID`, `number`) VALUES ('56', '10', '9844701421');
INSERT INTO `salespeoplephone` (`id`, `salespeopleID`, `number`) VALUES ('57', '6', '9844707796');



INSERT INTO `customer_salespeople` (`id`, `customerID`, `salespeopleID`) VALUES ('1', '10', '11');
INSERT INTO `customer_salespeople` (`id`, `customerID`, `salespeopleID`) VALUES ('2', '10', '9');
INSERT INTO `customer_salespeople` (`id`, `customerID`, `salespeopleID`) VALUES ('3', '27', '9');
INSERT INTO `customer_salespeople` (`id`, `customerID`, `salespeopleID`) VALUES ('4', '27', '8');
INSERT INTO `customer_salespeople` (`id`, `customerID`, `salespeopleID`) VALUES ('5', '36', '4');
INSERT INTO `customer_salespeople` (`id`, `customerID`, `salespeopleID`) VALUES ('6', '30', '1');
INSERT INTO `customer_salespeople` (`id`, `customerID`, `salespeopleID`) VALUES ('7', '44', '2');
INSERT INTO `customer_salespeople` (`id`, `customerID`, `salespeopleID`) VALUES ('8', '45', '5');
INSERT INTO `customer_salespeople` (`id`, `customerID`, `salespeopleID`) VALUES ('9', '23', '10');
INSERT INTO `customer_salespeople` (`id`, `customerID`, `salespeopleID`) VALUES ('10', '29', '12');
INSERT INTO `customer_salespeople` (`id`, `customerID`, `salespeopleID`) VALUES ('11', '5', '10');
INSERT INTO `customer_salespeople` (`id`, `customerID`, `salespeopleID`) VALUES ('12', '2', '2');
INSERT INTO `customer_salespeople` (`id`, `customerID`, `salespeopleID`) VALUES ('13', '45', '2');
INSERT INTO `customer_salespeople` (`id`, `customerID`, `salespeopleID`) VALUES ('14', '34', '12');
INSERT INTO `customer_salespeople` (`id`, `customerID`, `salespeopleID`) VALUES ('15', '43', '10');
INSERT INTO `customer_salespeople` (`id`, `customerID`, `salespeopleID`) VALUES ('16', '8', '5');
INSERT INTO `customer_salespeople` (`id`, `customerID`, `salespeopleID`) VALUES ('17', '20', '10');
INSERT INTO `customer_salespeople` (`id`, `customerID`, `salespeopleID`) VALUES ('18', '14', '2');
INSERT INTO `customer_salespeople` (`id`, `customerID`, `salespeopleID`) VALUES ('19', '2', '10');
INSERT INTO `customer_salespeople` (`id`, `customerID`, `salespeopleID`) VALUES ('20', '3', '4');
INSERT INTO `customer_salespeople` (`id`, `customerID`, `salespeopleID`) VALUES ('21', '34', '7');
INSERT INTO `customer_salespeople` (`id`, `customerID`, `salespeopleID`) VALUES ('22', '42', '5');
INSERT INTO `customer_salespeople` (`id`, `customerID`, `salespeopleID`) VALUES ('23', '27', '11');
INSERT INTO `customer_salespeople` (`id`, `customerID`, `salespeopleID`) VALUES ('24', '48', '12');
INSERT INTO `customer_salespeople` (`id`, `customerID`, `salespeopleID`) VALUES ('25', '12', '10');
INSERT INTO `customer_salespeople` (`id`, `customerID`, `salespeopleID`) VALUES ('26', '14', '12');
INSERT INTO `customer_salespeople` (`id`, `customerID`, `salespeopleID`) VALUES ('27', '50', '2');
INSERT INTO `customer_salespeople` (`id`, `customerID`, `salespeopleID`) VALUES ('28', '9', '4');
INSERT INTO `customer_salespeople` (`id`, `customerID`, `salespeopleID`) VALUES ('29', '19', '6');
INSERT INTO `customer_salespeople` (`id`, `customerID`, `salespeopleID`) VALUES ('30', '47', '7');
INSERT INTO `customer_salespeople` (`id`, `customerID`, `salespeopleID`) VALUES ('31', '37', '10');
INSERT INTO `customer_salespeople` (`id`, `customerID`, `salespeopleID`) VALUES ('32', '45', '2');
INSERT INTO `customer_salespeople` (`id`, `customerID`, `salespeopleID`) VALUES ('33', '13', '9');
INSERT INTO `customer_salespeople` (`id`, `customerID`, `salespeopleID`) VALUES ('34', '47', '11');
INSERT INTO `customer_salespeople` (`id`, `customerID`, `salespeopleID`) VALUES ('35', '27', '1');
INSERT INTO `customer_salespeople` (`id`, `customerID`, `salespeopleID`) VALUES ('36', '11', '11');
INSERT INTO `customer_salespeople` (`id`, `customerID`, `salespeopleID`) VALUES ('37', '45', '6');
INSERT INTO `customer_salespeople` (`id`, `customerID`, `salespeopleID`) VALUES ('38', '23', '10');
INSERT INTO `customer_salespeople` (`id`, `customerID`, `salespeopleID`) VALUES ('39', '46', '2');
INSERT INTO `customer_salespeople` (`id`, `customerID`, `salespeopleID`) VALUES ('40', '8', '5');
INSERT INTO `customer_salespeople` (`id`, `customerID`, `salespeopleID`) VALUES ('41', '21', '4');
INSERT INTO `customer_salespeople` (`id`, `customerID`, `salespeopleID`) VALUES ('42', '15', '4');
INSERT INTO `customer_salespeople` (`id`, `customerID`, `salespeopleID`) VALUES ('43', '17', '9');
INSERT INTO `customer_salespeople` (`id`, `customerID`, `salespeopleID`) VALUES ('44', '24', '7');
INSERT INTO `customer_salespeople` (`id`, `customerID`, `salespeopleID`) VALUES ('45', '42', '7');
INSERT INTO `customer_salespeople` (`id`, `customerID`, `salespeopleID`) VALUES ('46', '22', '6');
INSERT INTO `customer_salespeople` (`id`, `customerID`, `salespeopleID`) VALUES ('47', '14', '8');
INSERT INTO `customer_salespeople` (`id`, `customerID`, `salespeopleID`) VALUES ('48', '38', '4');
INSERT INTO `customer_salespeople` (`id`, `customerID`, `salespeopleID`) VALUES ('49', '26', '7');
INSERT INTO `customer_salespeople` (`id`, `customerID`, `salespeopleID`) VALUES ('50', '4', '9');



INSERT INTO `region` (`id`, `name`) VALUES ('1', 'North');
INSERT INTO `region` (`id`, `name`) VALUES ('2', 'South');
INSERT INTO `region` (`id`, `name`) VALUES ('3', 'East');
INSERT INTO `region` (`id`, `name`) VALUES ('4', 'West');

INSERT INTO `customer_region` (`id`, `customerID`, `regionID`) VALUES ('1', '1', '3');
INSERT INTO `customer_region` (`id`, `customerID`, `regionID`) VALUES ('2', '2', '4');
INSERT INTO `customer_region` (`id`, `customerID`, `regionID`) VALUES ('3', '3', '2');
INSERT INTO `customer_region` (`id`, `customerID`, `regionID`) VALUES ('4', '4', '1');
INSERT INTO `customer_region` (`id`, `customerID`, `regionID`) VALUES ('5', '5', '3');
INSERT INTO `customer_region` (`id`, `customerID`, `regionID`) VALUES ('6', '6', '1');
INSERT INTO `customer_region` (`id`, `customerID`, `regionID`) VALUES ('7', '7', '1');
INSERT INTO `customer_region` (`id`, `customerID`, `regionID`) VALUES ('8', '8', '4');
INSERT INTO `customer_region` (`id`, `customerID`, `regionID`) VALUES ('9', '9', '4');
INSERT INTO `customer_region` (`id`, `customerID`, `regionID`) VALUES ('10', '10', '3');
INSERT INTO `customer_region` (`id`, `customerID`, `regionID`) VALUES ('11', '11', '2');
INSERT INTO `customer_region` (`id`, `customerID`, `regionID`) VALUES ('12', '12', '1');
INSERT INTO `customer_region` (`id`, `customerID`, `regionID`) VALUES ('13', '13', '3');
INSERT INTO `customer_region` (`id`, `customerID`, `regionID`) VALUES ('14', '14', '1');
INSERT INTO `customer_region` (`id`, `customerID`, `regionID`) VALUES ('15', '15', '2');
INSERT INTO `customer_region` (`id`, `customerID`, `regionID`) VALUES ('16', '16', '2');
INSERT INTO `customer_region` (`id`, `customerID`, `regionID`) VALUES ('17', '17', '2');
INSERT INTO `customer_region` (`id`, `customerID`, `regionID`) VALUES ('18', '18', '1');
INSERT INTO `customer_region` (`id`, `customerID`, `regionID`) VALUES ('19', '19', '2');
INSERT INTO `customer_region` (`id`, `customerID`, `regionID`) VALUES ('20', '20', '4');
INSERT INTO `customer_region` (`id`, `customerID`, `regionID`) VALUES ('21', '21', '3');
INSERT INTO `customer_region` (`id`, `customerID`, `regionID`) VALUES ('22', '22', '1');
INSERT INTO `customer_region` (`id`, `customerID`, `regionID`) VALUES ('23', '23', '3');
INSERT INTO `customer_region` (`id`, `customerID`, `regionID`) VALUES ('24', '24', '2');
INSERT INTO `customer_region` (`id`, `customerID`, `regionID`) VALUES ('25', '25', '3');
INSERT INTO `customer_region` (`id`, `customerID`, `regionID`) VALUES ('26', '26', '4');
INSERT INTO `customer_region` (`id`, `customerID`, `regionID`) VALUES ('27', '27', '3');
INSERT INTO `customer_region` (`id`, `customerID`, `regionID`) VALUES ('28', '28', '3');
INSERT INTO `customer_region` (`id`, `customerID`, `regionID`) VALUES ('29', '29', '4');
INSERT INTO `customer_region` (`id`, `customerID`, `regionID`) VALUES ('30', '30', '4');
INSERT INTO `customer_region` (`id`, `customerID`, `regionID`) VALUES ('31', '31', '3');
INSERT INTO `customer_region` (`id`, `customerID`, `regionID`) VALUES ('32', '32', '2');
INSERT INTO `customer_region` (`id`, `customerID`, `regionID`) VALUES ('33', '33', '1');
INSERT INTO `customer_region` (`id`, `customerID`, `regionID`) VALUES ('34', '34', '4');
INSERT INTO `customer_region` (`id`, `customerID`, `regionID`) VALUES ('35', '35', '4');
INSERT INTO `customer_region` (`id`, `customerID`, `regionID`) VALUES ('36', '36', '4');
INSERT INTO `customer_region` (`id`, `customerID`, `regionID`) VALUES ('37', '37', '1');
INSERT INTO `customer_region` (`id`, `customerID`, `regionID`) VALUES ('38', '38', '2');
INSERT INTO `customer_region` (`id`, `customerID`, `regionID`) VALUES ('39', '39', '3');
INSERT INTO `customer_region` (`id`, `customerID`, `regionID`) VALUES ('40', '40', '3');
INSERT INTO `customer_region` (`id`, `customerID`, `regionID`) VALUES ('41', '41', '2');
INSERT INTO `customer_region` (`id`, `customerID`, `regionID`) VALUES ('42', '42', '1');
INSERT INTO `customer_region` (`id`, `customerID`, `regionID`) VALUES ('43', '43', '3');
INSERT INTO `customer_region` (`id`, `customerID`, `regionID`) VALUES ('44', '44', '1');
INSERT INTO `customer_region` (`id`, `customerID`, `regionID`) VALUES ('45', '45', '3');
INSERT INTO `customer_region` (`id`, `customerID`, `regionID`) VALUES ('46', '46', '1');
INSERT INTO `customer_region` (`id`, `customerID`, `regionID`) VALUES ('47', '47', '2');
INSERT INTO `customer_region` (`id`, `customerID`, `regionID`) VALUES ('48', '48', '4');
INSERT INTO `customer_region` (`id`, `customerID`, `regionID`) VALUES ('49', '49', '3');
INSERT INTO `customer_region` (`id`, `customerID`, `regionID`) VALUES ('50', '50', '1');


INSERT INTO `manufacturer` (`id`, `name`) VALUES ('1', 'TATA Groups');
INSERT INTO `manufacturer` (`id`, `name`) VALUES ('2', 'Bajaj Groups');
INSERT INTO `manufacturer` (`id`, `name`) VALUES ('3', 'Reliance Industries');
INSERT INTO `manufacturer` (`id`, `name`) VALUES ('4', 'Adani Groups');
INSERT INTO `manufacturer` (`id`, `name`) VALUES ('5', 'Gujarat Exports Ltd.');
INSERT INTO `manufacturer` (`id`, `name`) VALUES ('6', 'M&M');
INSERT INTO `manufacturer` (`id`, `name`) VALUES ('7', 'Nestley');
INSERT INTO `manufacturer` (`id`, `name`) VALUES ('8', 'HTM');
INSERT INTO `manufacturer` (`id`, `name`) VALUES ('9', 'Shell');
INSERT INTO `manufacturer` (`id`, `name`) VALUES ('10', 'Sony');
INSERT INTO `manufacturer` (`id`, `name`) VALUES ('11', 'Natraj');
INSERT INTO `manufacturer` (`id`, `name`) VALUES ('12', 'Global');
INSERT INTO `manufacturer` (`id`, `name`) VALUES ('13', 'intel');


INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('1', 'Product1', '1', '2985', '5');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('2', 'Product2', '2', '900', '2');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('3', 'Product3', '1', '2938', '5');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('4', 'Product4', '4', '871', '2');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('5', 'Product5', '5', '2704', '1');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('6', 'Product6', '2', '5215', '3');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('7', 'Product7', '2', '3665', '2');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('8', 'Product8', '1', '4331', '1');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('9', 'Product9', '7', '1414', '4');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('10', 'Product10', '2', '1097', '4');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('11', 'Product11', '8', '4491', '1');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('12', 'Product12', '3', '3468', '4');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('13', 'Product13', '6', '3656', '5');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('14', 'Product14', '1', '3492', '5');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('15', 'Product15', '4', '3086', '2');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('16', 'Product16', '9', '3303', '4');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('17', 'Product17', '1', '1283', '4');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('18', 'Product18', '9', '4012', '5');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('19', 'Product19', '4', '5500', '3');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('20', 'Product20', '1', '2116', '2');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('21', 'Product21', '1', '3488', '5');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('22', 'Product22', '1', '2679', '1');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('23', 'Product23', '10', '5406', '4');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('24', 'Product24', '2', '6856', '5');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('25', 'Product25', '8', '1273', '4');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('26', 'Product26', '3', '1417', '5');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('27', 'Product27', '6', '1550', '2');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('28', 'Product28', '1', '1168', '2');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('29', 'Product29', '7', '6917', '5');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('30', 'Product30', '8', '815', '4');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('31', 'Product31', '9', '1332', '2');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('32', 'Product32', '10', '3466', '5');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('33', 'Product33', '11', '4462', '1');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('34', 'Product34', '12', '5107', '2');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('35', 'Product35', '13', '1687', '2');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('36', 'Product36', '12', '4036', '4');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('37', 'Product37', '13', '3163', '2');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('38', 'Product38', '11', '5939', '1');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('39', 'Product39', '11', '390', '5');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('40', 'Product40', '12', '6850', '5');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('41', 'Product41', '13', '5605', '2');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('42', 'Product42', '7', '350', '4');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('43', 'Product43', '2', '3571', '4');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('44', 'Product44', '8', '1747', '2');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('45', 'Product45', '3', '5413', '3');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('46', 'Product46', '6', '5627', '5');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('47', 'Product47', '1', '1404', '2');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('48', 'Product48', '4', '896', '2');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('49', 'Product49', '11', '245', '5');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('50', 'Product50', '12', '3243', '4');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('51', 'Product51', '13', '6380', '2');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('52', 'Product52', '12', '4142', '1');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('53', 'Product53', '1', '1730', '3');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('54', 'Product54', '7', '5323', '5');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('55', 'Product55', '2', '1032', '1');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('56', 'Product56', '8', '257', '1');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('57', 'Product57', '3', '2956', '1');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('58', 'Product58', '6', '6867', '4');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('59', 'Product59', '1', '4295', '4');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('60', 'Product60', '4', '2369', '1');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('61', 'Product61', '9', '926', '1');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('62', 'Product62', '1', '312', '4');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('63', 'Product63', '9', '2215', '2');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('64', 'Product64', '4', '4862', '1');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('65', 'Product65', '1', '2804', '5');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('66', 'Product66', '1', '1960', '4');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('67', 'Product67', '1', '797', '2');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('68', 'Product68', '10', '6282', '4');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('69', 'Product69', '2', '2711', '5');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('70', 'Product70', '8', '4267', '3');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('71', 'Product71', '3', '6170', '1');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('72', 'Product72', '6', '3283', '5');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('73', 'Product73', '1', '4755', '5');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('74', 'Product74', '11', '4338', '2');
INSERT INTO `products` (`id`, `name`, `manufacuterID`, `rate`, `discountper`) VALUES ('75', 'Product75', '13', '4357', '4');





INSERT INTO `orders` (`id`, `customerID`, `odate`, `amount`) VALUES ('1', '16', '2019-01-12', '2000');
INSERT INTO `orders` (`id`, `customerID`, `odate`, `amount`) VALUES ('2', '35', '2019-01-12', '2500');
INSERT INTO `orders` (`id`, `odate`, `amount`) VALUES ('3', '2019-08-17', '150');
INSERT INTO `orders` (`id`, `customerID`, `odate`, `amount`) VALUES ('4', '44', '2019-05-02', '340');
INSERT INTO `orders` (`id`, `customerID`, `odate`, `amount`) VALUES ('5', '34', '2019-05-03', '655');
INSERT INTO `orders` (`id`, `customerID`, `odate`, `amount`) VALUES ('6', '48', '2019-05-04', '1000');
INSERT INTO `orders` (`id`, `customerID`, `odate`, `amount`) VALUES ('7', '1', '2019-11-11', '4000');
INSERT INTO `orders` (`id`, `customerID`, `odate`, `amount`) VALUES ('8', '13', '2019-07-19', '1270');
INSERT INTO `orders` (`id`, `customerID`, `odate`, `amount`) VALUES ('9', '46', '2019-04-07', '2000');
INSERT INTO `orders` (`id`, `customerID`, `odate`, `amount`) VALUES ('10', '25', '2019-10-10', '2500');
INSERT INTO `orders` (`id`, `customerID`, `odate`, `amount`) VALUES ('11', '40', '2019-11-11', '150');
INSERT INTO `orders` (`id`, `customerID`, `odate`, `amount`) VALUES ('12', '20', '2019-07-21', '340');
INSERT INTO `orders` (`id`, `customerID`, `odate`, `amount`) VALUES ('13', '2', '2019-11-02', '655');
INSERT INTO `orders` (`id`, `customerID`, `odate`, `amount`) VALUES ('14', '16', '2019-01-12', '1000');
INSERT INTO `orders` (`id`, `customerID`, `odate`, `amount`) VALUES ('15', '25', '2019-04-07', '4000');
INSERT INTO `orders` (`id`, `customerID`, `odate`, `amount`) VALUES ('16', '39', '2019-10-10', '1270');
INSERT INTO `orders` (`id`, `customerID`, `odate`, `amount`) VALUES ('17', '22', '2019-11-11', '4588');
INSERT INTO `orders` (`id`, `customerID`, `odate`, `amount`) VALUES ('18', '2', '2019-07-21', '1200');
INSERT INTO `orders` (`id`, `customerID`, `odate`, `amount`) VALUES ('19', '15', '2019-11-02', '125');
INSERT INTO `orders` (`id`, `customerID`, `odate`, `amount`) VALUES ('20', '2', '2019-01-12', '350');
INSERT INTO `orders` (`id`, `customerID`, `odate`, `amount`) VALUES ('21', '46', '2019-01-12', '4500');
INSERT INTO `orders` (`id`, `odate`, `amount`) VALUES ('22', '2019-11-02', '650');
INSERT INTO `orders` (`id`, `customerID`, `odate`, `amount`) VALUES ('23', '15', '2019-10-19', '700');
INSERT INTO `orders` (`id`, `customerID`, `odate`, `amount`) VALUES ('24', '26', '2019-08-08', '1400');
INSERT INTO `orders` (`id`, `customerID`, `odate`, `amount`) VALUES ('25', '34', '2019-06-15', '1999');
INSERT INTO `orders` (`id`, `customerID`, `odate`, `amount`) VALUES ('26', '26', '2019-02-02', '280');
INSERT INTO `orders` (`id`, `customerID`, `odate`, `amount`) VALUES ('27', '37', '2019-08-21', '175');
INSERT INTO `orders` (`id`, `customerID`, `odate`, `amount`) VALUES ('28', '14', '2019-02-02', '45');
INSERT INTO `orders` (`id`, `customerID`, `odate`, `amount`) VALUES ('29', '2', '2019-01-12', '190');
INSERT INTO `orders` (`id`, `customerID`, `odate`, `amount`) VALUES ('30', '13', '2019-07-10', '750');
INSERT INTO `orders` (`id`, `customerID`, `odate`, `amount`) VALUES ('31', '28', '2019-11-12', '575');
INSERT INTO `orders` (`id`, `customerID`, `odate`, `amount`) VALUES ('32', '21', '2019-03-03', '635');
INSERT INTO `orders` (`id`, `customerID`, `odate`, `amount`) VALUES ('33', '7', '2019-06-23', '945');
INSERT INTO `orders` (`id`, `customerID`, `odate`, `amount`) VALUES ('34', '22', '2019-01-19', '225');
INSERT INTO `orders` (`id`, `customerID`, `odate`, `amount`) VALUES ('35', '6', '2019-10-10', '325');
INSERT INTO `orders` (`id`, `customerID`, `odate`, `amount`) VALUES ('36', '3', '2019-01-12', '180');
INSERT INTO `orders` (`id`, `odate`, `amount`) VALUES ('37', '2019-06-23', '500');
INSERT INTO `orders` (`id`, `customerID`, `odate`, `amount`) VALUES ('38', '39', '2019-01-19', '400');
INSERT INTO `orders` (`id`, `customerID`, `odate`, `amount`) VALUES ('39', '25', '2019-10-10', '320');
INSERT INTO `orders` (`id`, `customerID`, `odate`, `amount`) VALUES ('40', '26', '2019-01-12', '650');
INSERT INTO `orders` (`id`, `customerID`, `odate`, `amount`) VALUES ('41', '5', '2019-10-10', '5000');
INSERT INTO `orders` (`id`, `customerID`, `odate`, `amount`) VALUES ('42', '11', '2019-10-10', '3500');
INSERT INTO `orders` (`id`, `customerID`, `odate`, `amount`) VALUES ('43', '43', '2019-11-11', '4588');
INSERT INTO `orders` (`id`, `customerID`, `odate`, `amount`) VALUES ('44', '37', '2019-07-21', '1800');
INSERT INTO `orders` (`id`, `customerID`, `odate`, `amount`) VALUES ('45', '42', '2019-11-02', '165');
INSERT INTO `orders` (`id`, `customerID`, `odate`, `amount`) VALUES ('46', '37', '2019-01-12', '445');
INSERT INTO `orders` (`id`, `customerID`, `odate`, `amount`) VALUES ('47', '2', '2019-01-12', '4097');
INSERT INTO `orders` (`id`, `customerID`, `odate`, `amount`) VALUES ('48', '46', '2019-01-12', '4447');
INSERT INTO `orders` (`id`, `customerID`, `odate`, `amount`) VALUES ('49', '8', '2019-08-17', '4198');
INSERT INTO `orders` (`id`, `customerID`, `odate`, `amount`) VALUES ('50', '18', '2019-05-02', '2213');
INSERT INTO `orders` (`id`, `customerID`, `odate`, `amount`) VALUES ('51', '11', '2019-05-03', '4956');
INSERT INTO `orders` (`id`, `customerID`, `odate`, `amount`) VALUES ('52', '33', '2019-05-04', '4046');
INSERT INTO `orders` (`id`, `odate`, `amount`) VALUES ('53', '2019-11-11', '2338');
INSERT INTO `orders` (`id`, `odate`, `amount`) VALUES ('54', '2019-07-19', '3298');
INSERT INTO `orders` (`id`, `customerID`, `odate`, `amount`) VALUES ('55', '11', '2019-04-07', '1633');
INSERT INTO `orders` (`id`, `customerID`, `odate`, `amount`) VALUES ('56', '33', '2019-10-10', '1019');
INSERT INTO `orders` (`id`, `customerID`, `odate`, `amount`) VALUES ('57', '22', '2019-11-11', '2385');
INSERT INTO `orders` (`id`, `customerID`, `odate`, `amount`) VALUES ('58', '13', '2019-07-21', '464');
INSERT INTO `orders` (`id`, `customerID`, `odate`, `amount`) VALUES ('59', '27', '2019-11-02', '308');
INSERT INTO `orders` (`id`, `customerID`, `odate`, `amount`) VALUES ('60', '41', '2019-01-12', '4628');
INSERT INTO `orders` (`id`, `customerID`, `odate`, `amount`) VALUES ('61', '15', '2019-04-07', '3329');
INSERT INTO `orders` (`id`, `customerID`, `odate`, `amount`) VALUES ('62', '32', '2019-10-10', '1731');



INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('1', '1', '5', '6');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('2', '1', '3', '2');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('3', '1', '17', '1');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('4', '2', '6', '3');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('5', '2', '20', '9');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('6', '2', '32', '10');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('7', '2', '22', '4');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('8', '3', '5', '7');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('9', '3', '7', '8');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('10', '3', '9', '8');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('11', '4', '21', '10');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('12', '4', '32', '9');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('13', '4', '40', '5');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('14', '4', '17', '3');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('15', '5', '38', '1');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('16', '5', '26', '3');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('17', '5', '24', '4');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('18', '5', '1', '9');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('19', '5', '7', '3');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('20', '6', '10', '5');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('21', '6', '17', '3');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('22', '7', '5', '3');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('23', '7', '10', '5');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('24', '8', '21', '10');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('25', '8', '25', '6');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('26', '8', '32', '4');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('27', '9', '1', '2');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('28', '9', '4', '8');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('29', '9', '6', '2');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('30', '10', '12', '10');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('31', '10', '16', '7');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('32', '10', '23', '8');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('33', '10', '28', '9');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('34', '11', '28', '6');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('35', '11', '31', '6');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('36', '11', '29', '2');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('37', '11', '4', '7');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('38', '12', '2', '8');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('39', '12', '3', '10');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('40', '12', '5', '9');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('41', '12', '9', '5');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('42', '13', '13', '7');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('43', '13', '2', '4');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('44', '13', '17', '9');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('45', '14', '15', '7');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('46', '14', '12', '10');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('47', '14', '26', '9');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('48', '14', '29', '4');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('49', '15', '8', '4');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('50', '15', '28', '3');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('51', '15', '4', '9');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('52', '16', '6', '7');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('53', '16', '13', '7');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('54', '16', '17', '9');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('55', '16', '19', '2');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('56', '17', '21', '7');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('57', '17', '32', '7');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('58', '17', '14', '6');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('59', '17', '15', '8');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('60', '18', '12', '9');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('61', '18', '21', '4');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('62', '18', '13', '1');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('63', '18', '15', '1');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('64', '19', '21', '8');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('65', '19', '24', '10');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('66', '19', '25', '9');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('67', '19', '3', '7');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('68', '19', '18', '5');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('69', '20', '9', '2');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('70', '20', '12', '2');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('71', '20', '18', '3');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('72', '20', '31', '3');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('73', '21', '3', '5');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('74', '21', '1', '4');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('75', '21', '6', '6');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('76', '21', '4', '10');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('77', '22', '3', '5');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('78', '22', '29', '5');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('79', '22', '4', '5');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('80', '23', '28', '7');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('81', '23', '23', '8');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('82', '24', '25', '1');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('83', '24', '3', '5');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('84', '24', '2', '6');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('85', '25', '24', '1');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('86', '25', '8', '4');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('87', '26', '23', '8');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('88', '26', '21', '10');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('89', '26', '26', '1');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('90', '26', '5', '4');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('91', '26', '4', '4');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('92', '27', '8', '7');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('93', '27', '5', '8');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('94', '27', '27', '2');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('95', '27', '4', '2');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('96', '28', '3', '1');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('97', '28', '22', '4');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('98', '28', '2', '2');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('99', '28', '5', '4');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('100', '29', '17', '2');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('101', '29', '2', '8');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('102', '29', '17', '9');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('103', '30', '22', '7');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('104', '30', '17', '7');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('105', '30', '22', '9');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('106', '30', '21', '1');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('107', '31', '10', '4');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('108', '31', '6', '5');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('109', '31', '31', '10');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('110', '32', '17', '1');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('111', '32', '5', '6');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('112', '32', '30', '2');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('113', '32', '22', '9');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('114', '33', '17', '5');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('115', '33', '26', '6');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('116', '33', '2', '4');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('117', '33', '16', '6');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('118', '33', '8', '1');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('119', '34', '28', '2');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('120', '34', '21', '10');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('121', '35', '16', '5');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('122', '35', '8', '9');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('123', '36', '28', '10');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('124', '37', '4', '1');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('125', '38', '25', '5');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('126', '39', '1', '3');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('127', '39', '5', '2');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('128', '39', '15', '4');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('129', '39', '15', '4');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('130', '39', '31', '9');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('131', '39', '22', '1');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('132', '40', '19', '2');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('133', '40', '13', '5');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('134', '40', '27', '1');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('135', '41', '25', '6');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('136', '41', '16', '2');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('137', '41', '3', '7');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('138', '41', '20', '5');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('139', '41', '30', '9');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('140', '42', '16', '7');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('141', '42', '3', '5');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('142', '42', '31', '5');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('143', '42', '7', '10');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('144', '43', '5', '4');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('145', '43', '12', '4');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('146', '43', '19', '7');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('147', '43', '28', '3');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('148', '43', '24', '6');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('149', '44', '9', '3');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('150', '45', '27', '9');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('151', '46', '21', '3');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('152', '47', '29', '4');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('153', '48', '17', '3');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('154', '49', '7', '4');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('155', '49', '3', '10');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('156', '50', '24', '9');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('157', '50', '10', '2');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('158', '51', '11', '6');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('159', '51', '8', '5');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('160', '51', '25', '4');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('161', '52', '6', '3');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('162', '52', '7', '7');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('163', '52', '16', '2');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('164', '52', '32', '8');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('165', '52', '12', '6');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('166', '53', '7', '1');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('167', '53', '14', '3');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('168', '53', '10', '6');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('169', '53', '9', '8');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('170', '54', '7', '6');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('171', '55', '28', '1');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('172', '56', '11', '8');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('173', '56', '31', '1');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('174', '56', '26', '1');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('175', '56', '15', '3');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('176', '56', '29', '10');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('177', '56', '10', '7');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('178', '57', '10', '10');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('179', '57', '7', '7');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('180', '57', '31', '9');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('181', '57', '27', '6');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('182', '57', '12', '9');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('183', '58', '24', '4');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('184', '58', '31', '10');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('185', '58', '7', '4');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('186', '58', '31', '8');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('187', '59', '8', '5');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('188', '59', '16', '2');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('189', '60', '21', '5');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('190', '60', '18', '8');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('191', '60', '6', '10');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('192', '60', '6', '1');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('193', '60', '3', '9');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('194', '60', '7', '4');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('195', '61', '13', '5');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('196', '61', '16', '2');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('197', '61', '9', '5');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('198', '61', '10', '10');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('199', '61', '27', '3');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('200', '62', '4', '2');
INSERT INTO `orderdetails` (`id`, `orderID`, `productID`, `qty`) VALUES ('201', '62', '1', '4');

