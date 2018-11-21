create table Member(
	id varchar2(20) not null,
	password varchar2(20) not null,
	name varchar2(20) not null,
	tel varchar2(50),
	address varchar2(200),
	email varchar2(100),
	joindate Date default sysdate,
	role varchar2(20) default 'User',
	enabled number(5) default '1'
)
insert into Member values('maxpia','maxpia','맥스피아','010-1111-1111','서울시 구로구','email@naver.com','','admin','1');
insert into Member(id,password,name) values('test','test','test');
select * from MEMBER where id='maxpia' and password='maxpia';

SELECT * FROM member WHERE id='maxpia'
drop table MEMBER;

select * from member where id ='maxpia'

select * from member;