-- 非交易表更新 nontradeRecord
alter table nontradeRecord add cardNo varchar(25) comment '银行卡号' after `certNo`;
alter table nontradeRecord add buyerUserId bigint(20) comment '米庄用户id' after `cardNo`;
-- alter table nontradeRecord modify COLUMN buyerUserId bigint(20) comment '米庄用户id' after `cardNo`;

-- 交易表更新 tradeRecord
alter table tradeRecord add buyerUserId bigint(20) comment '用户ID(米庄用户或爱学贷用户)' after `outOrderCreateDate`;
alter table tradeRecord add transFinishDate datetime comment '交易完成时间' after `buyerUserId`;

alter table businessnotifylog add retryTimes int default 0 comment '重试次数' after `count`;
alter table businessNotifyLog modify COLUMN `status` ENUM('U','INIT', 'FAIL', 'D') comment '通知状态' after `notifyData`;
alter table businessNotifyLog add notifyUrl varchar(512) comment '交易结果通知地址' after `notifySource`;
-- 允许通知内容为null
alter table businessNotifyLog modify COLUMN `notifyData` text comment '通知内容';

alter table bizFrontLog modify COLUMN `businessCode` varchar(64);

/*==============================================================*/
/* Table: 交易流水记录信息表 tradeRecordInfo                         */
/*==============================================================*/
drop index IDX_tradeRecordInfo on alchemist.tradeRecordInfo;
drop table if exists alchemist.tradeRecordInfo;
create table alchemist.tradeRecordInfo
(
   id                   bigint not null auto_increment comment '主键',
   transId              varchar(32) not null comment '交易流水号',
   mobile               varchar(11) comment '手机号码',
   productName          varchar(50) comment '商品名称',
   remark               varchar(512) comment '备注',
   imei                 varchar(128) comment '设备号',
   createDate           datetime comment '创建时间',
   modifyDate           datetime comment '更新时间',
   primary key (id),
   unique key AK_tradeRecordInfo_tradeNo_Key (transId)
)
ENGINE = InnoDB
COLLATE = utf8_general_ci;
alter table alchemist.tradeRecordInfo comment '交易流水记录信息表';
create index IDX_tradeRecordInfo on alchemist.tradeRecordInfo
(
   id,
   transId,
   mobile
);

/*==============================================================*/
/* Table: 退款流水表 refundRecord                          */
/*==============================================================*/
drop index refundRecord_IDX on alchemist.refundRecord; 
drop table if exists alchemist.refundRecord; 
create table alchemist.refundRecord 
( 
id bigint not null auto_increment comment '主键', 
transId varchar(32) not null comment '退款流水号', 
merchantId varchar(11) not null comment '商户号',
outRefundNo varchar(255) not null comment '商户外部退款号', 
origOutOrderNo varchar(255) not null comment '原外部订单号', 
origTradeNo varchar(255) not null comment '原交易流水号', 
status enum('F','S','H') comment '退款状态;S成功,H处理中,F失败',
errorCode varchar(30) comment '错误代码', 
errorDesc varchar(30) comment '错误描述', 
returnCode varchar(30) comment '返回代码', 
returnDesc varchar(30) comment '返回描述', 
amount bigint(20) comment '退款金额',
refundFinalAmount bigint(20) comment '最终退款金额',
cause varchar(255) comment '退款说明',
payGateType varchar(25) comment '网关类型',
createDate datetime comment '创建时间', 
modifyDate datetime comment '更新时间', 
transFinishDate datetime comment '退款完成时间', 

primary key (id), 
unique key AK_refundRecord_tradeNo_Key (transId), 
unique key AK_refundRecord_outRefundNo_Key (outRefundNo, merchantId) 
) 
ENGINE = InnoDB 
COLLATE = utf8_general_ci; 
alter table alchemist.refundRecord comment '退款流水记录表'; 
/*==============================================================*/ 
/* Index: refundRecord_IDX */ 
/*==============================================================*/ 
create index refundRecord_IDX on alchemist.refundRecord 
( 
id, 
transId, 
outRefundNo 
); 

/*==============================================================*/
/* Table: 商户交易流水表 merchantTransRecord                          */
/*==============================================================*/
drop index merchantTransRecord_IDX on alchemist.merchantTransRecord; 
drop table if exists alchemist.merchantTransRecord; 
create table alchemist.merchantTransRecord 
( 
id bigint not null auto_increment comment '主键', 
merchantId varchar(11) not null comment '商户号',
transId varchar(32) not null comment '交易流水', 
outOrderNo varchar(255) comment '外部订单号', 
origOutOrderNo varchar(255) comment '原外部订单号', 
amount bigint(20) comment '流水金额',
status enum('F','S','H') comment '退款状态;S成功,H处理中,F失败',
transFinishDate datetime comment '交易完成时间', 
requestType enum('CANCEL','PAY','REFUND','REPAY','REPAYMENT','WITHDRAW') comment '请求类型',
reconStatus enum('FINISH', 'UN_CHECK', 'MONEY_UNEVEN','STATE_UNEVEN', 'UNILATERAL') default 'UN_CHECK' comment '对账状态',
reconFinishDate datetime comment '对账完成时间', 
reconReason varchar(255) comment '对账结果', 
createDate datetime comment '创建时间', 
modifyDate datetime comment '更新时间', 
primary key (id)
) 
ENGINE = InnoDB 
COLLATE = utf8_general_ci; 
alter table alchemist.merchantTransRecord comment '商户交易流水表'; 
/*==============================================================*/
/* Index: merchantTradeRecord_IDX                                   */
/*==============================================================*/
create index merchantTransRecord_IDX on alchemist.merchantTransRecord
(
   id,
   transId,
   merchantId
);


/*==============================================================*/
/* Table: merchantAccount  商户账户信息                                     */
/*==============================================================*/
drop index merchantAccount_IDX on alchemist.merchantAccount;
drop table if exists alchemist.merchantAccount;
create table alchemist.merchantAccount
(
   id                   bigint not null auto_increment comment '主键',
   merchantId           varchar(11) not null comment '商户唯一ID',
   merchantAccount      varchar(11) not null comment '商户账户编号',
   merchantName         varchar(128) comment '商户名称',
   merchantDesc         varchar(512) not null comment '商户描述',
   createDate           datetime comment '创建时间',
   modifyDate           datetime comment '更新时间',
   primary key (id, merchantId, merchantAccount)
)
ENGINE = InnoDB
COLLATE = utf8_general_ci;
alter table alchemist.merchantAccount comment '商户账户信息';
/*==============================================================*/
/* Index: merchantAccount_IDX                                   */
/*==============================================================*/
create index merchantAccount_IDX on alchemist.merchantAccount
(
   id,
   merchantId,
   merchantAccount,
   merchantName
);



/*==============================================================*/
/* Table: cancelRecord  撤消交易流水信息                                     */
/*==============================================================*/
drop index cancelRecord_IDX on alchemist.cancelRecord;
drop table if exists alchemist.cancelRecord;
create table alchemist.cancelRecord
(
   id                   bigint not null auto_increment comment '主键',
   transId           varchar(32) not null comment '支付系统生成的撤消流水',
   merchantId           varchar(11) not null comment '商户唯一ID',
   origOutOrderNo         varchar(255) not null comment '原外部订单号', 
   origTradeNo             varchar(255) not null comment '原交易流水号', 
   status                 enum('F','S','H') not null comment '撤消状态;S成功,H处理中,F失败',
   errorCode             varchar(30) comment '错误代码', 
   errorDesc             varchar(30) comment '错误描述',
   returnCode       varchar(30) comment '返回代码', 
   returnDesc       varchar(30) comment '返回描述', 
   cause          varchar(255) comment '撤消原因',
   createDate           datetime comment '创建时间',
   modifyDate           datetime comment '更新时间',
   transFinishDate datetime comment '撤消完成时间', 
   primary key (id)
)
ENGINE = InnoDB
COLLATE = utf8_general_ci;
alter table alchemist.cancelRecord comment '撤消交易流信息';
/*==============================================================*/ 
/* Index: cancelRecord_IDX */ 
/*==============================================================*/ 
create index cancelRecord_IDX on alchemist.cancelRecord 
( 
id, 
transId,
origOutOrderNo, 
merchantId 
); 


/*==============================================================*/
/* Table: systemParameter                                       */
/*==============================================================*/
drop index systemParameter_IDX on alchemist.systemParameter;
drop table if exists alchemist.systemParameter;
create table alchemist.systemParameter
(
   id                   bigint not null auto_increment comment '主键',
   parameterCode        varchar(32) not null comment '系统参数编号',
   parameterValue       varchar(100) not null comment '系统参数值',
   parameterName        varchar(50) comment '系统参数名称',
   parameterDesc        varchar(200) comment '系统参数描述',
   cfgData              varchar(255) comment '附加值',
   enable               tinyint(1) comment '是否启用,0为不可用,1为可用',
   createDate           datetime comment '创建时间',
   modifyDate           datetime comment '更新时间',
   primary key (id)
)
ENGINE = InnoDB
COLLATE = utf8_general_ci;
alter table alchemist.systemParameter comment '参数配置表';
/*==============================================================*/
/* Index: systemParameter_IDX                                   */
/*==============================================================*/
create index systemParameter_IDX on alchemist.systemParameter
(
   id,
   parameterCode
);

