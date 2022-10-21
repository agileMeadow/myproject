-- Bulletin board

select * from tab;
select * from seq;
select * from myboard;

create table myboard(
	  no number primary key,
	  writer varchar2(20),
      passwd varchar2(20),
	  subject varchar2(50),
	  content varchar2(100),
	  readcount number,
	  register date );

create sequence myboard_seq;

insert into myboard values(myboard_seq.nextval, 'Meadow', '111', 'Spring & MyBatis', 'Bulletin Board Project',0,sysdate);