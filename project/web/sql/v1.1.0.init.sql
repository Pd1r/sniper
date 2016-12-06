-- 数据初始化
INSERT INTO alchemist.`payGate` (`payGateCode`, `payGateName`, `defaultConnectTimeout`, `defaultResponseTimeout`, `createDate`, `modifyDate`) 
VALUES ('ChinaPay', '银联支付', 9000, 9000, now(), now());
INSERT INTO alchemist.`payGate` (`payGateCode`, `payGateName`, `defaultConnectTimeout`, `defaultResponseTimeout`, `createDate`, `modifyDate`) 
VALUES ('YeePay', '易宝支付', 9000, 9000, now(), now());
INSERT INTO alchemist.`payGate` (`payGateCode`, `payGateName`, `defaultConnectTimeout`, `defaultResponseTimeout`, `createDate`, `modifyDate`) 
VALUES ('LLPay', '连连支付', 9000, 9000, now(), now());
INSERT INTO alchemist.`payGate` (`payGateCode`, `payGateName`, `defaultConnectTimeout`, `defaultResponseTimeout`, `createDate`, `modifyDate`) 
VALUES ('CMBPay', '招行线上', 9000, 9000, now(), now());
INSERT INTO alchemist.`payGate` (`payGateCode`, `payGateName`, `defaultConnectTimeout`, `defaultResponseTimeout`, `createDate`, `modifyDate`) 
VALUES ('Cmb_pay_offline', '招行线下', 9000, 9000, now(), now());
INSERT INTO alchemist.`payGate` (`payGateCode`, `payGateName`, `defaultConnectTimeout`, `defaultResponseTimeout`, `createDate`, `modifyDate`) 
VALUES ('PAY_ECO', '易联支付', 9000, 9000, now(), now());
INSERT INTO alchemist.`payGate` (`payGateCode`, `payGateName`, `defaultConnectTimeout`, `defaultResponseTimeout`, `createDate`, `modifyDate`) 
VALUES ('Mizb', '米庄宝', 9000, 9000, now(), now());
INSERT INTO alchemist.`payGate` (`payGateCode`, `payGateName`, `defaultConnectTimeout`, `defaultResponseTimeout`, `createDate`, `modifyDate`) 
VALUES ('OFFLINE', '线下支付', 9000, 9000, now(), now());
INSERT INTO alchemist.`payGate` (`payGateCode`, `payGateName`, `defaultConnectTimeout`, `defaultResponseTimeout`, `createDate`, `modifyDate`) 
VALUES ('UM_PAY', '联动优势', 9000, 9000, now(), now());
INSERT INTO alchemist.`payGate` (`payGateCode`, `payGateName`, `defaultConnectTimeout`, `defaultResponseTimeout`, `createDate`, `modifyDate`) 
VALUES ('PING_AN', '平安支付', 9000, 9000, now(), now());


-- ----------------------------
-- Records of paygateaction
-- ----------------------------
INSERT INTO `payGateAction` (`payGateCode`, `bizDefineType`, `connectTimeout`, `responseTimeout`, `requestUrl`, `returnUrl`, `createDate`, `modifyDate`) 
VALUES ('YEE_PAY', 'AUTH', 20000, 20000, 'https://ok.yeepay.com/payapi/api/tzt/invokebindbankcard', null, now(), now());
INSERT INTO `payGateAction` (`payGateCode`, `bizDefineType`, `connectTimeout`, `responseTimeout`, `requestUrl`, `returnUrl`, `createDate`, `modifyDate`) 
VALUES ('YEE_PAY', 'CONFIRM_AUTH', 20000, 20000, 'https://ok.yeepay.com/payapi/api/tzt/confirmbindbankcard', null, now(), now());
INSERT INTO `payGateAction` (`payGateCode`, `bizDefineType`, `connectTimeout`, `responseTimeout`, `requestUrl`, `returnUrl`, `createDate`, `modifyDate`) 
VALUES ('YEE_PAY', 'PAY', 9000, 9000, 'https://ok.yeepay.com/payapi/api/tzt/directbindpay', 'http://pay.mizlicai.com/services/gateway/notify/yeepay/pay', now(), now());
INSERT INTO `payGateAction` (`payGateCode`, `bizDefineType`, `connectTimeout`, `responseTimeout`, `requestUrl`, `returnUrl`, `createDate`, `modifyDate`) 
VALUES ('YEE_PAY', 'QUERY_AUTH', 9000, 9000, 'https://ok.yeepay.com/payapi/api/bankcard/authbind/list', null, now(), now());
INSERT INTO `payGateAction` (`payGateCode`, `bizDefineType`, `connectTimeout`, `responseTimeout`, `requestUrl`, `returnUrl`, `createDate`, `modifyDate`) 
VALUES ('YEE_PAY', 'QUERY_PAY', 9000, 9000, 'https://ok.yeepay.com/payapi/api/query/order', null, now(), now());
INSERT INTO `payGateAction` (`payGateCode`, `bizDefineType`, `connectTimeout`, `responseTimeout`, `requestUrl`, `returnUrl`, `createDate`, `modifyDate`) 
VALUES ('CHINA_PAY', 'AUTH', 20000, 20000, 'https://payment.chinapay.com/fundWeb/genOrderServlet', 'http://pay.mizlicai.com/services/gateway/notify/chinapay/auth', now(), now());
INSERT INTO `payGateAction` (`payGateCode`, `bizDefineType`, `connectTimeout`, `responseTimeout`, `requestUrl`, `returnUrl`, `createDate`, `modifyDate`) 
VALUES ('CHINA_PAY', 'PAY', 9000, 9000, 'http://sfj.chinapay.com/dac/SinCutServletGBK', null, now(), now());
INSERT INTO `payGateAction` (`payGateCode`, `bizDefineType`, `connectTimeout`, `responseTimeout`, `requestUrl`, `returnUrl`, `createDate`, `modifyDate`) 
VALUES ('CHINA_PAY', 'REPAYMENT', 9000, 9000, 'http://sfj.chinapay.com/dac/SinPayServletGBK', null, now(), now());
INSERT INTO `payGateAction` (`payGateCode`, `bizDefineType`, `connectTimeout`, `responseTimeout`, `requestUrl`, `returnUrl`, `createDate`, `modifyDate`) 
VALUES ('CHINA_PAY', 'QUERY_PAY', 9000, 9000, 'http://sfj.chinapay.com/dac/SinCutQueryServletGBK', null, now(), now());
INSERT INTO `payGateAction` (`payGateCode`, `bizDefineType`, `connectTimeout`, `responseTimeout`, `requestUrl`, `returnUrl`, `createDate`, `modifyDate`) 
VALUES ('CHINA_PAY', 'QUERY_REPAYMENT', 9000, 9000, 'http://sfj.chinapay.com/dac/SinPayQueryServletGBK', null, now(), now());


-- ----------------------------
-- Records of emailReceive
-- ----------------------------
INSERT INTO `emailReceive` (`emailAddress`, `name`) VALUES ('yangcs@mizlicai.com', '杨长盛');
INSERT INTO `emailReceive` (`emailAddress`, `name`) VALUES ('songxl@mizlicai.com', '宋星霖');
INSERT INTO `emailReceive` (`emailAddress`, `name`) VALUES ('yuany@mizlicai.com', '袁洋');
INSERT INTO `emailReceive` (`emailAddress`, `name`) VALUES ('rita@mizlicai.com', '王莉莉');
INSERT INTO `emailReceive` (`emailAddress`, `name`) VALUES ('dongjg@mizlicai.com', '董建刚');
INSERT INTO `emailReceive` (`emailAddress`, `name`) VALUES ('showone@mizlicai.com', '张晓晚');

