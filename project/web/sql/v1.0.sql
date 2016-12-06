-- liwf:2015-9-22 test(done) pro(done)
-- create `paylog` table
CREATE TABLE `paylog` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `businessCode` varchar(30) DEFAULT NULL COMMENT 'ҵ����ˮ��',
  `gateWay` varchar(255) DEFAULT '' COMMENT '����',
  `payResult` varchar(255) DEFAULT '' COMMENT '֧�����',
  `msg` varchar(255) DEFAULT '' COMMENT '�����������Ϣ',
  `transAmount` decimal(10,2) DEFAULT NULL COMMENT '���׽��',
  `transDate` datetime DEFAULT NULL COMMENT '����ʱ��',
  `backode` varchar(255) DEFAULT '' COMMENT '�������',
  `mongoId` varchar(255) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifyDate` datetime DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `detailInfo` varchar(4000) DEFAULT NULL,
  `commandType` varchar(100) DEFAULT NULL,
  `payCode` varchar(30) DEFAULT NULL,
  `responseMsg` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1376 DEFAULT CHARSET=utf8;

-- create `authenticaterecord` table
CREATE TABLE `authenticaterecord` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `businessCode` varchar(50) DEFAULT NULL,
  `gateCode` varchar(31) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `msg` varchar(255) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_businesscode` (`businessCode`)
) ENGINE=InnoDB AUTO_INCREMENT=535 DEFAULT CHARSET=utf8;


-- create `payrecord` table
CREATE TABLE `payrecord` (
  `businessCode` varchar(30) NOT NULL,
  `payCode` varchar(30) NOT NULL,
  `gateCode` varchar(10) NOT NULL,
  `createDate` datetime NOT NULL,
  `payResult` varchar(50) DEFAULT NULL,
  `modifyDate` datetime DEFAULT NULL,
  UNIQUE KEY `index_orderNo` (`businessCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- create `threadstatisticslog` table

CREATE TABLE `threadstatisticslog` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `gateCode` varchar(10) DEFAULT NULL,
  `methodName` varchar(20) DEFAULT NULL,
  `currentThreadNum` int(10) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=580 DEFAULT CHARSET=utf8;

