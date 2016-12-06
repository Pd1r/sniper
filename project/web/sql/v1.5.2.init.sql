delete from emailReceive where emailAddress = 'lubj@mizlicai.com';
INSERT INTO `emailReceive` (emailAddress, name) VALUES ('lubj@mizlicai.com', '陆彬洁');

-- 网关配置表 payGateAction start  测试配置
delete from `payGateAction` where payGateCode='UM_PAY' and requestType='PAY' and executeType='EXECUTE';
INSERT INTO `payGateAction` (`payGateCode`,`bizDefineType`, `requestType`, `executeType`, `connectTimeout`, `responseTimeout`, `requestUrl`, `returnUrl`, `createDate`, `modifyDate`) 
VALUES ('UM_PAY', 'PAY', 'PAY', 'EXECUTE', 20000, 20000, 'http://pay.soopay.net/spay/pay/payservice.do', 'http://pay.mizlicai.com/services/gateway/notify/umpay/pay', now(), now());

delete from `payGateAction` where payGateCode='UM_PAY' and requestType='PAY' and executeType='SMS';
INSERT INTO `payGateAction` (`payGateCode`,`bizDefineType`, `requestType`, `executeType`, `connectTimeout`, `responseTimeout`, `requestUrl`, `returnUrl`, `createDate`, `modifyDate`) 
VALUES ('UM_PAY', 'PAY', 'PAY', 'SMS', 20000, 20000, 'http://pay.soopay.net/spay/pay/payservice.do', '', now(), now());

delete from `payGateAction` where payGateCode='UM_PAY' and requestType='PAY' and executeType='QUERY';
INSERT INTO `payGateAction` (`payGateCode`,`bizDefineType`, `requestType`, `executeType`, `connectTimeout`, `responseTimeout`, `requestUrl`, `returnUrl`, `createDate`, `modifyDate`) 
VALUES ('UM_PAY', 'QUERY_PAY', 'PAY', 'QUERY', 20000, 20000, 'http://pay.soopay.net/spay/pay/payservice.do', '', now(), now());






--delete from `payGateAction` where payGateCode='HF_PAY' and requestType='UNBUNDLING' and executeType='EXECUTE';
--INSERT INTO `payGateAction` (`payGateCode`,`bizDefineType`, `requestType`, `executeType`, `connectTimeout`, `responseTimeout`, `requestUrl`, `returnUrl`, `createDate`, `modifyDate`) 
--VALUES ('HF_PAY', 'UNBUNDLING', 'UNBUNDLING', 'EXECUTE', 20000, 20000, 'http://pre.yiguanjinrong.com:8091/HFPay/HF1027.do', '', now(), now());

--delete from `payGateAction` where payGateCode='HF_PAY' and requestType='CORP_REPAYMENT' and executeType='EXECUTE';
--INSERT INTO `payGateAction` (`payGateCode`,`bizDefineType`, `requestType`, `executeType`, `connectTimeout`, `responseTimeout`, `requestUrl`, `returnUrl`, `createDate`, `modifyDate`) 
--VALUES ('HF_PAY', 'CORP_REPAYMENT', 'CORP_REPAYMENT', 'EXECUTE', 20000, 20000, 'http://pre.yiguanjinrong.com:8091/HFPay/HF5002.do', '', now(), now());
--
--delete from `payGateAction` where payGateCode='HF_PAY' and requestType='CORP_REPAYMENT_APPLY' and executeType='EXECUTE';
--INSERT INTO `payGateAction` (`payGateCode`,`bizDefineType`, `requestType`, `executeType`, `connectTimeout`, `responseTimeout`, `requestUrl`, `returnUrl`, `createDate`, `modifyDate`) 
--VALUES ('HF_PAY', 'CORP_REPAYMENT_APPLY', 'CORP_REPAYMENT_APPLY', 'EXECUTE', 20000, 20000, 'http://pre.yiguanjinrong.com:8091/HFPay/HF5001.do', '', now(), now());
--
--delete from `payGateAction` where payGateCode='HF_PAY' and requestType='CORP_REPAYMENT' and executeType='QUERY';
--INSERT INTO `payGateAction` (`payGateCode`,`bizDefineType`, `requestType`, `executeType`, `connectTimeout`, `responseTimeout`, `requestUrl`, `returnUrl`, `createDate`, `modifyDate`) 
--VALUES ('HF_PAY', 'CORP_REPAYMENT', 'CORP_REPAYMENT', 'QUERY', 20000, 20000, 'http://pre.yiguanjinrong.com:8091/HFPay/HF5003.do', '', now(), now());

--delete from `payGateAction` where payGateCode='HF_PAY' and requestType='PAY' and executeType='SMS';
--INSERT INTO `payGateAction` (`payGateCode`,`bizDefineType`, `requestType`, `executeType`, `connectTimeout`, `responseTimeout`, `requestUrl`, `returnUrl`, `createDate`, `modifyDate`) 
--VALUES ('HF_PAY', 'PAY', 'PAY', 'SMS', 20000, 20000, 'http://pre.yiguanjinrong.com:8091/HFPay/HF1014.do', '', now(), now());

--delete from `payGateAction` where payGateCode='HF_PAY' and requestType='CAPITAL_TRANSFER' and executeType='EXECUTE';
--INSERT INTO `payGateAction` (`payGateCode`,`bizDefineType`, `requestType`, `executeType`, `connectTimeout`, `responseTimeout`, `requestUrl`, `returnUrl`, `createDate`, `modifyDate`) 
--VALUES ('HF_PAY', 'CAPITAL_TRANSFER', 'CAPITAL_TRANSFER', 'EXECUTE', 20000, 20000, 'http://pre.yiguanjinrong.com:9005/ifp-eams-server-1.0.0-SNAPSHOT/service/2/EA010088', '', now(), now());
--
--delete from `payGateAction` where payGateCode='HF_PAY' and requestType='CAPITAL_TRANSFER' and executeType='QUERY';
--INSERT INTO `payGateAction` (`payGateCode`,`bizDefineType`, `requestType`, `executeType`, `connectTimeout`, `responseTimeout`, `requestUrl`, `returnUrl`, `createDate`, `modifyDate`) 
--VALUES ('HF_PAY', 'CAPITAL_TRANSFER', 'CAPITAL_TRANSFER', 'QUERY', 20000, 20000, 'http://pre.yiguanjinrong.com:9005/ifp-eams-server-1.0.0-SNAPSHOT/service/2/F0220017', '', now(), now());

-- 网关配置表 payGateAction end  测试配置

-- merchantTransRecord 对帐表，增加对公代付枚举类型
alter table merchantTransRecord modify requestType enum('CANCEL','PAY','REFUND','REPAYMENT','WITHDRAW', 'CORP_REPAYMENT') comment '请求类型';
-- merchantTransRecord
