/*==============================================================*/
/* Table: 银行编码配置表 bankCodeConfig                         */
/*==============================================================*/
drop table if exists alchemist.bankCodeConfig;
CREATE TABLE bankCodeConfig (
  id                   bigint not null auto_increment comment '主键',
  bankCode             varchar(10) NOT NULL COMMENT '统一银行编号',
  payGateId            int(2) not null COMMENT '网关id',
  payGateBankCode      varchar(10) NOT NULL COMMENT '网关银行编号',
  createDate           datetime COMMENT '创建时间',
  modifyDate           datetime COMMENT '更新时间',
  PRIMARY KEY (id)
) 
ENGINE = InnoDB
COLLATE = utf8_general_ci;
alter table alchemist.bankCodeConfig comment '银行编码配置';


-- 银行信息表 bankinfo start
alter table bankinfo add column weight int(3) default 50 comment '权重' after `isVirtual`;
-- alter table bankinfo modify column weight int(3) default 50 comment '权重';
-- 银行信息表 bankinfo end

-- 商户账户信息初始化数据  merchantAccount start
alter table alchemist.merchantAccount modify `merchantAccount` varchar(18) not null comment '商户账户编号';
alter table nonTradeRecord modify `merchantId` varchar(11) not null;
alter table tradeRecord modify `merchantId` varchar(11) not null;
alter table refundRecord modify `merchantId` varchar(11) not null;
alter table merchantTransRecord modify `merchantId` varchar(11) not null;
alter table merchantPPK modify `merchantId` varchar(11) not null;
alter table businessNotifyLog modify `notifySys` varchar(11) not null;
alter table cancelRecord modify `merchantId` varchar(11) not null;
-- 商户账户信息初始化数据  merchantAccount end

alter table alchemist.userBindBankInfo add column merchantId varchar(11) default 'S001' comment '商户号' after `userId`;
alter table alchemist.userBindBankInfo modify column merchantId varchar(11) not null comment '商户号';

-- 银行信息表 nonTradeRecord start
-- alter table nonTradeRecord add column extraCode varchar(50) COMMENT '第三方返回的额外编码';
alter table nonTradeRecord add column userName varchar(50) COMMENT '姓名' after `bankCode`;
-- 银行信息表 nonTradeRecord end


/*==============================================================*/
/* Table: 网关路由支付的操作类型表 payGateRouteSupportBizType                         */
/*==============================================================*/
drop table if exists alchemist.payGateRouteSupportBizType;
CREATE TABLE payGateRouteSupportBizType (
  id bigint       not null auto_increment comment '主键',
  bizTypeId       int(2) not null COMMENT '操作类型id',
  bizTypeCode     varchar(20) NOT NULL COMMENT '操作类型编码',
  createDate      datetime COMMENT '创建时间',
  modifyDate      datetime COMMENT '更新时间',
  PRIMARY KEY (id)
) 
ENGINE = InnoDB
COLLATE = utf8_general_ci;
alter table alchemist.payGateRouteSupportBizType comment '网关路由支持的操作类型表';


/*==============================================================*/
/* Table: 银行网关配置表 bankPayGateRouteConfig                    */
/*==============================================================*/
drop index IDX_bankPayGateRouteConfig on alchemist.bankPayGateRouteConfig;
alter table bankPayGateRouteConfig drop foreign key FK_bankPayGateRouteConfig_bankinfo;
DROP TABLE IF EXISTS bankPayGateRouteConfig;
CREATE TABLE bankPayGateRouteConfig (
  id bigint  not null auto_increment comment '主键',
  merchantId varchar(20) not null comment '商户id',
  bankCode   varchar(10) not null comment '银行编号',
  bizTypeId  int(2) not null comment '网关路由支持的操作类型id',
  platform   varchar(20) not null comment '平台',
  payGateIds varchar(20) not null comment '网关id',
  createDate datetime default null,
  modifyDate datetime default null,
  PRIMARY KEY (id)
) 
ENGINE = InnoDB
COLLATE = utf8_general_ci;
alter table alchemist.bankPayGateRouteConfig comment '银行网关路由配置表';
create index IDX_bankPayGateRouteConfig on alchemist.bankPayGateRouteConfig
(
   id,
   bankCode
);

-- 外键关系移除(待稳定之后再添加)
-- alter table bankMaintain add constraint FK_bankMaintain_paygate foreign key(payGateId) REFERENCES paygate(payGateId);
alter table bankMaintain drop foreign key FK_bankMaintain_paygate;
-- alter table bankMaintain add constraint FK_bankMaintain_bankinfo foreign key(bankCode) REFERENCES bankInfo(bankCode);
alter table bankMaintain drop foreign key FK_bankMaintain_bankinfo;
-- alter table payGateBankQuota add constraint FK_payGateBankQuota_paygate foreign key(payGateId) REFERENCES paygate(payGateId);
alter table payGateBankQuota drop foreign key FK_payGateBankQuota_paygate;
-- alter table payGateBankQuota add constraint FK_payGateBankQuota_bankinfo foreign key(bankCode) REFERENCES bankInfo(bankCode);
alter table payGateBankQuota drop foreign key FK_payGateBankQuota_bankinfo;
-- alter table bankPayGateRouteConfig add constraint FK_bankPayGateRouteConfig_bankinfo foreign key(bankCode) REFERENCES bankInfo(bankCode);
alter table bankPayGateRouteConfig drop foreign key FK_bankPayGateRouteConfig_bankinfo;
