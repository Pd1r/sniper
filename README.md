# 分层说明

## api
    对内服务，dubbo服务

## face
    对外服务，http请求

## project
    sniper-project 模块下两种服务类型：
    com.lmg.sniper.service-atom  只针对数据库的原子层操作。
    com.lmg.sniper.service-logic 主要是针对业务逻辑处理。

    service-atom服务只能调用对应的mapper，service-logic服务不能调用任何mapper，但可以调用任何service-atom服务。
