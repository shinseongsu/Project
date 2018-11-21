create table event(
	rownumber number(5),
	title varchar2(100),
	id varchar2(100),
	writedate Date default sysdate,
	image varchar2(1000),
	content varchar2(1000),
	hit number(5) default '0'
);


drop table event;
