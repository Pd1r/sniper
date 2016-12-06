-- 1.liwf:2015-10-19 test(done) pro(done)
-- ��AuthenticateLog������orderSpecificCode�ֶ�,payLog��������bankCode,bankName�ֶ�

alter table AuthenticateLog add orderSpecificCode varchar(60);

alter table payLog add bankCode varchar(20);
alter table payLog add bankName varchar(20);

alter table AuthenticateLog add bankCode varchar(20);
alter table AuthenticateLog add bankName varchar(20);

-- 2.ycs:2015-10-26 test(done) pro()
-- ��payLog��������identityid�ֶ�
alter table payLog add identityid varchar(50);


-- 2.liwf:2015-11-02 test(done) pro()
-- ��payLog������realTransAmount�ֶ�
alter table payLog add realTransAmount decimal(10,2);

-- 3.liwf:2015-11-04 test(done) pro()
CREATE TABLE `alarmconfig` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `modifyDate` datetime DEFAULT NULL,
  `period` int(10) DEFAULT NULL,
  `count` int(10) DEFAULT NULL,
  `way` varchar(100) DEFAULT NULL,
  `notifyList` varchar(1000) DEFAULT NULL,
  `alarmLevelId` int(11) NOT NULL,
  `enabled` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;


CREATE TABLE `alarmlevel` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `modifyDate` datetime DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;


CREATE TABLE `alarmlog` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `modifyDate` datetime DEFAULT NULL,
  `gateWay` varchar(255) DEFAULT NULL,
  `msg` varchar(1000) DEFAULT NULL,
  `way` varchar(10) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `payResultCategoryId` int(11) DEFAULT NULL,
  `lastAlarmDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;

CREATE TABLE `payresultcategory` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `modifyDate` datetime DEFAULT NULL,
  `alarmLevelId` int(11) NOT NULL,
  `gateWay` varchar(255) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  `msg` varchar(400) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `handled` int(1) DEFAULT NULL,
  `lastAlarmDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;


