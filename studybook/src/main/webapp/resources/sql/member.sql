create table member(
email VARCHAR2(40) NOT NULL UNIQUE,
password VARCHAR2(20) NOT NULL,
	name VARCHAR2(40) NOT NULL ,
	phone VARCHAR2(11) NOT NULL,
	key number(10) NOT NULL constraint member_key_pk primary key,
	profile varchar2(200)
);

 

drop table member;

select * from member;

delete from member where name = '관리자';

insert into member values('관리자', '1234', 'admin@studybook.com', '0101111111', 999, 'default.png');

