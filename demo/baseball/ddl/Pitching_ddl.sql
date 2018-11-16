-- ----------------------------
--  Table structure for `Pitching`
-- ----------------------------
-- DROP TABLE IF EXISTS `Pitching`;
CREATE TABLE IF NOT EXISTS `Pitching` (
  `playerID` varchar(64) NOT NULL,
  `yearID` int(11) NOT NULL,
  `stintID` int(11) DEFAULT NULL,
  `teamID` varchar(64) NOT NULL,
  `lgID` varchar(64) NOT NULL,
  `W` int(11) DEFAULT NULL,
  `L` int(11) DEFAULT NULL,
  `G` int(11) DEFAULT NULL,
  `GS` int(11) DEFAULT NULL,
  `CG` int(11) DEFAULT NULL,
  `SHO` int(11) DEFAULT NULL,
  `SV` int(11) DEFAULT NULL,
  `IPouts` int(11) DEFAULT NULL,
  `H` int(11) DEFAULT NULL,
  `ER` int(11) DEFAULT NULL,
  `HR` int(11) DEFAULT NULL,
  `BB` int(11) DEFAULT NULL,
  `SO` int(11) DEFAULT NULL,
  `BAOpp` varchar(64) DEFAULT NULL,
  `ERA` float DEFAULT NULL,
  `IBB` varchar(64) DEFAULT NULL,
  `WP` varchar(64) DEFAULT NULL,
  `HBP` varchar(64) DEFAULT NULL,
  `BK` int(11) DEFAULT NULL,
  `BFP` varchar(64) DEFAULT NULL,
  `GF` varchar(64) DEFAULT NULL,
  `R` int(11) DEFAULT NULL,
  `SH` varchar(64) DEFAULT NULL,
  `SF` varchar(64) DEFAULT NULL,
  `GIDP` varchar(64) DEFAULT NULL,
  PRIMARY KEY(`playerID`, `yearID`, `stintID`, `teamID`, `lgID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

