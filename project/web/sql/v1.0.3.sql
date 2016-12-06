-- 1.lwf:2015-12-18 test(done) pro()
-- 在表payresultcategory增加requestType字段，表alarmlog增加orderNo,errorCode字段
alter table payresultcategory add requestType varchar(20);

alter table alarmlog add orderNo varchar(20);


alter table alarmlog add errorCode varchar(20);
