-- 生产发布前
-- 网关表数据更新paygate
delete from paygate where payGateCode = 'HENG_FENG_PAY';
insert into paygate(payGateId, payGateCode, payGateName, inuse, isVirtual, createDate, modifyDate) 
values (12, 'HF_PAY', '恒丰', 1, 0, now(), now());
-- 网关表数据更新paygate

-- 网关配置表 payGateAction start  测试配置
delete from `payGateAction` where `payGateCode` = 'HF_PAY';
INSERT INTO `payGateAction` (`payGateCode`,`bizDefineType`, `requestType`, `executeType`, `connectTimeout`, `responseTimeout`, `requestUrl`, `returnUrl`, `createDate`, `modifyDate`) 
VALUES ('HF_PAY', 'PAY', 'PAY', 'EXECUTE', 9000, 9000, 'http://pre.yiguanjinrong.com:8091/HFPay/HF1010.do', '', now(), now());
INSERT INTO `payGateAction` (`payGateCode`,`bizDefineType`, `requestType`, `executeType`, `connectTimeout`, `responseTimeout`, `requestUrl`, `returnUrl`, `createDate`, `modifyDate`) 
VALUES ('HF_PAY', 'PAY', 'PAY', 'QUERY', 20000, 20000, 'http://pre.yiguanjinrong.com:8091/HFPay/HF1013.do', '', now(), now());
INSERT INTO `payGateAction` (`payGateCode`,`bizDefineType`, `requestType`, `executeType`, `connectTimeout`, `responseTimeout`, `requestUrl`, `returnUrl`, `createDate`, `modifyDate`) 
VALUES ('HF_PAY', 'AUTH', 'AUTH', 'EXECUTE', 20000, 20000, 'http://pre.yiguanjinrong.com:8091/HFPay/HF1011.do', '', now(), now());
INSERT INTO `payGateAction` (`payGateCode`,`bizDefineType`, `requestType`, `executeType`, `connectTimeout`, `responseTimeout`, `requestUrl`, `returnUrl`, `createDate`, `modifyDate`) 
VALUES ('HF_PAY', 'CONFIRM_AUTH', 'CONFIRM_AUTH', 'EXECUTE', 20000, 20000, 'http://pre.yiguanjinrong.com:8091/HFPay/HF1012.do', '', now(), now());
INSERT INTO `payGateAction` (`payGateCode`,`bizDefineType`, `requestType`, `executeType`, `connectTimeout`, `responseTimeout`, `requestUrl`, `returnUrl`, `createDate`, `modifyDate`) 
VALUES ('HF_PAY', 'REPAYMENT_APPLY', 'REPAYMENT_APPLY', 'EXECUTE', 20000, 20000, 'http://pre.yiguanjinrong.com:8091/HFPay/HF1017.do', '', now(), now());
INSERT INTO `payGateAction` (`payGateCode`,`bizDefineType`, `requestType`, `executeType`, `connectTimeout`, `responseTimeout`, `requestUrl`, `returnUrl`, `createDate`, `modifyDate`) 
VALUES ('HF_PAY', 'REPAYMENT', 'REPAYMENT', 'EXECUTE', 20000, 20000, 'http://pre.yiguanjinrong.com:8091/HFPay/HF1015.do', '', now(), now());
INSERT INTO `payGateAction` (`payGateCode`,`bizDefineType`, `requestType`, `executeType`, `connectTimeout`, `responseTimeout`, `requestUrl`, `returnUrl`, `createDate`, `modifyDate`) 
VALUES ('HF_PAY', 'REVERSE', 'REVERSE', 'EXECUTE', 20000, 20000, 'http://pre.yiguanjinrong.com:8091/HFPay/HF1018.do', '', now(), now());
INSERT INTO `payGateAction` (`payGateCode`,`bizDefineType`, `requestType`, `executeType`, `connectTimeout`, `responseTimeout`, `requestUrl`, `returnUrl`, `createDate`, `modifyDate`) 
VALUES ('HF_PAY', 'REPAYMENT_APPLY', 'REPAYMENT_APPLY', 'QUERY', 20000, 20000, 'http://pre.yiguanjinrong.com:8091/HFPay/HF1016.do', '', now(), now());

INSERT INTO `payGateAction` (`payGateCode`,`bizDefineType`, `requestType`, `executeType`, `connectTimeout`, `responseTimeout`, `requestUrl`, `returnUrl`, `createDate`, `modifyDate`) 
VALUES ('BAO_FOO', 'UNBUNDLING', 'UNBUNDLING', 'EXECUTE', 20000, 20000, 'https://public.baofoo.com/cutpayment/api/backTransRequest', '', now(), now());

update `payGateAction` set requestType = 'PAY', executeType = 'EXECUTE' where payGateCode = 'BAO_FOO' and bizDefineType = 'PAY';
update `payGateAction` set requestType = 'PAY', executeType = 'QUERY' where payGateCode = 'BAO_FOO' and bizDefineType = 'QUERY_PAY';
update `payGateAction` set requestType = 'AUTH', executeType = 'EXECUTE' where payGateCode = 'BAO_FOO' and bizDefineType = 'AUTH';
update `payGateAction` set requestType = 'CONFIRM_AUTH', executeType = 'EXECUTE' where payGateCode = 'BAO_FOO' and bizDefineType = 'CONFIRM_AUTH';
update `payGateAction` set requestType = 'AUTH', executeType = 'QUERY' where payGateCode = 'BAO_FOO' and bizDefineType = 'QUERY_AUTH';

update `payGateAction` set requestType = 'PAY', executeType = 'EXECUTE' where payGateCode = 'MIZB' and bizDefineType = 'PAY';
update `payGateAction` set requestType = 'CANCEL', executeType = 'EXECUTE' where payGateCode = 'MIZB' and bizDefineType = 'CANCEL';
update `payGateAction` set requestType = 'REFUND', executeType = 'EXECUTE' where payGateCode = 'MIZB' and bizDefineType = 'REFUND';

update `payGateAction` set requestType = 'EASY_PAY', executeType = 'EXECUTE' where payGateCode = 'UM_PAY' and bizDefineType = 'EASY_PAY';
update `payGateAction` set requestType = 'EASY_PAY', executeType = 'QUERY' where payGateCode = 'UM_PAY' and bizDefineType = 'QUERY_PAY';

update `payGateAction` set requestType = 'AUTH', executeType = 'EXECUTE' where payGateCode = 'YEE_PAY' and bizDefineType = 'AUTH';
update `payGateAction` set requestType = 'CONFIRM_AUTH', executeType = 'EXECUTE' where payGateCode = 'YEE_PAY' and bizDefineType = 'CONFIRM_AUTH';
update `payGateAction` set requestType = 'AUTH', executeType = 'QUERY' where payGateCode = 'YEE_PAY' and bizDefineType = 'QUERY_AUTH';
update `payGateAction` set requestType = 'PAY', executeType = 'EXECUTE' where payGateCode = 'YEE_PAY' and bizDefineType = 'PAY';
update `payGateAction` set requestType = 'PAY', executeType = 'QUERY' where payGateCode = 'YEE_PAY' and bizDefineType = 'QUERY_PAY';

update `payGateAction` set requestType = 'AUTH', executeType = 'EXECUTE' where payGateCode = 'CHINA_PAY' and bizDefineType = 'AUTH';
update `payGateAction` set requestType = 'PAY', executeType = 'EXECUTE' where payGateCode = 'CHINA_PAY' and bizDefineType = 'PAY';
update `payGateAction` set requestType = 'REPAYMENT', executeType = 'EXECUTE' where payGateCode = 'CHINA_PAY' and bizDefineType = 'REPAYMENT';
update `payGateAction` set requestType = 'PAY', executeType = 'QUERY' where payGateCode = 'CHINA_PAY' and bizDefineType = 'QUERY_PAY';
update `payGateAction` set requestType = 'REPAYMENT', executeType = 'QUERY' where payGateCode = 'CHINA_PAY' and bizDefineType = 'QUERY_REPAYMENT';

update `payGateAction` set requestType = 'PAY', executeType = 'EXECUTE' where payGateCode = 'LL_PAY' and bizDefineType = 'PAY';
update `payGateAction` set requestType = 'PAY', executeType = 'QUERY' where payGateCode = 'LL_PAY' and bizDefineType = 'QUERY_PAY';


-- 网关配置表 payGateAction end  测试配置


-- 网关路由配置表payGateRouteSupportBizTypeBo
update payGateRouteSupportBizType set bizTypeCode = 'REPAYMENT' where bizTypeCode = 'REPAY'
-- 网关路由配置表payGateRouteSupportBizType

-- 系统参数配置表systemparameter
INSERT INTO `systemparameter` (`parameterCode`,`parameterValue`, `parameterName`, `parameterDesc`, `cfgData`, `enable`,`createDate`, `modifyDate`) 
VALUES ('IS_ALLOW_IP_WHITE_SERVICE', '0', '是否开启ip白名单服务', '是否开启ip白名单服务', '', 1, now(), now());
-- 系统参数配置表systemparameter
