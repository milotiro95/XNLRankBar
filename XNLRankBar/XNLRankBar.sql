CREATE TABLE IF NOT EXISTS `experience` (
    `cid` varchar(50) NOT NULL,
    `driving` int(11) DEFAULT 0,
    `crafting` int(11) DEFAULT 0,
    UNIQUE KEY `unique_cid` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;