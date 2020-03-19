/*
MariaDB Backup
Database: empmgts
Backup Time: 2020-03-19 11:47:31
*/

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `empmgts`.`__efmigrationshistory`;
DROP TABLE IF EXISTS `empmgts`.`departments`;
DROP TABLE IF EXISTS `empmgts`.`employees`;
CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(95) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `departments` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `DepartmentName` longtext NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
CREATE TABLE `employees` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` longtext NOT NULL,
  `Gender` longtext NOT NULL,
  `DepartmentId` int(11) NOT NULL,
  `Address` longtext NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_Employees_DepartmentId` (`DepartmentId`),
  CONSTRAINT `FK_Employees_Departments_DepartmentId` FOREIGN KEY (`DepartmentId`) REFERENCES `departments` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
BEGIN;
LOCK TABLES `empmgts`.`__efmigrationshistory` WRITE;
DELETE FROM `empmgts`.`__efmigrationshistory`;
INSERT INTO `empmgts`.`__efmigrationshistory` (`MigrationId`,`ProductVersion`) VALUES ('20200318042605_start', '3.1.2');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `empmgts`.`departments` WRITE;
DELETE FROM `empmgts`.`departments`;
INSERT INTO `empmgts`.`departments` (`Id`,`DepartmentName`) VALUES (1, 'staff'),(2, 'HR'),(3, 'Admins');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `empmgts`.`employees` WRITE;
DELETE FROM `empmgts`.`employees`;
INSERT INTO `empmgts`.`employees` (`Id`,`Name`,`Gender`,`DepartmentId`,`Address`) VALUES (1, 'name', 'male', 1, 'siem reap'),(2, 'seng kry', 'femlae', 1, 'kandal');
UNLOCK TABLES;
COMMIT;
