SELECT * FROM EVENT;
SELECT * FROM CUSTOMER;
SELECT * FROM OWNER where ownernum=31;
SELECT * FROM MENU where foodtrucknum=11;
SELECT * FROM SALES;
SELECT * FROM REVIEW;
SELECT * FROM FOODTRUCK where foodtrucknum=58;
SELECT * FROM TYPE;
SELECT * FROM MESSAGE where msgreceiver=1;
SELECT * FROM SEARCH

delete from review where foodtrucknum=58


insert into review values (review_seq.nextval,58,122,'정말정말 맛있어요!!',sysdate);

37.325836, 127.111488
update foodtruck set foodtruckaddrlat ='37.324023'where foodtrucknum=17;
37.324023, 127.114997



UPDATE event SET eventend= '2015-07-13' WHERE foodtrucknum = 58 

update menu set menupic='f1.jpg' where foodtrucknum=11;

alter table sales modify salesdate timestamp
select * from cols where table_name='OWNER';

select 	sum(salesvalue) as salesvalue, to_char(to_date(salesdate,'DD/MM/YYYY'), 'MM') as salesmonth
from 	sales
where	foodtrucknum=11
group by to_char(to_date(salesdate,'DD/MM/YYYY'), 'MM')
order by salesmonth

select 	sum(salesvalue) as salesmonthvalue, to_char(salesdate,'MM') as salesmonth
from 	sales
where	foodtrucknum = 11
group by to_char(salesdate,'MM')
order by salesmonth

alter table foodtruck drop(foodtruckopen, foodtruckclose); 
alter table foodtruck add foodtruckclose timestamp;

update foodtruck set foodtruckopen=to_date('093030','hh24miss'); 

select 	sum(salesvalue) as salesvalue, TO_CHAR(salesdate,'DAY') as salesweek
from 	sales
where	foodtrucknum=11 and salesdate between TRUNC(to_date('20150802','yyyymmdd'), 'D') and TRUNC(to_date('20150802','yyyymmdd'), 'D')+6
group by TO_CHAR(salesdate,'DAY')
--order by salesweek

select 	sum(salesvalue) as salesvalue, TO_CHAR(salesdate,'DD') as salesday
		from 	sales
		where	foodtrucknum=11 and to_char(salesdate,'MM') = '01'
		group by TO_CHAR(salesdate,'DD')
		order by salesday

insert into sales values(sales_seq.nextval, 11, to_date('20150802', 'yyyy-mm-dd'), 2000);

insert into sales values(sales_seq.nextval, 11, to_date('20150803', 'yyyy-mm-dd'), 2000);
insert into sales values(sales_seq.nextval, 11, to_date('20150804', 'yyyy-mm-dd'), 2000);
insert into sales values(sales_seq.nextval, 11, to_date('20150828', 'yyyy-mm-dd'), 2000);
insert into sales values(sales_seq.nextval, 11, to_date('20150827', 'yyyy-mm-dd'), 2000);
insert into sales values(sales_seq.nextval, 11, to_date('20150826', 'yyyy-mm-dd'), 2000);
insert into sales values(sales_seq.nextval, 11, to_date('20150825', 'yyyy-mm-dd'), 2000);


select * 
  from sales 
  where foodtrucknum=11 and
  		salesdate between TRUNC(SYSDATE, 'D') and TRUNC(SYSDATE, 'D')+6 
  order by salesdate

select 	sum(salesvalue) as salesvalue, to_char(to_date(salesdate,'dd-mm-yyyy hh-mi-ss'), 'hh') as salesday
from 	sales
where	foodtrucknum=11
group by to_char(to_date(salesdate,'dd-mm-yyyy hh-mi-ss'), 'hh')
order by salesday

select to_char(to_date(salesdate,'dd-mm-yyyy hh-mi-ss'), 'hh') as hour, salesdate, foodtrucknum
from sales

select 	sum(salesvalue) as salesvalue, TO_CHAR(salesdate,'DAY') as salesweek
from 	sales
where	foodtrucknum=11 and salesdate between TRUNC(sysdate, 'D') and TRUNC(sysdate, 'D')+6 
group by TO_CHAR(salesdate,'DAY')
order by salesweek

insert into sales values(sales_seq.nextval, 푸드트럭번호, to_date(sysdate, 'dd-mm-yyyy hh-mi-ss'), 3000);
insert into sales values(sales_seq.nextval, 11, sysdate, 3000);
select * from sales where foodtrucknum = 11;

select * 
	      from sales 
	      where foodtrucknum=11 and
	      		salesdate between TRUNC(SYSDATE, 'D') and TRUNC(SYSDATE, 'D')+6 
	      order by salesdate

commit

select m.*, s.ownername as msgsendername, r.ownername as msgreceivername
from message m, owner s, owner r
where 	m.msgreceiver=4 and
		r.ownernum=m.msgreceiver and
		s.ownernum=m.msgsender

create table search (
	searchnum		number			primary key,
	foodtrucknum	number,
	searchword		varchar2(50)	not null,
	searchdate		date			default 	sysdate,
	foreign key(foodtrucknum) references foodtruck(foodtrucknum)
);

alter table search add searchcount number
update search set searchcount=1;
insert into search values(search_seq.nextval, 11, '생과일', default);

update search
		set searchcount=searchcount+1, searchdate = sysdate
		where searchnum = 2

create sequence search_seq;

select r.reviewnum, r.foodtrucknum, c.customernum, c.customername, r.reviewcontents, r.reviewdate
		from review r, customer c 
		where 	r.foodtrucknum = 4 and
				r.customernum  = c.customernum and
				substr(SYSTIMESTAMP-reviewdate,12,2)='00'

select * from (select * from foodtruck order by foodtrucknum desc) where foodtrucknum between ((2-1)*9)+1 and 2*9

select reviewdate, SYSTIMESTAMP-reviewdate as rel ,substr(SYSTIMESTAMP-reviewdate,12,2) as inter from review where substr(SYSTIMESTAMP-reviewdate,2,2)
select reviewdate, SYSTIMESTAMP-reviewdate as inter from review
insert into review values(review_seq.nextval,11,154,'아하기싫어',sysdate);

SELECT TO_NUMBER (SUBSTR (diff, 12, 2)) hour
  FROM (SELECT NUMTODSINTERVAL (TO_DATE (time2, 'YYYYMMDDHH24MISS')
                                 - TO_DATE (time1, 'YYYYMMDDHH24MISS'), 'DAY') diff
           FROM (SELECT '20111125203138' time1, '20111203123557' time2
                    FROM DUAL));
                    
create table message (
	msgnum		number,
	msgsender	number,
	msgreceiver	number,
	msgtitle	varchar2(50),
	msgcontent	varchar2(100),
	msgdate		timestamp		default	sysdate,
	primary 	key(msgnum),
	foreign 	key(msgsender) 	references owner(ownernum),
	foreign 	key(msgreceiver) references owner(ownernum)
);

create sequence msg_seq;

insert into message values(메시지번호, 전송자(업주), 수신자(업주), 제목, 내용, 보낸날짜);
insert into message values(msg_seq.nextval, 1, 2, '안녕하세요', '안녕하세요. 업주님', default);
insert into message values(msg_seq.nextval, 11, 4, '안녕하세요', '안녕하세요. 업주님', default);

select m.*, s.ownername as msgsendername, s.owneremail as msgsenderemail, r.ownername as msgreceivername, r.owneremail as msgreceiveremail
		from message m, owner s, owner r
		where m.msgnum=3 and
				r.ownernum=m.msgreceiver and
				s.ownernum=m.msgsender

				select m.*, s.ownername as msgsendername, s.owneremail as msgsenderemail, r.ownername as msgreceivername, r.owneremail as msgreceiveremail
		from message m, owner s, owner r
		where 	m.msgreceiver=4 and
				r.ownernum=m.msgreceiver and
				s.ownernum=m.msgsender	and
				substr(SYSTIMESTAMP-m.msgdate,12,2)='00'
		order by m.msgdate desc
				
select count(*) from sales
SELECT *
FROM 
    (SELECT FOODTRUCKNUM,FOODTRUCKNAME,DISTANCE, ROWNUM AS rnum 
    FROM (SELECT FOODTRUCKNUM , FOODTRUCKNAME , 6371 * ACOS(COS( 37.2811053 * 0.017453293 ) * COS( FOODTRUCKADDRLAT * 0.017453293 ) 
			 									* COS( (FOODTRUCKADDRALT * 0.017453293) - (127.0507571 * 0.017453293)) + SIN( 37.2811053 * 0.017453293 ) 
			 									* SIN( FOODTRUCKADDRLAT * 0.017453293 )) AS DISTANCE
			FROM FOODTRUCK ORDER BY DISTANCE)
    WHERE ROWNUM <= 4)
WHERE rnum > 1;

select sales_seq.nextval from dual

select *
from
	(select *
	from (	
		select foodtrucknum, foodtruckname, ROWNUM as id 
		from (
			select * 
			from foodtruck 
			order by foodtrucknum)
		)
	where id > (3-1)*9
	)
where ROWNUM <=9

select f.*
from foodtruck f, event e
where f.foodtrucknum = e.foodtrucknum;


SELECT * FROM (SELECT FOODTRUCKNUM , FOODTRUCKNAME , 6371 * ACOS(COS( 37.2811053 * 0.017453293 ) * COS( FOODTRUCKADDRLAT * 0.017453293 ) 
			 * COS( (FOODTRUCKADDRALT * 0.017453293) - (127.0507571 * 0.017453293)) + SIN( 37.2811053 * 0.017453293 ) 
			 * SIN( FOODTRUCKADDRLAT * 0.017453293 )) AS DISTANCE
FROM FOODTRUCK ORDER BY DISTANCE) WHERE ROWNUM <= 3



SELECT a.constraint_type as c, a.constraint_name constnm, b.column_name
FROM user_constraints a, user_cons_columns b
WHERE a.table_name = 'MENU' AND a.constraint_name = b.constraint_name ;

alter table menu add menunum number not null primary key


alter table menu drop(menupic);
alter table menu add menupic varchar2(30);
alter table menu modify menupic varchar2(100);

delete from menu where menuprice like '%원' and menuprice='가격협의'
rollback
SELECT * FROM user_tab_columns WHERE table_name='FOODTRUCK';
SELECT * FROM cols WHERE table_name='SALES';

update foodtruck set foodtrucklike=200 where foodtrucknum=5;
update foodtruck set foodtrucklike=300 where foodtrucknum=4;

update foodtruck set foodtruckaddrlat=33.3354988 , foodtruckaddralt=126.5690003 where foodtrucknum = 35;

SELECT foodtrucklike FROM FOODTRUCK where foodtrucknum=5;
commit

select * from owner where owneremail='admin1@foodtruck.com';

select sum(salesvalue) as 매출
from sales
group by to_char(to_date(salesdate,'dd-mm-yyyy'), 'dd');

select sum(salesvalue) as 월별합계 from sales group by salesdate;

create sequence sales_seq;

drop table menu;

DELETE FROM SALES where s_num=15;

select s_value, s_date from sales where s_date between TRUNC(SYSDATE-7) and TRUNC(SYSDATE-1);

select case to_char(sysdate,'d')
    when '1' then '일요일' 
       when '2' then '월요일'
       when '3' then '화요일'
       when '4' then '수요일'
       when '5' then '목요일'
       when '6' then '금요일'
       when '7' then '토요일'
       end "오늘의 요일명"
from dual;

SELECT TRUNC(SYSDATE,'D') as 첫째요일 FROM DUAL;

alter table sales rename column sales_value 	to salesvalue;
alter table sales rename column sales_num 		to salesnum;
alter table sales rename column sales_date 		to salesdate;
alter table sales rename column foodtruck_num 	to foodtrucknum;

alter table foodtruck modify foodtruckaddrlat number default 0;
update foodtruck set foodtruckaddrlat=35.5751597 where foodtrucknum =4;
update foodtruck set foodtruckaddralt=129.3086302 where foodtrucknum =4;

commit

alter table foodtruck add foodtruckaddrlat int default 0;
alter table foodtruck add foodtruckaddralt int default 0;
alter table foodtruck add foodtruckpic varchar(20);

commit

INSERT INTO SALES values(sales_seq.nextval, 4, TO_DATE('08-16-2015','MM-DD-YYYY'), 2000);
INSERT INTO SALES values(sales_seq.nextval, 4, TO_DATE('08-17-2015','MM-DD-YYYY'), 3000);
INSERT INTO SALES values(sales_seq.nextval, 4, TO_DATE('08-18-2015','MM-DD-YYYY'), 4000);
INSERT INTO SALES values(sales_seq.nextval, 4, TO_DATE('08-19-2015','MM-DD-YYYY'), 5000);
INSERT INTO SALES values(sales_seq.nextval, 4, TO_DATE('08-20-2015','MM-DD-YYYY'), 6000);
INSERT INTO SALES values(sales_seq.nextval, 4, TO_DATE('08-21-2015','MM-DD-YYYY'), 7000);
INSERT INTO SALES values(sales_seq.nextval, 4, TO_DATE('08-22-2015','MM-DD-YYYY'), 8000);

INSERT INTO SALES values(sales_seq.nextval, 4, TO_DATE('08-23-2015','MM-DD-YYYY'), 8000);
INSERT INTO SALES values(sales_seq.nextval, 4, TO_DATE('08-24-2015','MM-DD-YYYY'), 8000);

INSERT INTO SALES values(sales_seq.nextval, 4, default, 8000);
select salesvalue, to_char(sysdate, 'D') from sales where salesdate between TRUNC(SYSDATE) and TRUNC(SYSDATE+6) order by salesdate;

select * from sales where salesdate between TRUNC(SYSDATE, 'D') and TRUNC(SYSDATE, 'D')+6 order by salesdate;

select * from sales where s_date between TRUNC(SYSDATE-7) and TRUNC(SYSDATE-1) order by s_date;

alter table CUSTOMER modify c_bdate date default sysdate;
alter table sales add s_valus int;


create table menu (
	menunum			number(10),
	foodtrucknum	number(10),
	menuname		varchar2(50),
	menutype		number,
	menuexplain		varchar2(100),
	menuprice		number(20),
	menupic			varchar2(50)	default null,
	primary key(menunum)
);

commit

create sequence menu_seq;

drop sequence menu_seq;

ALTER TABLE menu ADD CONSTRAINT FK_menu_foodtruck FOREIGN KEY(foodtrucknum) REFERENCES foodtruck(foodtrucknum);
ALTER TABLE menu ADD CONSTRAINT FK_menu_type FOREIGN KEY(menutype) REFERENCES type(t_num);