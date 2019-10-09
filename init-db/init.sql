CREATE DATABASE IF NOT EXISTS dev;
USE dev;

DROP TABLE IF EXISTS `StorageEvent`;
DROP TABLE IF EXISTS `StorageMap`;
DROP TABLE IF EXISTS `Branch`;
DROP TABLE IF EXISTS `StorageRoom`;
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
	`parent` INT,
	`case` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `StorageEvent` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`action` varchar(30) NOT NULL,
	`timestamp` INT(10) NOT NULL,
	`user` VARCHAR(255) NOT NULL,
	`comment` varchar(255),
	`placement` varchar(255) NOT NULL,
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
	`storage_room` INT NOT NULL,
	`article` INT NOT NULL,
	`placement` varchar(255) NOT NULL,
	PRIMARY KEY (`storage_room`,`article`)
);

CREATE TABLE `Branch` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar(60) NOT NULL UNIQUE,
	PRIMARY KEY (`id`)
);

ALTER TABLE `Article` ADD CONSTRAINT `Article_fk0` FOREIGN KEY (`parent`) REFERENCES `Article`(`id`);

ALTER TABLE `Article` ADD CONSTRAINT `Article_fk1` FOREIGN KEY (`case`) REFERENCES `Case`(`id`);

ALTER TABLE `Article` ADD CONSTRAINT `Article_case_material_unique` UNIQUE(`material_number`, `case`);

ALTER TABLE `StorageEvent` ADD CONSTRAINT `StorageEvent_fk0` FOREIGN KEY (`storage_room`) REFERENCES `StorageRoom`(`id`);

ALTER TABLE `StorageEvent` ADD CONSTRAINT `StorageEvent_fk1` FOREIGN KEY (`article`) REFERENCES `Article`(`id`);

ALTER TABLE `StorageRoom` ADD CONSTRAINT `StorageRoom_fk0` FOREIGN KEY (`branch`) REFERENCES `Branch`(`id`);

ALTER TABLE `StorageMap` ADD CONSTRAINT `StorageMap_fk0` FOREIGN KEY (`storage_room`) REFERENCES `StorageRoom`(`id`);

ALTER TABLE `StorageMap` ADD CONSTRAINT `StorageMap_fk1` FOREIGN KEY (`article`) REFERENCES `Article`(`id`);

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

INSERT INTO `StorageEvent` (`action`,`timestamp`,`user`,`storage_room`,`article`,`comment`,`placement`) VALUES ("processed","1513479703","1665070228699",6,51,"Transport","Hylla 5"),("check_out","1518160410","1650080689799",5,74,"","B7"),("processed","1531038529","1623120375299",4,73,"Labb","Hylla 9"),("discarded","1558304271","1634030398799",3,20,"","A2"),("check_in","1594782905","1676070316499",3,64,"Undersökning","Hylla 1"),("processed","1566845933","1694102258899",1,82,"","A9"),("check_in","1595657124","1698101814899",2,21,"","A7"),("processed","1549507950","1697081937899",5,34,"","B9"),("discarded","1545368574","1613091430299",2,43,"Labb","Hylla 8"),("processed","1517583284","1675121482199",4,41,"","B2");
INSERT INTO `StorageEvent` (`action`,`timestamp`,`user`,`storage_room`,`article`,`comment`,`placement`) VALUES ("discarded","1510157046","1632072386699",1,28,"","Hylla 9"),("discarded","1518598808","1698030725099",1,84,"","B9"),("processed","1583037177","1621101622699",3,23,"","Hylla 5"),("processed","1556236468","1699070297199",1,70,"","A8"),("check_out","1553822501","1640111121899",5,19,"","B2"),("check_out","1582183106","1642122212699",2,80,"","Hylla 8"),("check_in","1575311513","1686020324299",2,85,"Labb","Hylla 5"),("discarded","1593206996","1612082210999",5,16,"Undersökning","Hylla 2"),("discarded","1578930082","1676022702399",3,61,"Transport","Hylla 1"),("check_out","1583833040","1632042282399",3,69,"Labb","B4");
INSERT INTO `StorageEvent` (`action`,`timestamp`,`user`,`storage_room`,`article`,`comment`,`placement`) VALUES ("check_in","1533470885","1646081853099",4,31,"Undersökning","A8"),("processed","1589380603","1686110758099",5,39,"","Hylla 8"),("discarded","1516531367","1635102485399",1,46,"","A6"),("check_in","1548020152","1649030725199",5,48,"","Hylla 4"),("check_in","1542013296","1657120177099",1,81,"","A3"),("discarded","1588093255","1664062904299",1,82,"","B2"),("check_in","1540069518","1673061457099",2,67,"Labb","A3"),("discarded","1554988465","1694030264299",4,42,"","Hylla 4"),("check_out","1564715713","1624010696899",5,26,"","B5"),("check_in","1517844941","1605012524599",4,82,"Transport","A8");
INSERT INTO `StorageEvent` (`action`,`timestamp`,`user`,`storage_room`,`article`,`comment`,`placement`) VALUES ("check_in","1563490996","1688072908999",2,65,"Undersökning","Hylla 8"),("check_out","1564400609","1660122320599",6,66,"","B4"),("discarded","1572831206","1685042262299",6,50,"","B1"),("discarded","1590491660","1640090221699",5,40,"Labb","Hylla 6"),("processed","1514925421","1625052224999",4,26,"","A7"),("discarded","1589394465","1674052718499",5,56,"","B1"),("discarded","1580183688","1655060501099",5,22,"","B6"),("discarded","1553554201","1665070527599",4,32,"Transport","B5"),("check_in","1531671037","1618071907399",4,60,"Undersökning","Hylla 6"),("discarded","1566573383","1648122832399",5,77,"Undersökning","Hylla 9");
INSERT INTO `StorageEvent` (`action`,`timestamp`,`user`,`storage_room`,`article`,`comment`,`placement`) VALUES ("discarded","1552728641","1630111257499",4,13,"","Hylla 2"),("processed","1556945401","1654101270799",3,46,"Labb","A9"),("check_out","1559159689","1666070754299",2,46,"","Hylla 7"),("discarded","1527632625","1606101240399",1,15,"Labb","Hylla 7"),("discarded","1572879288","1630080814799",5,7,"","Hylla 7"),("discarded","1585447811","1663102107599",1,27,"","B2"),("check_out","1571594616","1617061216399",5,62,"","B7"),("check_out","1570927614","1626011710899",3,12,"Undersökning","B4"),("check_out","1552942078","1676012382499",5,2,"Transport","Hylla 2"),("discarded","1550367855","1618051036199",2,38,"","A6");
INSERT INTO `StorageEvent` (`action`,`timestamp`,`user`,`storage_room`,`article`,`comment`,`placement`) VALUES ("check_in","1574504216","1658090738199",1,32,"","B6"),("discarded","1510739504","1648023048699",3,28,"Transport","B9"),("check_in","1549895201","1666122640699",2,3,"","B4"),("check_out","1594690037","1647071161899",6,47,"Undersökning","Hylla 3"),("check_in","1591684992","1696062407499",5,41,"Transport","A1"),("processed","1576785703","1664090670199",4,67,"Transport","B1"),("check_out","1533831982","1658102820899",5,36,"","B6"),("discarded","1595059212","1684032349399",5,49,"","Hylla 2"),("check_in","1524948616","1676050894199",4,68,"Undersökning","B2"),("processed","1585152656","1602121491799",1,15,"","B3");
INSERT INTO `StorageEvent` (`action`,`timestamp`,`user`,`storage_room`,`article`,`comment`,`placement`) VALUES ("discarded","1552887552","1674110139699",3,80,"","A3"),("check_out","1512409410","1670101075999",1,72,"","B3"),("check_out","1564555500","1651042943999",6,84,"","Hylla 2"),("discarded","1516480603","1649121025599",2,15,"","B7"),("check_out","1568225279","1642051992899",3,17,"Labb","A7"),("processed","1596636020","1697120538699",3,41,"Transport","Hylla 3"),("check_in","1585560791","1637030667399",3,63,"","Hylla 7"),("discarded","1579886058","1645040147399",2,69,"","A4"),("processed","1527920009","1654050987899",3,34,"","Hylla 2"),("discarded","1595959373","1666051207999",4,44,"","B3");
INSERT INTO `StorageEvent` (`action`,`timestamp`,`user`,`storage_room`,`article`,`comment`,`placement`) VALUES ("processed","1590600451","1699030925499",6,43,"","A7"),("check_in","1518924973","1618110238899",1,89,"","Hylla 7"),("check_out","1543052591","1683032983999",3,59,"","A1"),("discarded","1552643324","1627113064399",1,83,"","Hylla 3"),("check_out","1599244870","1620120176199",3,49,"Transport","B1"),("check_out","1567758461","1637071579399",4,88,"Labb","B4"),("check_out","1567821583","1681021810499",4,81,"","Hylla 1"),("check_in","1575750010","1605061046899",1,54,"","B1"),("check_out","1539699395","1696082745699",2,23,"Labb","A5"),("discarded","1597355308","1675110445899",3,36,"","Hylla 9");
INSERT INTO `StorageEvent` (`action`,`timestamp`,`user`,`storage_room`,`article`,`comment`,`placement`) VALUES ("discarded","1566808608","1609110254599",5,84,"","Hylla 8"),("check_in","1549180505","1643072282899",5,24,"","A7"),("check_in","1527370792","1676042943399",2,46,"Labb","A6"),("processed","1522885650","1603092054899",5,24,"Undersökning","A5"),("discarded","1586912452","1619072100599",3,54,"","A5"),("processed","1553078598","1616100137799",3,66,"Undersökning","Hylla 2"),("processed","1507832983","1632022635499",2,81,"Transport","Hylla 6"),("discarded","1516547263","1609082217199",1,66,"","A7"),("check_in","1569220723","1617022768899",3,82,"","B7"),("check_in","1570706288","1684052526999",1,12,"","B4");
INSERT INTO `StorageEvent` (`action`,`timestamp`,`user`,`storage_room`,`article`,`comment`,`placement`) VALUES ("processed","1535486586","1616011199899",2,89,"","B3"),("discarded","1581288681","1671032389199",2,67,"","Hylla 2"),("check_out","1507550381","1659110234399",5,81,"","A4"),("discarded","1601039017","1688012999799",1,33,"Transport","B9"),("discarded","1546861894","1610111708599",5,46,"Undersökning","Hylla 8"),("check_out","1559033963","1671070515299",5,54,"Undersökning","A5"),("discarded","1586097048","1613062181199",1,31,"","B2"),("discarded","1571110453","1683062416599",1,59,"","Hylla 6"),("check_out","1538419299","1648071069899",3,46,"Undersökning","A3"),("processed","1553971546","1606011405399",4,43,"","A4");

INSERT INTO `StorageMap` (`storage_room`,`article`,`placement`) VALUES (5,1,"Hylla 4"),(5,2,"B3"),(5,3,"B10"),(3,4,"Hylla 1"),(1,5,"B3"),(1,6,"Hylla 1"),(1,7,"A4"),(1,8,"A6"),(1,9,"A9"),(2,10,"Hylla 7");
INSERT INTO `StorageMap` (`storage_room`,`article`,`placement`) VALUES (4,11,"B1"),(2,12,"B10"),(2,13,"Hylla 8"),(5,14,"Hylla 9"),(4,15,"A2"),(2,16,"Hylla 1"),(5,17,""),(4,18,"B3"),(1,19,"B2"),(4,20,"Hylla 1");
INSERT INTO `StorageMap` (`storage_room`,`article`,`placement`) VALUES (3,21,"Hylla 5"),(2,22,"B9"),(2,23,"A9"),(1,24,"B5"),(2,25,"B3"),(3,26,"B5"),(1,27,"Hylla 1"),(4,28,"B5"),(2,29,"A2"),(4,30,"Hylla 7");
INSERT INTO `StorageMap` (`storage_room`,`article`,`placement`) VALUES (2,31,"B3"),(3,32,"B7"),(2,33,"Hylla 9"),(2,34,"Hylla 5"),(3,35,"A4"),(1,36,"A2"),(3,37,"A2"),(5,38,"Hylla 8"),(5,39,"Hylla 9"),(1,40,"B3");
INSERT INTO `StorageMap` (`storage_room`,`article`,`placement`) VALUES (4,41,"Hylla 3"),(1,42,"Hylla 6"),(3,43,"B1"),(3,44,"Hylla 9"),(4,45,"B2"),(5,46,"Hylla 6"),(3,47,"A3"),(1,48,"B6"),(2,49,"B10"),(1,50,"A1");
INSERT INTO `StorageMap` (`storage_room`,`article`,`placement`) VALUES (1,51,"A3"),(3,52,"A4"),(3,53,"B4"),(4,54,"Hylla 8"),(2,55,"A5"),(2,56,"B3"),(4,57,"Hylla 4"),(2,58,"Hylla 4"),(5,59,"B1"),(4,60,"B4");
INSERT INTO `StorageMap` (`storage_room`,`article`,`placement`) VALUES (5,61,"A3"),(3,62,"A6"),(5,63,"Hylla 4"),(3,64,"B9"),(4,65,"B6"),(3,66,"A6"),(1,67,"B9"),(1,68,"Hylla 5"),(2,69,"B6"),(2,70,"A7");
INSERT INTO `StorageMap` (`storage_room`,`article`,`placement`) VALUES (5,71,"B5"),(3,72,"A4"),(5,73,"B2"),(3,74,"Hylla 4"),(4,75,"A7"),(5,76,"A4"),(4,77,"B2"),(3,78,"A7"),(4,79,"A2"),(1,80,"Hylla 1");
INSERT INTO `StorageMap` (`storage_room`,`article`,`placement`) VALUES (4,81,""),(1,82,"Hylla 7"),(4,83,""),(5,84,"Hylla 2"),(5,85,"A7"),(5,86,"A7"),(5,87,"Hylla 8"),(5,88,"Hylla 5"),(5,89,"Hylla 4"),(3,90,"B9");
INSERT INTO `StorageMap` (`storage_room`,`article`,`placement`) VALUES (1,91,"A4"),(2,92,"B7"),(4,93,"Hylla 7"),(3,94,"A4"),(2,95,"B9"),(2,96,"A1"),(1,97,"B7"),(5,98,"Hylla 9"),(2,99,"Hylla 9"),(2,82,"B1");