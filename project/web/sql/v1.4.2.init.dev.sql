-- 银行表信息初始化数据  bankinfo
INSERT INTO `bankinfo` VALUES (null, '工商银行', '01020000', 0, now(), now());
INSERT INTO `bankinfo` VALUES (null, '农业银行', '01030000', 0, now(), now());
INSERT INTO `bankinfo` VALUES (null, '中国银行', '01040000', 0, now(), now());
INSERT INTO `bankinfo` VALUES (null, '建设银行', '01050000', 0, now(), now());
INSERT INTO `bankinfo` VALUES (null, '招商银行', '03080000', 0, now(), now());
INSERT INTO `bankinfo` VALUES (null, '浦发银行', '03100000', 0, now(), now());
INSERT INTO `bankinfo` VALUES (null, '光大银行', '03030000', 0, now(), now());
INSERT INTO `bankinfo` VALUES (null, '平安银行', '03070000', 0, now(), now());
INSERT INTO `bankinfo` VALUES (null, '华夏银行', '03040000', 0, now(), now());
INSERT INTO `bankinfo` VALUES (null, '中信银行', '03020000', 0, now(), now());
INSERT INTO `bankinfo` VALUES (null, '兴业银行', '03090000', 0, now(), now());
INSERT INTO `bankinfo` VALUES (null, '邮政储蓄', '01000000', 0, now(), now());
INSERT INTO `bankinfo` VALUES (null, '交通银行', '03010000', 0, now(), now());
INSERT INTO `bankinfo` VALUES (null, '广发银行', '03060000', 0, now(), now());
INSERT INTO `bankinfo` VALUES (null, '民生银行', '03050000', 0, now(), now());
INSERT INTO `bankinfo` VALUES (null, '米庄宝银行', '09010000', 1, now(), now());
INSERT INTO `bankinfo` VALUES (null, '钱袋银行', '09020000', 1, now(), now());
-- 银行表信息初始化数据  bankinfo

-- 网关表数据更新 paygate start
alter table paygate drop defaultConnectTimeout;
alter table paygate drop defaultResponseTimeout;
alter table paygate add column inuse int(2) default 0 comment '是否使用状态, 0:停用,1:使用' after `payGateName`;
alter table paygate add column isVirtual int(2) default 0 comment '是否虚拟网关, 0:否,1:是' after `inuse`;

alter table paygate add column payGateId int(2) comment '网关id' after `id`;
alter table paygate add unique(`payGateId`);
update paygate set payGateCode = 'CMB_PAY_OFFLINE' where payGateCode = 'Cmb_pay_offline';
update paygate set payGateId = 1 where payGateCode = 'CHINA_PAY';
update paygate set payGateId = 2 where payGateCode = 'YEE_PAY';
update paygate set payGateId = 3 where payGateCode = 'LLPay';
update paygate set payGateId = 4 where payGateCode = 'CMB_PAY';
update paygate set payGateId = 5 where payGateCode = 'Cmb_pay_offline';
update paygate set payGateId = 6 where payGateCode = 'PAY_ECO';
update paygate set payGateId = 7 where payGateCode = 'MIZB';
update paygate set payGateId = 8 where payGateCode = 'OFFLINE';
update paygate set payGateId = 9 where payGateCode = 'UM_PAY';
update paygate set payGateId = 10 where payGateCode = 'PING_AN';
update paygate set isVirtual = 1 where payGateCode = 'MIZB';
update paygate set inuse = 1 where payGateCode = 'MIZB';
update paygate set inuse = 1 where payGateCode = 'CHINA_PAY';
update paygate set inuse = 1 where payGateCode = 'YEE_PAY';
update paygate set inuse = 1 where payGateCode = 'LLPay';
update paygate set inuse = 1 where payGateCode = 'CMB_PAY';
update paygate set inuse = 1 where payGateCode = 'UM_PAY';
update paygate set inuse = 1 where payGateCode = 'PING_AN';
insert into paygate values(null, 11, 'BAO_FOO', '宝付', 1, 0 now(), now());
-- 网关表数据更新 paygate end 

-- 业务流水表 bizfrontlog start
alter table bizfrontlog drop bizStatus;
-- 业务流水表 bizfrontlog end 

-- 交易流水记录信息表 tradeRecordInfo start
alter table tradeRecordInfo add column extraCode varchar(32) comment '第三方外部编号' after `transId`;
-- 交易流水记录信息表 tradeRecordInfo end 

/*  merchantPPK 三方商户公私钥安全性配置 */
/*  cfgData eg: '{"keyPwd":123456,"terminalPass":29078}' */
INSERT INTO alchemist.merchantPPK (ppkCode, merchantId, payGateCode, name, `desc`, privateKey, publicKey, isPath, cfgData, createDate, modifyDate) 
VALUES ('118766', '801997', 'BAO_FOO', '宝付渠道商户号', '宝付渠道商户号', 'D:/work/baofoo/merchant_pri.pfx', 'D:/work/baofoo/bfkey_801997@@29078.cer', 1, '{"keyPwd":123456,"terminalPass":29078}', now(), now());

/*  merchantPPKRelation 三方商户公私钥关系配置 */


-- 非交易流水表 nonTradeRecord start
alter table nonTradeRecord add column mobile varchar(11) comment '手机号' after `cardNo`;
-- 非交易流水表 nonTradeRecord end 

-- 网关配置表 payGateAction start
INSERT INTO `payGateAction` (`payGateCode`, `bizDefineType`, `connectTimeout`, `responseTimeout`, `requestUrl`, `returnUrl`, `createDate`, `modifyDate`) 
VALUES ('BAO_FOO', 'PAY', 9000, 9000, 'https://public.baofoo.com/cutpayment/api/backTransRequest', '', now(), now());
INSERT INTO `payGateAction` (`payGateCode`, `bizDefineType`, `connectTimeout`, `responseTimeout`, `requestUrl`, `returnUrl`, `createDate`, `modifyDate`) 
VALUES ('BAO_FOO', 'QUERY_PAY', 20000, 20000, 'https://public.baofoo.com/cutpayment/api/backTransRequest', '', now(), now());
INSERT INTO `payGateAction` (`payGateCode`, `bizDefineType`, `connectTimeout`, `responseTimeout`, `requestUrl`, `returnUrl`, `createDate`, `modifyDate`) 
VALUES ('BAO_FOO', 'AUTH', 20000, 20000, 'https://public.baofoo.com/cutpayment/api/backTransRequest', '', now(), now());
INSERT INTO `payGateAction` (`payGateCode`, `bizDefineType`, `connectTimeout`, `responseTimeout`, `requestUrl`, `returnUrl`, `createDate`, `modifyDate`) 
VALUES ('BAO_FOO', 'QUERY_AUTH', 20000, 20000, 'https://public.baofoo.com/cutpayment/api/backTransRequest', '', now(), now());
INSERT INTO `payGateAction` (`payGateCode`, `bizDefineType`, `connectTimeout`, `responseTimeout`, `requestUrl`, `returnUrl`, `createDate`, `modifyDate`) 
VALUES ('BAO_FOO', 'CONFIRM_AUTH', 20000, 20000, 'https://public.baofoo.com/cutpayment/api/backTransRequest', '', now(), now());
-- 网关配置表 payGateAction end 


