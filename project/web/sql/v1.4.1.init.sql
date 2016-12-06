-- 商户公私钥配置

-- 网关配置表数据更新paygateAction
delete from paygateAction where payGateCode = 'UM_PAY' and bizDefineType = 'PAY_BEFORE';
update  paygateAction set bizDefineType = 'EASY_PAY',returnUrl = 'http://pay.mizlicai.com/services/gateway/notify/umpay/pay' where payGateCode = 'UM_PAY' and bizDefineType = 'PAY';

-- 网关表数据更新paygate
update paygate set payGateCode = 'CHINA_PAY' where payGateCode = 'ChinaPay';
update paygate set payGateCode = 'YEE_PAY' where payGateCode = 'YeePay';
update paygate set payGateCode = 'CMB_PAY' where payGateCode = 'CMBPay';
update paygate set payGateCode = 'MIZB' where payGateCode = 'Mizb';

-- 支付网关由小写改成大写---
update businessnotifylog set payGateType = 'CHINA_PAY' where payGateType = 'ChinaPay';
update businessnotifylog set payGateType = 'YEE_PAY' where payGateType = 'YeePay';
update businessnotifylog set payGateType = 'MIZB' where payGateType = 'Mizb';

update nontraderecord set payGateType = 'CHINA_PAY' where payGateType = 'ChinaPay';
update nontraderecord set payGateType = 'YEE_PAY' where payGateType = 'YeePay';
update nontraderecord set payGateType = 'MIZB' where payGateType = 'Mizb';

update traderecord set payGateType = 'CHINA_PAY' where payGateType = 'ChinaPay';
update traderecord set payGateType = 'YEE_PAY' where payGateType = 'YeePay';
update traderecord set payGateType = 'MIZB' where payGateType = 'Mizb';

update bizfrontlog set payGateType = 'CHINA_PAY' where payGateType = 'ChinaPay';
update bizfrontlog set payGateType = 'YEE_PAY' where payGateType = 'YeePay';
update bizfrontlog set payGateType = 'MIZB' where payGateType = 'Mizb';
-- 支付网关由小写改成大写----







