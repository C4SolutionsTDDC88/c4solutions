CREATE DATABASE IF NOT EXISTS c4db;
USE c4db;

DROP TABLE IF EXISTS `Kolli`;
DROP TABLE IF EXISTS `Shelf`;
DROP TABLE IF EXISTS `StorageEvent`;
DROP TABLE IF EXISTS `StorageMap`;
DROP TABLE IF EXISTS `Container`;
DROP TABLE IF EXISTS `StorageRoom`;
DROP TABLE IF EXISTS `Branch`;
DROP TABLE IF EXISTS `Article`;
DROP TABLE IF EXISTS `Case`;


CREATE TABLE `Case` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`reference_number` VARCHAR(255) NOT NULL UNIQUE,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Article` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`material_number` VARCHAR(255) NOT NULL,
	`description` varchar(255),
	`case` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `StorageEvent` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`action` varchar(30) NOT NULL,
	`timestamp` INT(10) NOT NULL,
	`user` VARCHAR(255) NOT NULL,
	`comment` varchar(255),
	`container` INT(255) NOT NULL,
	`storage_room` INT NOT NULL,
	`article` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `StorageRoom` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`branch` INT NOT NULL,
	`name` varchar(60) NOT NULL UNIQUE,
	PRIMARY KEY (`id`)
);

CREATE TABLE `StorageMap` (
	`article` INT NOT NULL,
	`container` INT NOT NULL,
	PRIMARY KEY (`article`)
);

CREATE TABLE `Branch` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar(60) NOT NULL UNIQUE,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Kolli` (
	`id` INT NOT NULL,
	`kolli_number` varchar(255) NOT NULL UNIQUE,
	`shelf` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Container` (
	`current_storage_room` INT NOT NULL,
	`id` INT NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Shelf` (
	`id` INT NOT NULL,
	`shelf_name` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `Article` ADD CONSTRAINT `Article_fk0` FOREIGN KEY (`case`) REFERENCES `Case`(`id`);

ALTER TABLE `Article` ADD CONSTRAINT `Article_case_material_unique` UNIQUE(`material_number`, `case`);

ALTER TABLE `StorageEvent` ADD CONSTRAINT `StorageEvent_fk0` FOREIGN KEY (`container`) REFERENCES `Container`(`id`);

ALTER TABLE `StorageEvent` ADD CONSTRAINT `StorageEvent_fk1` FOREIGN KEY (`storage_room`) REFERENCES `StorageRoom`(`id`);

ALTER TABLE `StorageEvent` ADD CONSTRAINT `StorageEvent_fk2` FOREIGN KEY (`article`) REFERENCES `Article`(`id`);

ALTER TABLE `StorageRoom` ADD CONSTRAINT `StorageRoom_fk0` FOREIGN KEY (`branch`) REFERENCES `Branch`(`id`);

ALTER TABLE `StorageMap` ADD CONSTRAINT `StorageMap_fk0` FOREIGN KEY (`article`) REFERENCES `Article`(`id`);

ALTER TABLE `StorageMap` ADD CONSTRAINT `StorageMap_fk1` FOREIGN KEY (`container`) REFERENCES `Container`(`id`);

ALTER TABLE `Kolli` ADD CONSTRAINT `Kolli_fk0` FOREIGN KEY (`id`) REFERENCES `container`(`id`);

ALTER TABLE `Kolli` ADD CONSTRAINT `Kolli_fk1` FOREIGN KEY (`shelf`) REFERENCES `Shelf`(`id`);

ALTER TABLE `Container` ADD CONSTRAINT `Container_fk0` FOREIGN KEY (`current_storage_room`) REFERENCES `StorageRoom`(`id`);

ALTER TABLE `Shelf` ADD CONSTRAINT `Shelf_fk0` FOREIGN KEY (`id`) REFERENCES `Container`(`id`);


INSERT INTO `Branch` (`name`) VALUES ("DNA"),("Finger"),("Uppackning"),("Vapen"),("Bio-analys");

INSERT INTO `StorageRoom` (`name`, `branch`) VALUES ("DNA materialrum 1", 1), ("DNA materialrum 2", 1),("Finger materialrum", 2),("Uppackning förråd", 3),("Vapen 1", 4),("Bio-analys rum 1", 5);

INSERT INTO `Case` (`reference_number`) VALUES ("607345"),("782393"),("440305"),("295073"),("700439"),("493064"),("013931"),("868911"),("587912"),("268182");
INSERT INTO `Case` (`reference_number`) VALUES ("926656"),("846405"),("468240"),("137492"),("976316"),("434857"),("371777"),("657496"),("813814"),("688496");
INSERT INTO `Case` (`reference_number`) VALUES ("783524"),("486184"),("515426"),("954898"),("594120"),("747238"),("869172"),("293190"),("759037"),("840264");
INSERT INTO `Case` (`reference_number`) VALUES ("948555"),("654425"),("795245"),("267294"),("985407"),("918521"),("079699"),("214030"),("207526"),("944992");
INSERT INTO `Case` (`reference_number`) VALUES ("408528"),("724999"),("728492"),("102912"),("194874"),("267992"),("410104"),("822745"),("757591"),("532509");
INSERT INTO `Case` (`reference_number`) VALUES ("040340"),("769251"),("158130"),("772381"),("959888"),("958520"),("303457"),("896836"),("199699"),("044556");
INSERT INTO `Case` (`reference_number`) VALUES ("129274"),("925869"),("486272"),("505841"),("053729"),("930088"),("928874"),("443033"),("744052"),("355155");
INSERT INTO `Case` (`reference_number`) VALUES ("648555"),("230017"),("661583"),("677953"),("040639"),("805560"),("801350"),("149017"),("065957"),("161510");
INSERT INTO `Case` (`reference_number`) VALUES ("848771"),("058801"),("473815"),("121938"),("743996"),("138214"),("870365"),("330957"),("992829"),("507902");
INSERT INTO `Case` (`reference_number`) VALUES ("122703"),("191558"),("720254"),("316845"),("987617"),("794692"),("522771"),("999568"),("850522"),("408022");

INSERT INTO `Article` (`material_number`,`description`,`case`) VALUES ("90","Gevärspipa",61),("44","Tops med saliv",85),("57","Gevärspipa",64),("88","Del av finger",18),("24","Bomullstopp med krutrester",9),("00","Tavla med blodstänk",98),("76","Dryckesglas",23),("29","Gevärspipa",95),("62","Dryckesglas",94),("93","Tavla med blodstänk",13);
INSERT INTO `Article` (`material_number`,`description`,`case`) VALUES ("82","Slagträ",5),("20","Revolver",43),("68","Del av finger",48),("62","Tomhylsa",6),("11","Glas-skärva",68),("51","Pilspets",64),("72","Tavla med blodstänk",78),("31","Tomhylsa",93),("62","Tavla med blodstänk",28),("31","Slagträ",24);
INSERT INTO `Article` (`material_number`,`description`,`case`) VALUES ("44","Kula",56),("15","Revolver",23),("28","Tavla med blodstänk",44),("77","Bomullstopp med krutrester",61),("08","Glas-skärva",12),("04","Pilspets",74),("26","Slagträ",88),("99","Pilspets",100),("03","Tavla med blodstänk",100),("55","Dryckesglas",67);
INSERT INTO `Article` (`material_number`,`description`,`case`) VALUES ("57","Pilspets",35),("57","Tavla med blodstänk",26),("56","Glas-skärva",43),("77","Slagträ",3),("01","Tomhylsa",55),("64","Tomhylsa",15),("45","Blodig kniv",50),("80","Tops med saliv",54),("99","Blodig kniv",35),("22","Revolver",53);
INSERT INTO `Article` (`material_number`,`description`,`case`) VALUES ("40","Glas-skärva",57),("59","Del av finger",51),("73","Bomullstopp med krutrester",43),("48","Kula",14),("59","Del av finger",19),("07","Revolver",80),("23","Tomhylsa",36),("21","Tops med saliv",37),("72","Del av finger",9),("66","Gevärspipa",55);
INSERT INTO `Article` (`material_number`,`description`,`case`) VALUES ("48","Blodig kniv",12),("89","Glas-skärva",42),("73","Blodig kniv",59),("48","Tops med saliv",19),("24","Bomullstopp med krutrester",69),("66","Tops med saliv",33),("55","Slagträ",8),("35","Gevärspipa",39),("09","Pilspets",1),("19","Bomullstopp med krutrester",1);
INSERT INTO `Article` (`material_number`,`description`,`case`) VALUES ("36","Tomhylsa",41),("91","Glas-skärva",60),("81","Dryckesglas",79),("70","Kula",15),("03","Bomullstopp med krutrester",68),("85","Glas-skärva",43),("37","Tavla med blodstänk",81),("96","Glas-skärva",82),("20","Slagträ",74),("99","Pilspets",11);
INSERT INTO `Article` (`material_number`,`description`,`case`) VALUES ("38","Del av finger",25),("73","Bomullstopp med krutrester",57),("10","Tops med saliv",4),("28","Slagträ",16),("10","Blodig kniv",12),("92","Tavla med blodstänk",72),("56","Tops med saliv",15),("29","Glas-skärva",52),("26","Del av finger",30),("54","Kula",82);
INSERT INTO `Article` (`material_number`,`description`,`case`) VALUES ("07","Kula",6),("44","Tomhylsa",76),("58","Dryckesglas",41),("92","Revolver",85),("69","Tavla med blodstänk",24),("41","Tops med saliv",44),("11","Tops med saliv",94),("68","Tops med saliv",24),("62","Tomhylsa",25),("62","Tavla med blodstänk",98);
INSERT INTO `Article` (`material_number`,`description`,`case`) VALUES ("53","Bomullstopp med krutrester",74),("87","Tops med saliv",53),("18","Tomhylsa",84),("75","Tops med saliv",41),("36","Tavla med blodstänk",82),("03","Gevärspipa",88),("86","Tavla med blodstänk",62),("50","Dryckesglas",31),("45","Del av finger",66);

INSERT INTO `Container` (`current_storage_room`) VALUES (3),(3),(2),(3),(1),(3),(3),(6),(2),(6);
INSERT INTO `Container` (`current_storage_room`) VALUES (6),(6),(1),(5),(3),(3),(2),(4),(3),(4);
INSERT INTO `Container` (`current_storage_room`) VALUES (5),(4),(5),(5),(6),(3),(4),(2),(5),(1);
INSERT INTO `Container` (`current_storage_room`) VALUES (5),(4),(4),(3),(1),(6),(4),(1),(1),(5);
INSERT INTO `Container` (`current_storage_room`) VALUES (3),(3),(1),(4),(4),(1),(1),(3),(5),(6);
INSERT INTO `Container` (`current_storage_room`) VALUES (6),(3),(2),(5),(1),(1),(1),(2),(6),(4);
INSERT INTO `Container` (`current_storage_room`) VALUES (3),(4),(2),(2),(2),(5),(2),(3),(3),(3);
INSERT INTO `Container` (`current_storage_room`) VALUES (3),(4),(3),(4),(5),(6),(1),(2),(3),(6);
INSERT INTO `Container` (`current_storage_room`) VALUES (5),(6),(4),(3),(1),(2),(4),(5),(6),(5);
INSERT INTO `Container` (`current_storage_room`) VALUES (2),(4),(1),(3),(2),(1),(1),(4),(4),(4);

INSERT INTO `Shelf` (`shelf_name`,`id`) VALUES ("A1",1),("A1",2),("A7",3),("B9",4),("B5",5),("A7",6),("A5",7),("B5",8),("Hylla 9",9),("Hylla 6",10);
INSERT INTO `Shelf` (`shelf_name`,`id`) VALUES ("Hylla 1",11),("B7",12),("A2",13),("B6",14),("Hylla 9",15),("Hylla 5",16),("Hylla 4",17),("Hylla 9",18),("A5",19),("A7",20);
INSERT INTO `Shelf` (`shelf_name`,`id`) VALUES ("Hylla 2",21),("Hylla 7",22),("Hylla 8",23),("B1",24),("Hylla 9",25),("Hylla 8",26),("Hylla 9",27),("Hylla 8",28),("B7",29),("B4",30);
INSERT INTO `Shelf` (`shelf_name`,`id`) VALUES ("Hylla 6",31),("B5",32),("A6",33),("Hylla 8",34),("B2",35),("A4",36),("A8",37),("A2",38),("B4",39),("A9",40);
INSERT INTO `Shelf` (`shelf_name`,`id`) VALUES ("A6",41),("A3",42),("B6",43),("A8",44),("Hylla 5",45),("Hylla 1",46),("B5",47),("A4",48),("A2",49),("Hylla 3",50);

INSERT INTO `Kolli` (`kolli_number`,`shelf`,`id`) VALUES ("K170",12,51),("K293",17,52),("K013",50,53),("K537",22,54),("K288",6,55),("K835",15,56),("K485",6,57),("K563",12,58),("K113",18,59),("K501",43,60);
INSERT INTO `Kolli` (`kolli_number`,`shelf`,`id`) VALUES ("K517",30,61),("K622",11,62),("K757",4,63),("K776",22,64),("K641",16,65),("K783",42,66),("K701",34,67),("K037",36,68),("K458",35,69),("K818",20,70);
INSERT INTO `Kolli` (`kolli_number`,`shelf`,`id`) VALUES ("K737",30,71),("K710",19,72),("K807",44,73),("K513",19,74),("K591",40,75),("K662",33,76),("K982",33,77),("K276",28,78),("K743",1,79),("K045",2,80);
INSERT INTO `Kolli` (`kolli_number`,`shelf`,`id`) VALUES ("K047",20,81),("K086",34,82),("K534",39,83),("K775",34,84),("K603",29,85),("K547",29,86),("K127",39,87),("K056",31,88),("K806",48,89),("K418",27,90);
INSERT INTO `Kolli` (`kolli_number`,`shelf`,`id`) VALUES ("K938",13,91),("K082",39,92),("K504",2,93),("K320",39,94),("K267",33,95),("K180",6,96),("K122",10,97),("K614",29,98),("K770",16,99),("K005",7,100);

INSERT INTO `StorageEvent` (`action`,`timestamp`,`user`,`container`,`storage_room`,`article`) VALUES ("checked_out","1520062989","1610023060099",77,4,49),("checked_out","1516611574","1676101513599",9,3,85),("discarded","1539288096","1689102196599",1,3,34),("discarded","1567994125","1676051441799",35,6,57),("discarded","1590937800","1635030447699",4,6,26),("checked_out","1586914731","1677022760599",24,2,38),("checked_out","1569715805","1667010631999",94,4,77),("processed","1524391123","1675101464999",94,6,48),("discarded","1533315476","1673042191199",88,3,56),("discarded","1516721245","1659030702699",63,2,14);
INSERT INTO `StorageEvent` (`action`,`timestamp`,`user`,`container`,`storage_room`,`article`) VALUES ("discarded","1555452548","1618040978099",77,3,1),("checked_in","1572503524","1626120140099",87,1,37),("processed","1539084553","1689052496099",83,2,15),("discarded","1601106049","1648100474399",81,2,13),("discarded","1562730334","1684082421599",97,4,10),("processed","1545912062","1694101826399",87,5,9),("checked_out","1538481013","1661100442699",53,2,69),("checked_in","1504855850","1607062002799",8,5,88),("checked_in","1527973935","1683050545599",6,4,87),("discarded","1583532173","1686121389299",97,1,66);
INSERT INTO `StorageEvent` (`action`,`timestamp`,`user`,`container`,`storage_room`,`article`) VALUES ("processed","1583840295","1692031588499",19,4,83),("checked_out","1521283743","1650011987999",77,2,35),("discarded","1515383371","1609090889699",12,1,8),("checked_in","1519931828","1616102592899",67,3,44),("checked_out","1570773385","1604102480399",26,3,37),("checked_out","1593867668","1619111533699",81,4,38),("checked_out","1541268292","1697120646199",67,2,49),("checked_out","1555148251","1672100851299",45,2,93),("checked_in","1561579412","1699110459499",87,6,67),("checked_in","1527156902","1676040479299",59,2,63);
INSERT INTO `StorageEvent` (`action`,`timestamp`,`user`,`container`,`storage_room`,`article`) VALUES ("checked_out","1564181210","1630071408199",91,4,97),("checked_in","1519313387","1641050417699",44,3,3),("checked_out","1593706091","1658092854899",2,3,55),("checked_in","1522897947","1632031158399",24,6,39),("checked_out","1594952018","1649072410099",37,6,10),("processed","1511053601","1624120679999",43,6,1),("processed","1542169431","1682082294699",47,2,55),("processed","1506644672","1677031990399",15,6,5),("checked_in","1570305042","1623100265799",64,2,12),("processed","1571046004","1692020805199",15,4,22);
INSERT INTO `StorageEvent` (`action`,`timestamp`,`user`,`container`,`storage_room`,`article`) VALUES ("checked_out","1554302535","1653042511999",31,4,67),("checked_in","1584477236","1638081956299",37,2,70),("checked_out","1550540831","1690082084999",43,3,38),("processed","1523483692","1685120765799",96,4,34),("processed","1558451147","1691010721299",78,5,99),("checked_out","1541664578","1633071196499",53,4,3),("processed","1599909056","1663051024999",33,3,66),("checked_out","1559096577","1623072417499",52,1,14),("checked_in","1572029495","1606042776599",53,2,15),("checked_in","1572907472","1685072386099",90,5,58);
INSERT INTO `StorageEvent` (`action`,`timestamp`,`user`,`container`,`storage_room`,`article`) VALUES ("processed","1526435597","1668040412899",62,3,59),("checked_in","1560980005","1614112644599",29,6,34),("processed","1537417156","1654103085099",65,6,27),("checked_out","1590645084","1653122050399",80,3,88),("processed","1523759715","1645110198699",56,3,18),("checked_out","1554190507","1637100518499",3,3,86),("checked_in","1505382633","1649062841299",49,4,25),("checked_in","1580090793","1663121863399",73,5,65),("checked_out","1556479507","1695101877199",38,6,46),("checked_out","1565049732","1602023042499",17,6,25);
INSERT INTO `StorageEvent` (`action`,`timestamp`,`user`,`container`,`storage_room`,`article`) VALUES ("checked_in","1521167662","1633020925399",26,1,91),("processed","1573806677","1649100783199",64,3,87),("discarded","1588655230","1695081407899",71,1,63),("checked_in","1567294575","1633061914699",30,6,20),("processed","1563966310","1683112852299",57,1,48),("processed","1531166277","1614122171999",2,5,43),("processed","1567619809","1608071308099",13,2,79),("checked_out","1552369234","1646062659799",52,6,56),("processed","1572446762","1653122246999",35,4,18),("checked_out","1525132958","1690011394899",69,4,64);
INSERT INTO `StorageEvent` (`action`,`timestamp`,`user`,`container`,`storage_room`,`article`) VALUES ("checked_in","1544779208","1643070881999",7,3,23),("checked_in","1558281205","1673092389499",80,1,11),("processed","1573958563","1634122877499",85,6,78),("discarded","1539367075","1660042769999",58,6,58),("checked_out","1548551548","1652031456799",14,2,45),("discarded","1508580979","1604021235599",72,4,71),("checked_out","1542612330","1681122880699",17,5,86),("checked_in","1599126380","1674043062899",4,6,52),("processed","1512412707","1664051729399",44,1,79),("checked_out","1555846412","1651043075599",94,3,94);
INSERT INTO `StorageEvent` (`action`,`timestamp`,`user`,`container`,`storage_room`,`article`) VALUES ("checked_out","1597363613","1696051140999",81,5,12),("checked_out","1554989016","1651041319399",45,1,9),("processed","1539389350","1638122936799",54,5,44),("discarded","1585511851","1671032029999",99,3,9),("checked_out","1557631372","1612080602899",87,3,66),("checked_in","1555405575","1658111743799",39,6,77),("processed","1518250969","1667052534699",38,5,99),("checked_out","1588826096","1661032507699",59,4,89),("discarded","1601220766","1623072716099",37,4,65),("checked_out","1515213862","1609032331899",12,1,68);
INSERT INTO `StorageEvent` (`action`,`timestamp`,`user`,`container`,`storage_room`,`article`) VALUES ("checked_in","1596660262","1643121710099",99,1,15),("checked_out","1557267464","1697093089099",86,1,62),("checked_out","1543826266","1609121785199",25,1,77),("checked_out","1534168106","1677101235699",14,4,71),("discarded","1566292314","1653021260899",94,2,46),("processed","1547428327","1650082369899",58,1,46),("discarded","1576987353","1653022421999",28,5,52),("checked_in","1586169577","1677083015899",41,6,94),("processed","1582108089","1657081673599",24,1,62),("checked_out","1563671655","1666121148999",21,2,83);

INSERT INTO `StorageMap` (`article`,`container`) VALUES (1,61),(2,48),(3,72),(4,83),(5,85),(6,94),(7,73),(8,91),(9,28),(10,13);
INSERT INTO `StorageMap` (`article`,`container`) VALUES (11,40),(12,95),(13,41),(14,56),(15,89),(16,1),(17,84),(18,1),(19,40),(20,89);
INSERT INTO `StorageMap` (`article`,`container`) VALUES (21,51),(22,19),(23,85),(24,73),(25,2),(26,61),(27,23),(28,37),(29,18),(30,24);
INSERT INTO `StorageMap` (`article`,`container`) VALUES (31,99),(32,59),(33,73),(34,59),(35,55),(36,74),(37,43),(38,66),(39,20),(40,13);
INSERT INTO `StorageMap` (`article`,`container`) VALUES (41,30),(42,63),(43,69),(44,100),(45,2),(46,83),(47,59),(48,29),(49,5),(50,98);
INSERT INTO `StorageMap` (`article`,`container`) VALUES (51,20),(52,89),(53,5),(54,10),(55,92),(56,93),(57,3),(58,16),(59,10),(60,20);
INSERT INTO `StorageMap` (`article`,`container`) VALUES (61,94),(62,26),(63,100),(64,7),(65,27),(66,51),(67,87),(68,38),(69,46),(70,67);
INSERT INTO `StorageMap` (`article`,`container`) VALUES (71,92),(72,96),(73,72),(74,30),(75,97),(76,87),(77,86),(78,90),(79,56),(80,48);
INSERT INTO `StorageMap` (`article`,`container`) VALUES (81,14),(82,92),(83,93),(84,3),(85,77),(86,32),(87,8),(88,22),(89,38),(90,19);
INSERT INTO `StorageMap` (`article`,`container`) VALUES (91,44),(92,23),(93,69),(94,46),(95,99),(96,39),(97,90),(98,18),(99,49);