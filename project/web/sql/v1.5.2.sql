-- 索引创建
drop index IDX_MERT_TRANSRECORD on alchemist.tradeRecord;
create index IDX_MERT_TRANSRECORD on alchemist.tradeRecord
(
   merchantId,
   outOrderNo
);
drop index IDX_immediatelyNotify on alchemist.businessnotifylog;
create index IDX_immediatelyNotify on alchemist.businessnotifylog
(
   immediatelyNotify
);
drop index IDX_MERT_TRANSID on alchemist.merchanttransrecord;
create index IDX_MERT_TRANSID on alchemist.merchanttransrecord
(
   transId,
   merchantId
);

-- 对账流水
alter table alchemist.merchantTransRecord modify COLUMN reconStatus enum('FINISH', 'MONEY_UNEVEN', 'STATE_UNEVEN','UN_CHECK', 'UNILATERAL_RECON', 'UNILATERAL_TRANS') default 'UN_CHECK' comment '对账状态';

/*==============================================================*/
/* Table: 渠道交易流水表 channelTransRecord                         */
/*==============================================================*/
drop index IDX_channelTransRecord on alchemist.channelTransRecord;
drop table if exists alchemist.channelTransRecord;
CREATE TABLE channelTransRecord (
  id                   bigint not null auto_increment COMMENT '主键',
  transId            varchar(32) NOT NULL COMMENT '支付系统交易流水号',
  channelTransId           varchar(64) NOT NULL COMMENT '渠道交易流水号',
  extraOrderNo           varchar(32) COMMENT '第三方外部订单号',
  channelCode            varchar(10) COMMENT '渠道错误码',
  channelMessage            varchar(200) COMMENT '渠道错误码描述',
  createDate           datetime COMMENT '创建时间',
  modifyDate          datetime COMMENT '更新时间',
  PRIMARY KEY (id)
) 
ENGINE = InnoDB
COLLATE = utf8_general_ci;
alter table alchemist.channelTransRecord COMMENT '渠道交易流水表';
create index IDX_channelTransRecord on alchemist.channelTransRecord
(
   id,
   transId,
   channelTransId
);

-- 交易流水表 tradeRecord start
alter table tradeRecord add column lastChannelTransId varchar(64) COMMENT '最新渠道交易流水号' after outOrderNo;
-- 交易流水表 tradeRecord end

/*==============================================================*/
/* Table: 后台操作记录      backGroundActionRecord                   */
/*==============================================================*/
drop table if exists alchemist.backGroundActionRecord;
CREATE TABLE backGroundActionRecord (
  id                   bigint not null auto_increment COMMENT '主键',
  username            varchar(30) NOT NULL COMMENT '用户名',
  `action`           varchar(50) not null COMMENT '动作',
  detail            varchar(500) not null COMMENT '动作详情',
  createDate           datetime COMMENT '创建时间',
  modifyDate          datetime COMMENT '更新时间',
  PRIMARY KEY (id)) 
ENGINE = InnoDB
COLLATE = utf8_general_ci;
alter table alchemist.backGroundActionRecord COMMENT '后台操作记录';

/*==============================================================*/
/* Table: 对公代付申请流水表 corpRepaymentApplyRecord                         */
/*==============================================================*/
drop index IDX_corpRepaymentApplyRecord on alchemist.corpRepaymentApplyRecord;
drop table if exists alchemist.corpRepaymentApplyRecord;
CREATE TABLE corpRepaymentApplyRecord (
  id                   bigint not null auto_increment COMMENT '主键',
  channelTransId              varchar(32) NOT NULL COMMENT '支付系统对公代付申请流水号',
  merchantId           varchar(11) NOT NULL COMMENT '商户号',
  outOrderNo           varchar(32) NOT NULL COMMENT '外部商户订单号',
  payGateType          varchar(25) NOT NULL COMMENT '网关',
  cardNo               varchar(21) DEFAULT NULL COMMENT '收款账号',
  userName               varchar(100) DEFAULT NULL COMMENT '收款账号户名',
  bankCode               varchar(100) DEFAULT NULL COMMENT '银行编码 ',
  tradeAmount          bigint(20) NOT NULL COMMENT '交易金额，单位为分',
  `status`             char(2) NOT NULL COMMENT '状态（对于恒丰来说，此字段表示平台状态，若恒返回01，此字段值为S，若返回其它，此字段值为F）',
  returnCode          varchar(10) COMMENT '支付系统错误码',
  returnMsg          varchar(100) COMMENT '支付系统错误码描述',
  unionBankNo          varchar(30) DEFAULT NULL COMMENT '联行号',
  outOrderCreateDate datetime NOT NULL COMMENT '商户订单生成时间',
  transFinishDate datetime DEFAULT NULL COMMENT '交易成功时间',
  createDate           datetime COMMENT '创建时间',
  modifyDate           datetime COMMENT '更新时间',
  PRIMARY KEY (id),
  unique key AK_corpRepaymentApplyRecord_channelTransId_Key (channelTransId)
) 
ENGINE = InnoDB
COLLATE = utf8_general_ci;
alter table alchemist.corpRepaymentApplyRecord COMMENT '对公代付申请流水表';
create index IDX_corpRepaymentApplyRecord on alchemist.corpRepaymentApplyRecord
(
   id,
   channelTransId,
   outOrderNo,
   merchantId
);

/*==============================================================*/
/* Table: 对公代付流水表 corpRepaymentApplyRecord                         */
/*==============================================================*/
drop index IDX_corpRepaymentRecord on alchemist.corpRepaymentRecord;
drop table if exists alchemist.corpRepaymentRecord;
CREATE TABLE corpRepaymentRecord (
  id                   bigint not null auto_increment COMMENT '主键',
  channelTransId              varchar(32) NOT NULL COMMENT '支付系统对公代付申请流水号，该值等于对公代付申请成功的渠道流水',
  merchantId           varchar(11) NOT NULL COMMENT '商户号',
  outOrderNo           varchar(32) NOT NULL COMMENT '外部商户订单号',
  payGateType          varchar(25) NOT NULL COMMENT '网关',
  tradeAmount          bigint(20) NOT NULL COMMENT '交易金额，单位为分',
  tradeFinalAmount     bigint(20) COMMENT '最终成交金额，单位为分',
  `status`             char(2) NOT NULL COMMENT '交易状态',
  returnCode          varchar(10) COMMENT '支付系统错误码',
  returnMsg       varchar(200) COMMENT '支付系统错误码描述',
  outOrderCreateDate datetime NOT NULL COMMENT '商户订单生成时间',
  transFinishDate datetime DEFAULT NULL COMMENT '交易成功时间',
  createDate           datetime COMMENT '创建时间',
  modifyDate           datetime COMMENT '更新时间',
  PRIMARY KEY (id),
  unique key AK_corpRepaymentRecord_channelTransId_Key (channelTransId)
) 
ENGINE = InnoDB
COLLATE = utf8_general_ci;
alter table alchemist.corpRepaymentRecord COMMENT '对公代付流水表';
create index IDX_corpRepaymentRecord on alchemist.corpRepaymentRecord
(
   id,
   channelTransId,
   outOrderNo,
   merchantId
);

/*==============================================================*/
/* Table: 日交易统计表 daytradestatistics                        */
/*==============================================================*/
alter table daytradestatistics add column tradeSum_HF BIGINT(20) COMMENT '恒丰交易额' after `tradeSum`;
alter table daytradestatistics add column tradeSum_BF BIGINT(20) COMMENT '宝付交易额' after `tradeSum_HF`;
alter table daytradestatistics add column tradeSum_UM BIGINT(20) COMMENT '联动优势交易额' after `tradeSum_BF`;
alter table daytradestatistics add column tradeSum_LL BIGINT(20) COMMENT '连连交易额' after `tradeSum_UM`;
alter table daytradestatistics add column tradeSum_YEE BIGINT(20) COMMENT '易宝交易额' after `tradeSum_LL`;
alter table daytradestatistics add column tradeSum_CHINA BIGINT(20) COMMENT '银联交易额' after `tradeSum_YEE`;

/*==============================================================*/
/* Table: 月交易统计表 monthtradestatistics                        */
/*==============================================================*/
alter table monthtradestatistics add column tradeSum_HF BIGINT(20) COMMENT '恒丰交易额' after `tradeSum`;
alter table monthtradestatistics add column tradeSum_BF BIGINT(20) COMMENT '宝付交易额' after `tradeSum_HF`;
alter table monthtradestatistics add column tradeSum_UM BIGINT(20) COMMENT '联动优势交易额' after `tradeSum_BF`;
alter table monthtradestatistics add column tradeSum_LL BIGINT(20) COMMENT '连连交易额' after `tradeSum_UM`;
alter table monthtradestatistics add column tradeSum_YEE BIGINT(20) COMMENT '易宝交易额' after `tradeSum_LL`;
alter table monthtradestatistics add column tradeSum_CHINA BIGINT(20) COMMENT '银联交易额' after `tradeSum_YEE`;

/*==============================================================*/
/* Table: 线下充值流水表 capitalTransferRecord                         */
/*==============================================================*/
drop index IDX_capitalTransferRecord on alchemist.capitalTransferRecord;
drop table if exists alchemist.capitalTransferRecord;
CREATE TABLE capitalTransferRecord (
  id                   bigint not null auto_increment COMMENT '主键',
  channelTransId              varchar(32) NOT NULL COMMENT '支付系统线下充值流水号',
  outOrderNo           varchar(32) NOT NULL COMMENT '外部商户订单号',
  tradeAmount          bigint(20) NOT NULL COMMENT '交易金额，单位为分',
  tradeFinalAmount     bigint(20) COMMENT '最终成交金额，单位为分',
  `status`             char(2) NOT NULL COMMENT '交易状态',
  returnCode          varchar(10) COMMENT '支付系统错误码',
  returnMsg         varchar(10) COMMENT '支付系统错误码描述',
  notifyUrl varchar(512) comment '回调地址',
  outOrderCreateDate datetime NOT NULL COMMENT '商户订单生成时间',
  transFinishDate datetime DEFAULT NULL COMMENT '交易成功时间',
  createDate           datetime COMMENT '创建时间',
  modifyDate           datetime COMMENT '更新时间',
  PRIMARY KEY (id),
  unique key AK_capitalTransferRecord_channelTransId_Key (channelTransId)
) 
ENGINE = InnoDB
COLLATE = utf8_general_ci;
alter table alchemist.capitalTransferRecord COMMENT '线下充值流水表';
create index IDX_capitalTransferRecord on alchemist.capitalTransferRecord
(
   id,
   channelTransId,
   outOrderNo
);