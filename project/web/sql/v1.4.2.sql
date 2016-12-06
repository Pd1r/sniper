
/*==============================================================*/
/* Table: 银行信息表 bankinfo                         */
/*==============================================================*/
drop index IDX_bankinfo on alchemist.bankinfo;
drop table if exists alchemist.bankinfo;
CREATE TABLE bankinfo (
  id                   bigint not null auto_increment comment '主键',
  bankName             varchar(50) DEFAULT NULL COMMENT '银行名称',
  bankCode             varchar(10) NOT NULL COMMENT '银行编号',
  isVirtual            int(2) default 0 comment '是否虚拟银行, 0:否,1:是' COMMENT '是否虚拟银行',
  createDate           datetime COMMENT '创建时间',
  modifyDate           datetime COMMENT '更新时间',
  PRIMARY KEY (id),
  unique key AK_bankinfo_bankCode_Key (bankCode)
) 
ENGINE = InnoDB
COLLATE = utf8_general_ci;
alter table alchemist.bankinfo comment '银行网关配置表';
create index IDX_bankinfo on alchemist.bankinfo
(
   id,
   bankCode
);



/*==============================================================*/
/* Table: 网关银行维护表 bankMaintain                    */
/*==============================================================*/
drop index IDX_bankMaintain on alchemist.bankMaintain;
alter table bankMaintain drop foreign key FK_bankMaintain_paygate;
alter table bankMaintain drop foreign key FK_bankMaintain_bankinfo;
drop table if exists alchemist.bankMaintain;
CREATE TABLE bankMaintain (
  id                   bigint not null auto_increment comment '主键',
  payGateId            int(2) not null COMMENT '网关id',
  bankCode             varchar(10) NOT NULL COMMENT '银行编号',
  startDate            varchar(10) NOT NULL COMMENT '开始日期',
  startTime            varchar(10) NOT NULL COMMENT '开始时间',
  endTime              varchar(10) NOT NULL COMMENT '结束时间',
  repeattimes          varchar(10) NOT NULL COMMENT '重复次数（一次：one，每天：every）',
  platform             varchar(10) NOT NULL COMMENT '平台 (IOS,WEB,H5,ANDROID)',
  createDate           datetime COMMENT '创建时间',
  modifyDate           datetime COMMENT '更新时间',
  PRIMARY KEY (id)
) 
ENGINE = InnoDB
COLLATE = utf8_general_ci;
alter table alchemist.bankMaintain comment '网关银行维护表';
create index IDX_bankMaintain on alchemist.bankMaintain
(
   id,
   payGateId,
   bankCode
);
alter table bankMaintain add constraint FK_bankMaintain_paygate foreign key(payGateId) REFERENCES paygate(payGateId);
alter table bankMaintain add constraint FK_bankMaintain_bankinfo foreign key(bankCode) REFERENCES bankInfo(bankCode);

/*==============================================================*/
/* Table: 网关银行限额表 payGateBankQuota                    */
/*==============================================================*/
drop index IDX_payGateBankQuota on alchemist.payGateBankQuota;
alter table payGateBankQuota drop foreign key FK_payGateBankQuota_paygate;
alter table payGateBankQuota drop foreign key FK_payGateBankQuota_bankinfo;
drop table if exists alchemist.payGateBankQuota;
CREATE TABLE payGateBankQuota (
  id                   bigint not null auto_increment comment '主键',
  payGateId            int(2) not null COMMENT '网关id',
  bankCode             varchar(10) NOT NULL COMMENT '银行编号',
  `singleLimit` bigint   COMMENT '单笔限额',
  `dayLimit` bigint   COMMENT '日限额',
  `monthLimit` bigint   COMMENT '月限额',
  createDate datetime COMMENT '创建时间',
  modifyDate           datetime COMMENT '更新时间',
  PRIMARY KEY (id)
) 
ENGINE = InnoDB
COLLATE = utf8_general_ci;
alter table alchemist.payGateBankQuota comment '网关银行限额表';
create index IDX_payGateBankQuota on alchemist.payGateBankQuota
(
   id,
   payGateId,
   bankCode
);
alter table payGateBankQuota add constraint FK_payGateBankQuota_paygate foreign key(payGateId) REFERENCES paygate(payGateId);
alter table payGateBankQuota add constraint FK_payGateBankQuota_bankinfo foreign key(bankCode) REFERENCES bankInfo(bankCode);

/*==============================================================*/
/* Table: 银行网关配置表 mz_bankinfo                    */
/*==============================================================*/
drop index IDX_bankPayGateRouteConfig on alchemist.bankPayGateRouteConfig;
alter table bankPayGateRouteConfig drop foreign key FK_bankPayGateRouteConfig_bankinfo;
DROP TABLE IF EXISTS bankPayGateRouteConfig;
CREATE TABLE bankPayGateRouteConfig (
  id bigint not null auto_increment comment '主键',
  bankCode varchar(10) not null comment '银行编号',
  webPaygateId varchar(12) default null comment 'web支付网关ID列表',
  h5PaygateId varchar(12) default null comment 'h5支付网关ID列表',
  iOSPaygateId varchar(12) default null comment 'ios支付网关ID列表',
  androidPaygateId varchar(12) default null comment 'android支付网关ID列表',
  createDate datetime default null,
  modifyDate datetime default null,
  PRIMARY KEY (id)
) 
ENGINE = InnoDB
COLLATE = utf8_general_ci;
alter table alchemist.bankPayGateRouteConfig comment '银行网关配置表';
create index IDX_bankPayGateRouteConfig on alchemist.bankPayGateRouteConfig
(
   id,
   bankCode
);
alter table bankPayGateRouteConfig add constraint FK_bankPayGateRouteConfig_bankinfo foreign key(bankCode) REFERENCES bankInfo(bankCode);


/*==============================================================*/
/* Table: merchantPPK       三方商户公私钥安全性配置                                     */
/*==============================================================*/
drop table if exists alchemist.merchantPPK;
create table alchemist.merchantPPK
(
   id                   bigint not null auto_increment comment '主键',
   ppkCode              varchar(32) not null comment '三方商户公私钥编号',
   merchantId           varchar(15) not null comment '三方商户号',
   payGateCode          varchar(32) not null comment '支付渠道编号',
   name                 varchar(128) comment '配置名称',
   `desc`               varchar(512) comment '配置描述',
   privateKey           varchar(128) not null comment '私钥(值/路径)',
   publicKey            varchar(128) not null comment '公钥(证书)(值/路径)',
   isPath               tinyint(1) comment '是否配置为文件(取值为1或0)',
   cfgData              varchar(255) comment '扩展属性',
   createDate           datetime comment '创建时间',
   modifyDate           datetime comment '更新时间',
   primary key (id)
)
ENGINE = InnoDB
COLLATE = utf8_general_ci;
alter table alchemist.merchantPPK comment '三方商户公私钥安全性配置';

/*==============================================================*/
/* Table: merchantPPKRelation    三方商户公私钥关系配置                                */
/*==============================================================*/
drop table if exists alchemist.merchantPPKRelation;
create table alchemist.merchantPPKRelation
(
   id                   bigint not null auto_increment comment '主键',
   ppkCode              varchar(32) not null comment '三方商户公私钥编号',
   requestType          varchar(25) not null comment '请求类型',
   createDate           datetime comment '创建时间',
   modifyDate           datetime comment '更新时间',
   primary key (id)
)
ENGINE = InnoDB
COLLATE = utf8_general_ci;
alter table alchemist.merchantPPKRelation comment '三方商户公私钥关系配置';


/*==============================================================*/
/* Table: bindCardRecord       绑卡记录                                    */
/*==============================================================*/
drop index IDX_userBindBankInfo on alchemist.userBindBankInfo;
drop table if exists alchemist.userBindBankInfo;
create table alchemist.userBindBankInfo
(
   id                   bigint not null auto_increment comment '主键',
   userId               bigint comment '商户用户唯一标识',  
   payGateType        	varchar(18)  not null comment '网关',
   bankCode           	varchar(15) not null  comment '银行编码',
   cardNumber         	varchar(21) not null comment '所属银行编码的银行卡号',
   certNo             	varchar(18) not null  comment '身份证号',
   userName          	varchar(30) not null comment '姓名',
   mobile             	varchar(11)  comment '银行预留手机号',
   bindId             	varchar(50) comment '第三方返回的绑卡成功的唯一凭证',
   bindStatus           ENUM('BIND','UNBIND','BIND_FAIL','RELIEVE_BIND') comment '绑卡状态(BIND:已绑卡,UNBIND:未绑卡,BIND_FAIL:绑卡失败,RELIEVE_BIND:解绑)',
   province             varchar(50) comment '开户省',
   city    varchar(50)   comment   '开户市',
   openBank   varchar(50)   comment   '开户行',
   expiredTime   datetime   comment   '失效时间',
   createDate           datetime comment '创建时间',
   modifyDate           datetime comment '更新时间',
   primary key (id)
)
ENGINE = InnoDB
COLLATE = utf8_general_ci;
alter table alchemist.userBindBankInfo comment '绑卡记录 ';
/*alter table alchemist.bindRecord add unique index(payGateType, certNo, cardNumber);*/
create index IDX_userBindBankInfo on alchemist.userBindBankInfo
(
   id,
   bindId
);


-- 非交易流水表 nonTradeRecord start
alter table nonTradeRecord add column mobile varchar(11) comment '手机号' after `cardNo`;
-- 非交易流水表 nonTradeRecord end 

-- 交易流水记录信息表 tradeRecordInfo start
alter table tradeRecordInfo add column extraCode varchar(32) comment '第三方外部编号' after `transId`;
-- 交易流水记录信息表 tradeRecordInfo end 

