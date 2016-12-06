alter table bizFrontLog drop column certId;
alter table bizFrontLog drop column bankCode;
alter table bizFrontLog drop column memo;

-- 网关配置表 payGateAction start  测试配置
delete from `payGateAction` where payGateCode = 'UM_PAY' and requestType = 'EASY_PAY' and executeType = 'EXECUTE';
delete from `payGateAction` where payGateCode = 'UM_PAY' and requestType = 'EASY_PAY' and executeType = 'EXECUTE';
alter table payGateAction drop column bizDefineType;
-- 网关配置表 payGateAction end  测试配置