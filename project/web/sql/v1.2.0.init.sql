-- 数据初始化

-- ----------------------------
-- Records of paygateaction
-- ----------------------------
delete from `payGateAction` where payGateCode='UM_PAY';
INSERT INTO `payGateAction` (`payGateCode`, `bizDefineType`, `connectTimeout`, `responseTimeout`, `requestUrl`, `returnUrl`, `createDate`, `modifyDate`) 
VALUES ('UM_PAY', 'PAY_BEFORE', 20000, 20000, 'http://pay.soopay.net/spay/pay/payservice.do', 'http://pay.mizlicai.com/services/gateway/notify/umpay/pay', now(), now());
INSERT INTO `payGateAction` (`payGateCode`, `bizDefineType`, `connectTimeout`, `responseTimeout`, `requestUrl`, `returnUrl`, `createDate`, `modifyDate`) 
VALUES ('UM_PAY', 'PAY', 9000, 9000, 'http://pay.soopay.net/spay/pay/payservice.do', null, now(), now());
INSERT INTO `payGateAction` (`payGateCode`, `bizDefineType`, `connectTimeout`, `responseTimeout`, `requestUrl`, `returnUrl`, `createDate`, `modifyDate`) 
VALUES ('UM_PAY', 'QUERY_PAY', 9000, 9000, 'http://pay.soopay.net/spay/pay/payservice.do', null, now(), now());

-- 删除无用表
--drop table dispatchermsg