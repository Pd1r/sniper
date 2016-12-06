-- 商户账户信息
delete from alchemist.merchantAccount;
INSERT INTO alchemist.merchantAccount (merchantId, merchantAccount, merchantName, merchantDesc, `createDate`, `modifyDate`) 
VALUES ('S001', 'S001', '交易系统', 'uranus交易系统', now(), now());
INSERT INTO alchemist.merchantAccount (merchantId, merchantAccount, merchantName, merchantDesc, `createDate`, `modifyDate`) 
VALUES ('S002', 'S002', '财务系统', 'finance财务系统', now(), now());
INSERT INTO alchemist.merchantAccount (merchantId, merchantAccount, merchantName, merchantDesc, `createDate`, `modifyDate`) 
VALUES ('S003', 'S003', '烟草系统', '烟草系统', now(), now());
INSERT INTO alchemist.merchantAccount (merchantId, merchantAccount, merchantName, merchantDesc, `createDate`, `modifyDate`) 
VALUES ('S004', 'S004', '旅游分期系统', '旅游分期系统', now(), now());
INSERT INTO alchemist.merchantAccount (merchantId, merchantAccount, merchantName, merchantDesc, `createDate`, `modifyDate`) 
VALUES ('10018627664', '10018627664', '爱学贷', '爱学贷商户', now(), now());


-- 系统参数配置
delete from alchemist.systemParameter;
INSERT INTO alchemist.systemParameter (parameterCode, parameterValue, parameterName, parameterDesc, cfgData, `enable`, `createDate`, `modifyDate`) 
VALUES ('MAX_ASYNCH_NOTIFY_CALLBACK_COUNT', '30', '异步通知的最大回调通知次数', '异步通知的最大回调通知次数', '', 1, now(), now());


-- 网关配置
INSERT INTO `payGateAction` (`payGateCode`, `bizDefineType`, `connectTimeout`, `responseTimeout`, `requestUrl`, `returnUrl`, `createDate`, `modifyDate`) 
VALUES ('MIZB', 'PAY', 20000, 20000, '', '', now(), now());
INSERT INTO `payGateAction` (`payGateCode`, `bizDefineType`, `connectTimeout`, `responseTimeout`, `requestUrl`, `returnUrl`, `createDate`, `modifyDate`) 
VALUES ('MIZB', 'CANCEL', 20000, 20000, '', 'http://pay.mizlicai.com/services/gateway/notify/mzb/cancel', now(), now());
INSERT INTO `payGateAction` (`payGateCode`, `bizDefineType`, `connectTimeout`, `responseTimeout`, `requestUrl`, `returnUrl`, `createDate`, `modifyDate`) 
VALUES ('MIZB', 'REFUND', 20000, 20000, '', 'http://pay.mizlicai.com/services/gateway/notify/mzb/refund', now(), now());
