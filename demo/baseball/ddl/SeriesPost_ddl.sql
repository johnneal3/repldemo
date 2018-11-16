-- ----------------------------
--  Table structure for `SeriesPost`
-- ----------------------------
-- DROP TABLE IF EXISTS `SeriesPost`;
CREATE TABLE IF NOT EXISTS `SeriesPost` (
  `yearID` int(11) NOT NULL,
  `roundID` varchar(64) DEFAULT NULL,
  `winnerID` varchar(64) DEFAULT NULL,
  `lgIDwinner` varchar(64) DEFAULT NULL,
  `loserID` varchar(64) DEFAULT NULL,
  `lgIDloser` varchar(64) DEFAULT NULL,
  `wins` int(11) DEFAULT NULL,
  `losses` int(11) DEFAULT NULL,
  `ties` int(11) DEFAULT NULL,
  PRIMARY KEY(`yearID`, `roundID`, `winnerID`, `loserid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

