-- ----------------------------
--  Table structure for `BattingPost`
-- ----------------------------
-- DROP TABLE IF EXISTS `BattingPost`;
CREATE TABLE IF NOT EXISTS `BattingPost` (
  `yearID` int(11) NOT NULL,
  `roundID` varchar(64) DEFAULT NULL,
  `playerID` varchar(64) NOT NULL,
  `teamID` varchar(64) NOT NULL,
  `lgID` varchar(64) NOT NULL,
  `G` int(11) DEFAULT NULL,
  `AB` int(11) DEFAULT NULL,
  `R` int(11) DEFAULT NULL,
  `H` int(11) DEFAULT NULL,
  `B2` int(11) DEFAULT NULL,
  `B3` int(11) DEFAULT NULL,
  `HR` int(11) DEFAULT NULL,
  `RBI` int(11) DEFAULT NULL,
  `SB` int(11) DEFAULT NULL,
  `CS` varchar(64) DEFAULT NULL,
  `BB` int(11) DEFAULT NULL,
  `SO` int(11) DEFAULT NULL,
  `IBB` int(11) DEFAULT NULL,
  `HBP` varchar(64) DEFAULT NULL,
  `SH` varchar(64) DEFAULT NULL,
  `SF` varchar(64) DEFAULT NULL,
  `GIDP` varchar(64) DEFAULT NULL,
  PRIMARY KEY(`yearID`, `roundID`, `playerID`, `teamID`, `lgID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

