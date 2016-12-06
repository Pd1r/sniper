-- 生产发布前
-- 网关表数据更新paygate
update paygate set payGateCode = 'LL_PAY' where payGateCode = 'LLPay';
-- 网关表数据更新paygate

-- 网关路由支持的操作类型表初始化数据  payGateRouteSupportBizType
insert into payGateRouteSupportBizType(bizTypeId, bizTypeCode, createDate, modifyDate) values(1, 'PAY', now(), now());
insert into payGateRouteSupportBizType(bizTypeId, bizTypeCode, createDate, modifyDate) values(2, 'REPAY', now(), now());
-- 网关路由支持的操作类型表初始化数据  payGateRouteSupportBizType

-- 商户账户信息初始化数据  merchantAccount
-- 交易系统
UPDATE alchemist.merchantAccount set merchantAccount = '004306b3f1a2b646e9', `modifyDate`=now() where merchantId = 'S001';
-- 财务系统
UPDATE alchemist.merchantAccount set merchantAccount = '008128fe04752349fb', `modifyDate`=now() where merchantId = 'S002';
-- 烟草系统/米庄贷
UPDATE alchemist.merchantAccount set merchantAccount = '00498639fc1f7a4b22', merchantName='米庄贷', merchantDesc='米庄贷', `modifyDate`=now() where merchantId = 'S003';
-- 旅游分期
UPDATE alchemist.merchantAccount set merchantAccount = '0080b99d86648a4a05', `modifyDate`=now() where merchantId = 'S004';
-- 商户账户信息初始化数据  merchantAccount

-- 银行列表数据初始化
delete from alchemist.bankinfo;
insert into bankinfo(bankName, bankCode, isVirtual, weight, createDate, modifyDate) 
values('工商银行', '01020000', 0, 30, now(), now());
insert into bankinfo(bankName, bankCode, isVirtual, weight, createDate, modifyDate) 
values('农业银行', '01030000', 0, 28, now(), now());
insert into bankinfo(bankName, bankCode, isVirtual, weight, createDate, modifyDate) 
values('中国银行', '01040000', 0, 26, now(), now());
insert into bankinfo(bankName, bankCode, isVirtual, weight, createDate, modifyDate) 
values('建设银行', '01050000', 0, 25, now(), now());
insert into bankinfo(bankName, bankCode, isVirtual, weight, createDate, modifyDate) 
values('招商银行', '03080000', 0, 22, now(), now());
insert into bankinfo(bankName, bankCode, isVirtual, weight, createDate, modifyDate) 
values('浦发银行', '03100000', 0, 19, now(), now());
insert into bankinfo(bankName, bankCode, isVirtual, weight, createDate, modifyDate) 
values('光大银行', '03030000', 0, 16, now(), now());
insert into bankinfo(bankName, bankCode, isVirtual, weight, createDate, modifyDate) 
values('平安银行', '03070000', 0, 20, now(), now());
insert into bankinfo(bankName, bankCode, isVirtual, weight, createDate, modifyDate) 
values('华夏银行', '03040000', 0, 10, now(), now());
insert into bankinfo(bankName, bankCode, isVirtual, weight, createDate, modifyDate) 
values('中信银行', '03020000', 0, 23, now(), now());
insert into bankinfo(bankName, bankCode, isVirtual, weight, createDate, modifyDate) 
values('兴业银行', '03090000', 0, 17, now(), now());
insert into bankinfo(bankName, bankCode, isVirtual, weight, createDate, modifyDate) 
values('邮政储蓄', '01000000', 0, 2, now(), now());
insert into bankinfo(bankName, bankCode, isVirtual, weight, createDate, modifyDate) 
values('交通银行', '03010000', 0, 24, now(), now());
insert into bankinfo(bankName, bankCode, isVirtual, weight, createDate, modifyDate) 
values('广发银行', '03060000', 0, 15, now(), now());
insert into bankinfo(bankName, bankCode, isVirtual, weight, createDate, modifyDate) 
values('民生银行', '03050000', 0, 18, now(), now());
insert into bankinfo(bankName, bankCode, isVirtual, weight, createDate, modifyDate) 
values('米庄宝', '09010000', 1, 1, now(), now());
insert into bankinfo(bankName, bankCode, isVirtual, weight, createDate, modifyDate) 
values('钱袋', '09020000', 1, 3, now(), now());

-- 银行编码配置数据初始化
-- 银联支付
delete from alchemist.bankCodeConfig where payGateId=1;
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('01020000', 1, '0102', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('03030000', 1, '0303', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('03060000', 1, '0306', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('03040000', 1, '0304', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('01050000', 1, '0105', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('03010000', 1, '0301', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('03050000', 1, '0305', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('01030000', 1, '0103', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('03070000', 1, '0410', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('03100000', 1, '0310', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('03090000', 1, '0309', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('01000000', 1, '0100', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('03080000', 1, '0308', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('01040000', 1, '0104', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('03020000', 1, '0302', now(), now());
-- 易宝支付
delete from alchemist.bankCodeConfig where payGateId=2;
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('01020000', 2, 'ICBC', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('03030000', 2, 'CEB', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('03060000', 2, 'GDB', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('03040000', 2, 'HXB', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('01050000', 2, 'CCB', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('03010000', 2, 'BOCO', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('03050000', 2, 'CMBC', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('01030000', 2, 'ABC', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('03070000', 2, 'PINGAN', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('03100000', 2, 'SPDB', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('03090000', 2, 'CIB', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('01000000', 2, 'POST', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('03080000', 2, 'CMBCHINA', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('01040000', 2, 'BOC', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('03020000', 2, 'ECITIC', now(), now());
-- 连连支付
delete from alchemist.bankCodeConfig where payGateId=3;
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('01020000', 3, '01020000', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('03030000', 3, '03030000', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('03060000', 3, '03060000', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('03040000', 3, '03040000', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('01050000', 3, '01050000', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('03010000', 3, '03010000', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('03050000', 3, '03050000', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('01030000', 3, '01030000', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('03070000', 3, '03070000', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('03100000', 3, '03100000', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('03090000', 3, '03090000', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('01000000', 3, '01000000', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('03080000', 3, '03080000', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('01040000', 3, '01040000', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('03020000', 3, '03020000', now(), now());
-- 联动优势
delete from alchemist.bankCodeConfig where payGateId=9;
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('01020000', 9, 'ICBC', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('03030000', 9, 'CEB', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('03060000', 9, 'GDB', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('03040000', 9, 'HXB', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('01050000', 9, 'CCB', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('03010000', 9, 'COMM', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('03050000', 9, 'CMBC', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('01030000', 9, 'ABC', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('03070000', 9, 'SPAB', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('03100000', 9, 'SPDB', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('03090000', 9, 'CIB', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('01000000', 9, 'PSBC', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('03080000', 9, 'CMB', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('01040000', 9, 'BOC', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('03020000', 9, 'CITIC', now(), now());
-- 平安支付
delete from alchemist.bankCodeConfig where payGateId=10;
-- 
-- 宝付支付,暂不支持'华夏银行''北京银行'
delete from alchemist.bankCodeConfig where payGateId=11;
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('01020000', 11, 'ICBC', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('03030000', 11, 'CEB', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('03060000', 11, 'GDB', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('01050000', 11, 'CCB', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('03010000', 11, 'BCOM', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('03050000', 11, 'CMBC', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('01030000', 11, 'ABC', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('03070000', 11, 'PAB', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('03100000', 11, 'SPDB', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('03090000', 11, 'CIB', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('01000000', 11, 'PSBC', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('03080000', 11, 'CMB', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('01040000', 11, 'BOC', now(), now());
insert into alchemist.bankCodeConfig(bankCode, payGateId, payGateBankCode, createDate, modifyDate) 
values('03020000', 11, 'CITIC', now(), now());

-- 网关银行限额初始化脚本
-- 银联银行限额配置
delete from alchemist.payGateBankQuota where payGateId=1;
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate) 
VALUES (1, '01020000', 5000000, 25000000, 750000000, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate) 
VALUES (1, '03090000', 5000000, 5000000, 150000000, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate) 
VALUES (1, '03050000', -1, -1, -1, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate) 
VALUES (1, '01040000', 1000000, 1000000, 30000000, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate) 
VALUES (1, '03030000', -1, -1, -1, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate) 
VALUES (1, '01030000', 5000000, 10000000, 300000000, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate) 
VALUES (1, '03070000', 100000000, 500000000, 15000000000, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate) 
VALUES (1, '03020000', -1, -1, -1, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate) 
VALUES (1, '03060000', -1, -1, -1, now(), now());

-- 易宝银行限额配置
delete from alchemist.payGateBankQuota where payGateId=2;
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate)  
VALUES (2, '01020000', 5000000, 5000000, 100000000, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate)  
VALUES (2, '01030000', 2000000, 10000000, 100000000, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate)  
VALUES (2, '01050000', 500000, 30000000, 100000000, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate)  
VALUES (2, '01040000', 5000000, 50000000, 100000000, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate)  
VALUES (2, '03100000', 5000000, 5000000, 10000000, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate)  
VALUES (2, '03030000', 20000000, 50000000, 100000000, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate)  
VALUES (2, '01000000', 500000, 500000, 15000000, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate)  
VALUES (2, '03040000', 10000000, 50000000, 100000000, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate)  
VALUES (2, '03050000', 20000000, 50000000, 100000000, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate)  
VALUES (2, '03020000', 10000000, 20000000, 100000000, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate)  
VALUES (2, '03090000', 5000000, 5000000, 100000000, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate)  
VALUES (2, '03070000', 20000000, 50000000, 100000000, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate)  
VALUES (2, '03060000', 10000000, 50000000, 100000000, now(), now());

-- 连连银行限额配置
delete from alchemist.payGateBankQuota where payGateId=3;
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate)  
VALUES (3, '01020000', 5000000, 5000000, 15000000, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate)  
VALUES (3, '01030000', 200000, 1000000, 30000000, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate)  
VALUES (3, '01050000', 5000000, 10000000, 300000000, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate)  
VALUES (3, '01040000', 5000000, 20000000, 600000000, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate)  
VALUES (3, '03080000', 1000000, 1000000, 30000000, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate)  
VALUES (3, '03030000', 50000000, 100000000, 3000000000, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate)  
VALUES (3, '03020000', 50000000, 100000000, 3000000000, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate)  
VALUES (3, '03090000', 5000000, 5000000, 150000000, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate)  
VALUES (3, '03040000', 50000000, 100000000, 3000000000, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate)  
VALUES (3, '03070000', 50000000, 100000000, 3000000000, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate)  
VALUES (3, '03050000', 50000000, 50000000, 1500000000, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate)  
VALUES (3, '03060000', 50000000, -1, -1, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate)  
VALUES (3, '03010000', 5000000, 20000000, 600000000, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate)  
VALUES (3, '01000000', 5000000, 5000000, 15000000, now(), now());

-- 联动银行限额配置
delete from alchemist.payGateBankQuota where payGateId=9;
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate)  
VALUES (9, '01020000', 5000000, 5000000, 150000000, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate)  
VALUES (9, '03080000', 300000, 210000, 3000000, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate)  
VALUES (9, '01030000', 5000000, 5000000, 150000000, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate)  
VALUES (9, '01050000', 5000000, 5000000, 150000000, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate)  
VALUES (9, '01040000', 5000000, 10000000, 300000000, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate)  
VALUES (9, '03030000', 10000000, 20000000, 600000000, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate)  
VALUES (9, '03020000', 10000000, 20000000, 600000000, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate)  
VALUES (9, '03090000', 5000000, 5000000, 150000000, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate)  
VALUES (9, '03070000', 10000000, 20000000, 600000000, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate)  
VALUES (9, '03100000', 5000000, 5000000, 150000000, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate)  
VALUES (9, '03050000', 10000000, 20000000, 600000000, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate)  
VALUES (9, '03060000', 10000000, 20000000, 600000000, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate)  
VALUES (9, '03010000', 5000000, 5000000, 150000000, now(), now());

-- 宝付银行限额配置
delete from alchemist.payGateBankQuota where payGateId=11;
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate)  
VALUES (11, '03100000', 5000000, 5000000, 150000000, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate)  
VALUES (11, '01050000', 20000000, 50000000, 1500000000, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate)  
VALUES (11, '01030000', 1000000, 1000000, 30000000, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate)  
VALUES (11, '01020000', 5000000, 5000000, 150000000, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate)  
VALUES (11, '01040000', 1000000, 1000000, 30000000, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate)  
VALUES (11, '03080000', 1000000, 1500000, 3000000000, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate)  
VALUES (11, '03030000', 50000000, 60000000, -1, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate)  
VALUES (11, '03020000', 30000000, -1, -1, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate)  
VALUES (11, '03090000', 5000000, 5000000, 150000000, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate)  
VALUES (11, '03040000', 10000000, 100000000, 3000000000, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate)  
VALUES (11, '03070000', 30000000, 500000000, 15000000000, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate)  
VALUES (11, '03050000', 30000000, 1000000000, 30000000000, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate)  
VALUES (11, '01000000', 500000, 500000, 15000000, now(), now());
INSERT INTO alchemist.payGateBankQuota(payGateId, bankCode, singleLimit, dayLimit, monthLimit, createDate, modifyDate)  
VALUES (11, '03010000', 20000000, 50000000, 1500000000, now(), now());
