-- businessNotifyLog
alter table businessNotifyLog modify `notifySys` varchar(25) comment '请求系统商户编号';
alter table businessNotifyLog add `immediatelyNotify` int(1) DEFAULT 0 comment '是否立即通知。1是，0否' after `count`;
alter table businessNotifyLog add `notifySource` ENUM('MANUAL','ASYNCH', 'SYNCH') DEFAULT 'ASYNCH' comment '通知添加来源（MANUAL:手动添加, ASYNCH:系统异步生成,SYNCH:系统同步生成）';
-- 1.3.0 删除 source 列

-- bizfrontlog
-- bizStatus 修改为可以为null
alter table bizFrontLog modify column bizStatus char(1) comment '状态(失败状态F,处理中状态H,初始状态I,成功状态S等)，来自枚举BizStatusType';

-- tradeRecord
alter table tradeRecord add merchantId varchar(15) comment '商户号(请求系统编号)' after `orderNo`;
alter table tradeRecord add outOrderNo varchar(32) comment '外部商户订单号' after `orderNo`;
alter table tradeRecord add notifyUrl varchar(512) comment '交易结果通知地址' after `productType`;
alter table tradeRecord add totalAmount bigint(20) comment '订单总金额，单位为分' after `status`;
alter table tradeRecord add outOrderCreateDate datetime comment '商户订单生成时间' after `notifyUrl`;
alter table tradeRecord add refundAmount bigint(20) comment '退款金额' after `tradeFinalAmount`;

-- 非交易流水表
drop index IDX_nonTradeRecord on alchemist.nonTradeRecord;
drop table if exists alchemist.nonTradeRecord;
create table alchemist.nonTradeRecord
(
   id                   bigint not null auto_increment comment '主键',
   tradeNo              varchar(32) not null comment '交易流水号（支付系统交易流水号）',
   outOrderNo              varchar(255) comment '外部商户订单号',
   merchantId           varchar(15) comment '商户号(请求系统编号)',
   payGateType          varchar(25) not null comment '网关类型GateWay',
   requestType          varchar(25) not null comment '操作类型',
   bankCode             varchar(10) comment '银行编号(工商银行01020000等等),来自BankType',
   certNo               varchar(18) comment '身份证号码',
   status               char(2) not null comment '业务操作状态',
   notifyUrl varchar(512) comment '非交易结果通知地址',
   createDate           datetime comment '创建时间',
   modifyDate           datetime comment '更新时间',
   errorCode            varchar(30) comment '错误代码',
   errorDesc            varchar(30) comment '错误描述',
   primary key (id),
   unique key AK_nonTradeRecord_tradeNo_Key (tradeNo)
)
ENGINE = InnoDB
COLLATE = utf8_general_ci;
alter table alchemist.nonTradeRecord comment '非交易流水记录表';
create index IDX_nonTradeRecord on alchemist.nonTradeRecord
(
   id,
   payGateType,
   requestType,
   tradeNo,
   status,
   outOrderNo
);

