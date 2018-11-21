create table movie(
	title varchar2(100),
	rate number(10),
	startdate date,
	enddate date,
	director varchar2(100),
	actor varchar2(100),
	genre varchar2(50),
	age varchar2(50),
	showtime varchar2(50),
	language varchar2(100),
	explain varchar2(4000),
	explain2 varchar2(4000),
	image varchar2(100)
);
drop table movie;
insert into movie values('완벽한 타인','10506',sysdate,sysdate,'이재규','유해진, 조진웅, 이서진','드라마,코미디','15세이상','116분','한국',
						 '우리 게임 한 번 해볼까? 다들 핸드폰 올려봐
저녁 먹는 동안 오는 모든 걸 공유하는 거야
전화, 문자, 카톡, 이메일 할 것 없이 싹!',
'오랜만의 커플 모임에서 한 명이 게임을 제안한다.
바로 각자의 핸드폰을 테이블 위에 올려두고
 통화 내용부터 문자와 이메일까지 모두 공유하자고 한 것.
흔쾌히 게임을 시작하게 된 이들의 비밀이 핸드폰을 통해 들통나면서
 처음 게임을 제안했던 것과는 전혀 다른 상상치 못한 결말로 흘러가는데….
상상한 모든 예측이 빗나간다!','Intimate Strangers.jpg'
);