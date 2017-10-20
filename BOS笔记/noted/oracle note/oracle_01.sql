SQL:
  Structured Query Language �ṹ����ѯ����
SQL����:4��
  DDL: ���ݶ�������,��Ҫ�����ǽṹ  create alter, drop,truncate     
  DML: ���ݲ�������,��Ҫ�ǲ�������  insert ,update , delete
  DCL: ���ݿ�������,��Ҫ����Ȩ�� grant  revoke
  DQL: ���ݲ�ѯ���� , ��ѯ����  select 

SQL��д˳��/��ѯ�ṹ:
  select ��ʾ���� from ���� where ���� group by �������� having ����֮��Ĺ��� order by ����  
       

dual : ���/α�� , ��Ҫ���ڲ����﷨�ṹ��

select 1+1 from dual;
select * from dual;

������������ַ�,��Ҫ��˫����
select ename as ����,job "��%��" from emp;

-- ����Ա������н + ����
select emp.*,sal*12,sal*12+comm from emp;
-- nvl(����1,����2) ,�������1Ϊnull , �򷵻ز���2, ���򷵻ز���1
select nvl(null,2) from dual;  -- 2
select nvl(1,2) from dual; -- 1
select emp.*,sal*12,sal*12+nvl(comm,0) from emp;

/*
     �ַ���ƴ��:
       ͨ�÷�ʽ: 
         concat(str1,str2) : str1str2
        
       Oracle���еķ�ʽ:  
         ||  �൱����java�� +  
*/
-- ����:SMITH
select concat('����:',ename) from emp;

select '����'||ename from emp;
select '����'||ename||'sdfsdf' from emp;


/*
       ������ѯ : where �����д��
            ��ϵ�����: > >= = < <= != <> 
                        != : sqlserver
                        <> : sql��׼
            �߼������: and or not 
            ���������: 
                  in(����)
                  like ģ����ѯ
                  between..and.. ���� [��Сֵ,���ֵ]
                  is null
                  is not null
                  exists ����
*/
-- ��ѯÿ���ܵõ������Ա����Ϣ
select * from emp where comm != null; -- �����
select * from emp where comm is not null;

-- ��ѯ������1500--3000֮���Ա����Ϣ
select * from emp where sal between 1500 and 3000;
select * from emp where sal >=1500 and sal <=3000;

-- ��ѯ������ĳ����Χ��Ա����Ϣ 'ALLEN','BLAKE','CLARK'
select * from emp where ename in('ALLEN','BLAKE','CLARK');

-- Oracle�������ִ�Сд��(���е��������ִ�Сд�����������ִ�Сд)
select * from emp where ename = 'allen';


/*
    ģ����ѯ:
        like 
             % ƥ����������ַ�
             _ ƥ�䵥���ַ�
             
       escape �൱����ָ��ʹ�� �ĸ�ת���ַ�
*/
-- ��ѯ�����е�������ĸ��A��Ա����Ϣ
select * from emp where ename like '__A%';

-- ��ѯ�����а���%��Ա����Ϣ
insert into emp(empno,ename) values(9527,'HUA%AN');
select * from emp where ename like '%\%%' escape '\';


/*
       order by ���� �������
             asc : ascend  Ĭ�Ϲ��� ����
             desc: descend ����
       ����ʱ�Ŀ�ֵ���� :     
             nulls first(�Ѻ��п�ֵ�����ö�) | nulls last(�Ѻ��п�ֵ�����õ�)  
             
       ��������
             order by ����1 ����, ����2 ����    
*/
-- ��������
select * from emp order by sal asc;
-- ���չ��ʽ��н�������
select * from emp order by sal desc nulls last;

-- ���ղ���deptno��������,�ٰ��չ���sal������������
select * from emp order by deptno desc,sal asc; 

/*
       ����:
          ���к���:
              ��ֵ����
              �ַ�����
              ���ں���
              ת������
              ͨ�ú���
          ���к���:
               sum() max , min ,count ,avg
*/
-- ��ֵ����:
-- ��������   Math
select round(45.926,2) from dual; -- 45.93
select round(45.926,1) from dual; -- 45.9
select round(45.926,0) from dual; -- 46
select round(45.926,-1) from dual; -- 50
select round(45.926,-2) from dual; --0 

-- �ض�
select trunc(45.926,2) from dual; -- 45.92
select trunc(45.926,1) from dual; -- 45.9
select trunc(45.926,0) from dual; -- 45
select trunc(45.926,-1) from dual; -- 40
select trunc(45.926,-2) from dual; --0 

-- ����ȡ�� : ���ֵȡֵ
select ceil(12.5) from dual; -- 13
select ceil(-12.5) from dual; -- -12 
-- ����ȡ�� : ��Сֵȡ��
select floor(10.9) from dual; -- 10
select floor(-10.9) from dual; -- 11;

-- ģ����: ȡ���� 
select mod(9,2) from dual; -- 1;

-- ����ֵ
select abs(-10) from dual; -- 10;

-- �ַ�������
-- ȡ����
select length('abcdefg') from dual;

-- ȥ�����˿ո�
select ' hello              ' from dual;
select trim(' hello              ') from dual;

-- �ַ�����ȡ
-- ������ʼ������0����1 , ���Ǵӵ�1���ַ���ʼ��ȡ, 
select substr('abcdefg',0,3) from dual; -- abc
select substr('abcdefg',1,3) from dual; -- abc
select substr('abcdefg',2,3) from dual; -- bcd

-- �ַ����滻
select replace('hello','l','x') from dual;


-- ���ں���
-- ��ǰ����
select sysdate from dual; -- 2017/9/5 11:59:25

select sysdate+1/24 from dual;

-- ����Ա����ְ������
select ceil(sysdate - hiredate) from emp;

-- ����Ա����ְ������
select ceil(sysdate - hiredate)/7 from emp;

-- ����Ա����ְ������
select months_between(sysdate,hiredate) from emp;

-- ����Ա����ְ������
select months_between(sysdate,hiredate)/12 from emp;

-- ������֮��Ľ���
select add_months(sysdate,3) from dual;



/*
       ת������:
              �ַ�ת��ֵ : to_number  ����
              ��ֵת�ַ� : to_char
              ����ת�ַ�: to_char
              �ַ�ת���� : to_date
*/
select 100 + '23' from dual; -- 123
select 100 + to_number('23') from dual; -- 123

-- ��ֵת�ַ�: 100   $100  1,234,567
select to_char(1234567,'$9,999,999.99') from dual;

-- ����ת�ַ�  mi  minute
select to_char(sysdate,'yyyy-mm-dd hh:mi:ss') from dual;

-- ֻ��ʾ���
select to_char(sysdate,'yyyy') from dual; 

select to_char(sysdate,'d') from dual;  -- һ�����ڹ��˼��� 3
select to_char(sysdate,'dd') from dual;  -- һ�����е�����
select to_char(sysdate,'ddd') from dual; -- һ����˼��� 248


select to_char(sysdate,'day') from dual;  -- tuesday  ���ڶ� 
select to_char(sysdate,'dy') from dual;  -- tue ���ڵļ�д
select sysdate from dual;


-- �ַ�ת����
-- ��ѯ1980-01-01-1985-12-31����ְ��Ա����Ϣ
select * from emp where hiredate between to_date('1980-01-01','yyyy-mm-dd') and to_date('1985-12-31','yyyy-mm-dd');

select to_date('1980-01-01','yyyy-mm-dd') from dual;


-- ͨ�ú���
-- nvl2
select nvl2(null,5,6) from dual; -- 6 
select nvl2(1,5,6) from dual; -- 5

-- �������ʽ
/*
  ͨ�õķ�ʽ: 
     case ����
       when ֵ1 then ����
       when ֵ2 then ����
       else
         
       end;
  Oracle���з�ʽ:
     decode(����,if1,then1,if2,then2,else)       
  
*/
-- Ա��ȡһ��������
select emp.ename,case ename
          when 'SMITH' then 'ʷ��˹'
          when 'ALLEN' then '�����'
          else
               '·�˼�'
          end
 from emp;
 
select decode(ename,'SMITH','����С��','JONES','����','����') from emp;
 
/*
     �����ѯ:                                            
           group by 
     �����ѯ���ṹ?
           select ���������,����֮��Ĳ��� from ���� group by �������� having ��������

          where �� having ����?
                where �Ƿ���֮ǰִ��  ���ܽӾۺϺ���
                having ����֮��ִ��   ���ԽӾۺϺ��� 
*/
-- ��ѯƽ�����ʴ���2000�Ĳ���
select deptno,avg(sal) from emp group by deptno having avg(sal) > 2000;


delete from emp where empno=9527;
select * from emp order by deptno;



-- 17,ͳ�� н�� ���� н����ߵ�Ա�� ���ڲ��� ��ƽ������ �� н����͵�Ա�� ���ڲ��� ��ƽ������ ��ƽ������ ��Ա����Ϣ��
----       sal   >                    10         100    and                20         200       100+200/2
-- select * from emp where sal > (100+200)/2

�κ���ҵ��

(1)ѡ������������ĸa��e��Ա������
[instr(ename, 'A')����һ���ַ����в���ָ�����ַ�,���ر����ҵ���ָ�����ַ���λ�ã�����0˵������]
[substr('abcdefg',1,3)�����ڽ�ȡ�����ؽ�ȡ���ַ������м���д0��1����ʾ�ӵ�һ����ĸ��ʼ]
	select ename from emp where instr(ename, 'A')>0 and instr(ename, 'E')>0;
		����
	select last_name from employees where last_name like '%a%' and last_name like '%e%'

