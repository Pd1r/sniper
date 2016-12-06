-- 1.liwf:2015-9-25 test(done) pro()
-- payrecord表增加transAmount字段

alter table payrecord add transAmount varchar(10);


-- 2.liwf:2015-9-25 test(done) pro()
-- authenticateRecord表增加bankCardNo，bankCardAccountName，mobile，requestInfo，responseInfo字段

alter table authenticateRecord add bankCardNo varchar(40);

alter table authenticateRecord add bankCardAccountName varchar(40);

alter table authenticateRecord add mobile varchar(20);

alter table authenticateRecord add requestInfo varchar(4000);

alter table authenticateRecord add responseInfo varchar(4000);

-- 2.liwf:2015-9-28 test(done) pro()
-- 创建认证log表
CREATE TABLE `authenticatelog` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `businessCode` varchar(30) DEFAULT NULL,
  `extraCode` varchar(30) DEFAULT NULL,
  `GateWay` varchar(10) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `msg` varchar(200) DEFAULT NULL,
  `detailInfo` varchar(4000) DEFAULT NULL,
  `responseMsg` varchar(4000) DEFAULT NULL,
  `backCode` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;