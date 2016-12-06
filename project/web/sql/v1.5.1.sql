-- 银行信息表 nonTradeRecord start
alter table nonTradeRecord add column bindId varchar(50) COMMENT '绑卡id/客户id';
-- 银行信息表 nonTradeRecord end

/*==============================================================*/
/* Table: 提现申请表 withdrawApply                         */
/*==============================================================*/
drop index IDX_withdrawApplyRecord on alchemist.withdrawApplyRecord;
drop table if exists alchemist.withdrawApplyRecord;
CREATE TABLE withdrawApplyRecord (
  id                   bigint not null auto_increment comment '主键',
  transId            varchar(50) NOT NULL COMMENT '交易流水号',
  outOrderNo           varchar(50) NOT NULL COMMENT '外部商户订单号',
  merchantId            varchar(11) NOT NULL COMMENT '商户号',
  payGateType            varchar(25) NOT NULL COMMENT '网关',
  tradeAmount          bigint(20) NOT NULL COMMENT '申请提现金额',
  status              char(2) NOT NULL COMMENT '申请提现状态',
  returnCode            varchar(11) COMMENT '支付系统错误码',
  createDate           datetime COMMENT '创建时间',
  modifyDate          datetime COMMENT '更新时间',
  PRIMARY KEY (id)
) 
ENGINE = InnoDB
COLLATE = utf8_general_ci;
alter table alchemist.withdrawApplyRecord comment '提现申请';
create index IDX_withdrawApplyRecord on alchemist.withdrawApplyRecord
(
   id,
   transId
);


/*==============================================================*/
/* Table: 冲正表 reverseRecord                         */
/*==============================================================*/
drop index IDX_reverseRecord on alchemist.reverseRecord;
drop table if exists alchemist.reverseRecord;
CREATE TABLE reverseRecord (
  id                   bigint not null auto_increment comment '主键',
  transId            varchar(50) NOT NULL COMMENT '交易流水号',
  payGateType            varchar(25) NOT NULL COMMENT '网关',
  requestType            varchar(25) NOT NULL COMMENT '冲正类型',
  tradeAmount          bigint(20) NOT NULL COMMENT '冲正金额',
  status              char(2) NOT NULL COMMENT '冲正状态',
  returnCode            varchar(11) COMMENT '支付系统错误码',
  createDate           datetime COMMENT '创建时间',
  modifyDate          datetime COMMENT '更新时间',
  PRIMARY KEY (id)
) 
ENGINE = InnoDB
COLLATE = utf8_general_ci;
alter table alchemist.reverseRecord comment '冲正记录表';
create index IDX_reverseRecord on alchemist.reverseRecord
(
   id,
   transId
);

/*==============================================================*/
/* Table: IP白名单表 whiteIps                         */
/*==============================================================*/
drop table if exists alchemist.whiteIps;
CREATE TABLE whiteIps (
  id                   bigint not null auto_increment comment '主键',
  ipAddress            varchar(15) NOT NULL COMMENT 'ip地址',
  merchantId           varchar(11) not null commit '商户id',
  requestType          varchar(25) COMMENT '操作类型',
  createDate           datetime COMMENT '创建时间',
  modifyDate          datetime COMMENT '更新时间',
  PRIMARY KEY (id)) 
ENGINE = InnoDB
COLLATE = utf8_general_ci;
alter table alchemist.whiteIps comment 'ip白名单';

-- 网关配置表 payGateAction start
alter table payGateAction add column requestType varchar(30) COMMENT '请求类型' after bizDefineType;
alter table payGateAction add column executeType varchar(30) COMMENT '执行类型' after requestType;
-- 网关配置表 payGateAction end

/*==============================================================*/
/* Table: 渠道特色payGateFeature                         */
/*==============================================================*/
drop table if exists alchemist.payGateFeature;
CREATE TABLE payGateFeature (
  id                   bigint not null auto_increment comment '主键',
  payGateType          varchar(32) NOT NULL COMMENT '支付网关编号',
  allowPayUnAhth       int NOT NULL COMMENT '是否允许未认证支付',
  allowRepateAuth      int NOT NULL COMMENT '是否允许重复认证',
  allowRepay           int NOT NULL COMMENT '是否允许代付',
  createDate           datetime COMMENT '创建时间',
  modifyDate          datetime COMMENT '更新时间',
  PRIMARY KEY (id,payGateType)
 ) 
ENGINE = InnoDB
COLLATE = utf8_general_ci;
alter table alchemist.payGateFeature comment '渠道特色';

/*==============================================================*/
/* Table: 月交易统计monthTradeStatistics                         */
/*==============================================================*/
drop index month_MonthTradeStatistics on alchemist.monthTradeStatistics;
drop table if exists alchemist.monthTradeStatistics;
CREATE TABLE monthTradeStatistics (
  id                   bigint not null auto_increment comment '主键',
  userId         bigint NOT NULL COMMENT '用户id',
  merchantId      varchar(11) COMMENT '商户ID',
  month           varchar(32) COMMENT '月份',
  tradeNum       int not null COMMENT '交易次数',
  tradeSum        bigint not null COMMENT '交易额',
  createDate           datetime COMMENT '创建时间',
  modifyDate          datetime COMMENT '更新时间',
  PRIMARY KEY (id)
 ) 
ENGINE = InnoDB
COLLATE = utf8_general_ci;
alter table alchemist.monthTradeStatistics comment '月交易统计';
create index month_MonthTradeStatistics on alchemist.monthTradeStatistics
(
   userId,
   merchantId,
   month
);

/*==============================================================*/
/* Table: 日交易统计dayTradeStatistics                         */
/*==============================================================*/
drop index Day_DayTradeStatistics on alchemist.dayTradeStatistics;
drop table if exists alchemist.dayTradeStatistics;
CREATE TABLE dayTradeStatistics (
  id                   bigint not null auto_increment comment '主键',
  userId         bigint NOT NULL COMMENT '用户id',
  merchantId      varchar(11) COMMENT '商户唯一ID',
  day           varchar(32) COMMENT '日期',
  tradeNum       int not null COMMENT '交易次数',
  tradeSum        bigint not null COMMENT '交易额',
  createDate           datetime COMMENT '创建时间',
  modifyDate          datetime COMMENT '更新时间',
  PRIMARY KEY (id)
 ) 
ENGINE = InnoDB
COLLATE = utf8_general_ci;
alter table alchemist.dayTradeStatistics comment '日交易统计';
create index Day_DayTradeStatistics on alchemist.dayTradeStatistics
(
   userId,
   merchantId,
   day
);
