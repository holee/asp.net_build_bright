/*
MariaDB Backup
Database: empmgt
Backup Time: 2020-03-19 11:46:19
*/

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `empmgt`.`department`;
DROP TABLE IF EXISTS `empmgt`.`employee`;
CREATE TABLE `department` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `DepartmentName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
CREATE TABLE `employee` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `DepartmentId` int(11) DEFAULT NULL,
  `Name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Gender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
BEGIN;
LOCK TABLES `empmgt`.`department` WRITE;
DELETE FROM `empmgt`.`department`;
INSERT INTO `empmgt`.`department` (`Id`,`DepartmentName`) VALUES (1, 'staff'),(2, 'HR');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `empmgt`.`employee` WRITE;
DELETE FROM `empmgt`.`employee`;
INSERT INTO `empmgt`.`employee` (`Id`,`DepartmentId`,`Name`,`Gender`,`Address`) VALUES (1, 2, 'mon minh', 'male', 'siem reap'),(2, 1, 'eee', 'male', 'siem reap'),(3, 1, 'name', 'femlae', 'kandal');
UNLOCK TABLES;
COMMIT;
