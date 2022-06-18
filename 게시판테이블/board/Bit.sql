/* 게시판 테이블 생성*/
  create table board(
      num number primary key,
      writer varchar2(30) not null,
      email varchar2(40),
      subject varchar2(100) not null,
      passwd varchar2(20) not null,
      reg_date date not null,
      readcount number default 0,
      ref number not null,
      re_step number not null,
      re_level number not null,
      content varchar2(4000)not null,
      ip varchar2(20) not null
   );
   
/* 시퀀스 생성 */
CREATE SEQUENCE board_seq
           INCREMENT BY 1
           START WITH   1
           MAXVALUE 999999
           NOCYCLE
           NOCACHE;

select board_seq.NEXTVAL from dual;
select board_seq.currval from dual; 

select * from user_sequences;
/*증가한 값은 다시 감소시킬 수 없음*/

/**/
select count(*) from board;