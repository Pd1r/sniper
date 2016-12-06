-- 生产发布后
alter table `bizFrontLog` drop column `extraCode`;

-- 删除交易流水表冗余字段
alter table tradeRecord drop column orderNo, 
drop column notifyUrl, drop column refundAmount;
