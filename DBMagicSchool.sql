--UserTable
Drop TABLE IF EXISTS `users`;
CREATE TABLE `users`(
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `information` text,
  `office` varchar(20) NOT NULL,
  `enable` varchar(10) NOT NULL, 
  PRIMARY KEY(`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
--CourseTable
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`(
	`id` int(11) NOT NULL AUTO_INCREMENT COLLATE utf8_unicode_ci NOT NULL,
	`coursename` VARCHAR(255) COLLATE utf8_unicode_ci NOT NULL,
	`TinyDes` varchar(255) COLLATE utf8_unicode_ci,
  	`FullDes` text COLLATE utf8_unicode_ci,
	`catID` int(11) NOT NULL,
	`teacherID` int(11) NOT NULL,
	`price` int(11),
	`updateDate` DATE NOT NULL,
	`complete` varchar(10),
	`enable` varchar(10) NOT NULL,
	PRIMARY KEY(`id`)
)ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
--evaluateTable
DROP TABLE IF EXISTS `evaluate`;
CREATE TABLE `evaluate`(
	`userID` int(11) NOT NULL,
	`courseID` int(11) NOT NULL,
	`point` int(11) NOT NULL,
	`feedback` text COLLATE utf8_unicode_ci NOT NULL,
	`date` DATE NOT NULL,
	PRIMARY KEY(`userID`,`courseID`)
)ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
--categoryTable
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`(
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(50) NOT NULL,
	`parentCat` int(11),
	PRIMARY KEY(`id`)
)ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
--ChapterTable
DROP TABLE IF EXISTS `chapter`;
CREATE TABLE `chapter`(
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` TEXT  COLLATE utf8_unicode_ci NOT NULL,
	`courseID` INT(11) NOT NULL,
	`publiOrPrivate` VARCHAR(20) NOT NULL,
	`updateDate` DATE,
	PRIMARY KEY(`id`)
)ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
--cartTable
DROP TABLE IF EXISTS`cart`;
--watchList
DROP TABLE IF EXISTS `watchList`;
CREATE TABLE `watchList` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`userID` INT(11) NOT NULL,
	`courseID` INT(11) NOT NULL,
	`date` DATE NOT NULL,
	PRIMARY KEY(`id`)
)ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
--ownList
DROP TABLE IF EXISTS `ownList`;
CREATE TABLE `ownList` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`userID` INT(11) NOT NULL,
	`courseID` INT(11) NOT NULL,
	`date` DATE NOT NULL,
	PRIMARY KEY(`id`)
)ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

SET FOREIGN_KEY_CHECKS = 1;



INSERT INTO `category` (`name`) VALUES
('Development');

INSERT INTO `category` (`name`) VALUES
('IT & Software');

INSERT INTO `category` (`name`) VALUES
('Design');
INSERT INTO `category` (`name`, `parentCat`) VALUES
('Web Development', '1');

INSERT INTO `category` (`name`, `parentCat`) VALUES
('Mobile Development', '1');

INSERT INTO `category` (`name`, `parentCat`) VALUES
('Game Development', '1');

INSERT INTO `category` (`name`, `parentCat`) VALUES
('Network & Security', '2');

INSERT INTO `category` (`name`, `parentCat`) VALUES
('Hardware', '2');

INSERT INTO `category` (`name`, `parentCat`) VALUES
('3D & Animation', '3');

INSERT INTO `category` (`name`, `parentCat`) VALUES
('Game Design', '3');

INSERT INTO `category` (`name`, `parentCat`) VALUES
('Web Design', '3');

