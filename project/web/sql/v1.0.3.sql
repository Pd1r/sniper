-- 1.lwf:2015-12-18 test(done) pro()
-- �ڱ�payresultcategory����requestType�ֶΣ���alarmlog����orderNo,errorCode�ֶ�
alter table payresultcategory add requestType varchar(20);

alter table alarmlog add orderNo varchar(20);


alter table alarmlog add errorCode varchar(20);
