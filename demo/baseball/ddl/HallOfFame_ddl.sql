-- ----------------------------
--  Table structure for `HallOfFame`
-- ----------------------------
-- DROP TABLE IF EXISTS `HallOfFame`;
CREATE TABLE IF NOT EXISTS `HallOfFame` (
  `playerID` varchar(64) NOT NULL,
  `yearID` int(11) NOT NULL,
  `votedByID` varchar(64) DEFAULT NULL,
  `ballots` int(11) DEFAULT NULL,
  `needed` int(11) DEFAULT NULL,
  `votes` int(11) DEFAULT NULL,
  `inducted` varchar(64) DEFAULT NULL,
  `category` varchar(64) DEFAULT NULL,
  `needed_note` varchar(64) DEFAULT NULL,
  PRIMARY KEY(`playerID`, `yearID`, `votedByID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

