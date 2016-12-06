alter table businessNotifyLog add `source` MEDIUMINT(1) DEFAULT 1 comment '通知添加来源（1:系统，0:手动添加）';

drop index payGate_IDX on alchemist.payGate;
drop table if exists alchemist.payGate;
/*==============================================================*/
/* Table: payGate                                               */
/*==============================================================*/
create table alchemist.payGate
(
   id                   bigint not null auto_increment comment '主键',
   payGateCode          varchar(32) not null comment '支付网关编号',
   payGateName          varchar(32) comment '支付网关名称',
   defaultConnectTimeout bigint not null comment '默认连接超时时间，单位毫秒',
   defaultResponseTimeout bigint not null comment '默认响应超时时间，单位毫秒',
   createDate           timestamp comment '创建时间',
   modifyDate           datetime comment '更新时间',
   primary key (id),
   unique key AK_PAYGATECODE_UNIQUE_KEY (payGateCode)
)
ENGINE = InnoDB
COLLATE = utf8_general_ci;
alter table alchemist.payGate comment '网关配置表';
create index payGate_IDX on alchemist.payGate
(
   id,
   payGateCode
);



drop index payGateAction_IDX on alchemist.payGateAction;
drop table if exists alchemist.payGateAction;
/*==============================================================*/
/* Table: payGateAction                                         */
/*==============================================================*/
create table alchemist.payGateAction
(
   id                   bigint not null auto_increment comment '主键',
   payGateCode          varchar(32) not null comment '支付网关编号',
   bizDefineType        varchar(32) not null comment '业务操作类型',
   connectTimeout       bigint not null comment '连接超时时间，单位毫秒。不存在则取payGate默认',
   responseTimeout      bigint not null comment '响应超时时间，单位毫秒。不存在则取payGate默认',
   requestUrl           varchar(255) comment '第三方网关请求地址',
   returnUrl            varchar(255) comment '支付系统对于第三方的回调地址',
   createDate           timestamp comment '创建时间',
   modifyDate           datetime comment '更新时间',
   primary key (id, payGateCode, bizDefineType)
)
ENGINE = InnoDB
COLLATE = utf8_general_ci;
alter table alchemist.payGateAction comment '网关行为配置表';
create index payGateAction_IDX on alchemist.payGateAction
(
   id,
   payGateCode,
   bizDefineType
);

drop table if exists alchemist.emailReceive;
/*==============================================================*/
/* Table: emailReceive                                         */
/*==============================================================*/
create table alchemist.emailReceive
(
   id                    bigint not null auto_increment comment '主键',
   emailAddress          varchar(255) DEFAULT NULL COMMENT '收件人邮件地址',
   name                  varchar(255) DEFAULT NULL COMMENT '收件人姓名',
   PRIMARY KEY (id)
)
ENGINE = InnoDB
COLLATE = utf8_general_ci;
alter table alchemist.emailReceive comment '邮件收取配置表';


