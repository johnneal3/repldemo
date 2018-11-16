-- ----------------------------
--  Table structure for `Player`
-- ----------------------------
-- DROP TABLE IF EXISTS `Player`;
CREATE TABLE IF NOT EXISTS `Player` (
  `playerID` varchar(64) NOT NULL,
  `birthYear` int(11) DEFAULT NULL,
  `birthMonth` int(11) DEFAULT NULL,
  `birthDay` int(11) DEFAULT NULL,
  `birthCountry` varchar(64) DEFAULT NULL,
  `birthState` varchar(64) DEFAULT NULL,
  `birthCity` varchar(64) DEFAULT NULL,
  `deathYear` varchar(64) DEFAULT NULL,
  `deathMonth` varchar(64) DEFAULT NULL,
  `deathDay` varchar(64) DEFAULT NULL,
  `deathCountry` varchar(64) DEFAULT NULL,
  `deathState` varchar(64) DEFAULT NULL,
  `deathCity` varchar(64) DEFAULT NULL,
  `nameFirst` varchar(64) DEFAULT NULL,
  `nameLast` varchar(64) DEFAULT NULL,
  `nameGiven` varchar(64) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `bats` varchar(64) DEFAULT NULL,
  `throws` varchar(64) DEFAULT NULL,
  `debut` varchar(64) DEFAULT NULL,
  `finalGame` varchar(64) DEFAULT NULL,
  `retroID` varchar(64) DEFAULT NULL,
  `bbrefID` varchar(64) DEFAULT NULL,
  PRIMARY KEY(`playerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

