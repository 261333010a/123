-------------------------------------------��ʮһ��
--------------------���в���ִ�к�Ҫ�ύ
create table emp_new as select * from emp
-------------------------�������
-----insert into ֻ�ܼ�һ������
insert into ����(����1������2����������)
values (ֵһ��ֵ������������)

create table emp_copy as select * from emp where 1 = 0 ---------�������ٽ���
                                                       ---------�����������һ�£�
                                                       ---------1=0����ʾ�������
                                                       
--------����������(����������� ȥ��values�Ӿ�)
insert into ���� (�Ӳ�ѯ)
ex:insert into emp_copy select * from emp -----------�����ı�����
 

���в���������
insert into(empno) select empno from emp [where] 
insert into(empno,ename) select empno,ename from emp [where] 


-------------------------�޸�����
update table(����) 
set column(����1) = value(ֵ1) [, column = value]
[where] ------����where���޸�ȫ��

alter table table(����)
add(column(����) ��������)
ex:alter table emp_new 
add(dname varchar(40)) ----------���һ��dname�� ����������Ϊchar �ַ�����Ϊ40


------------------------ɾ������
delete [from] table(����)-----from ���п���
[where] --------����where��ɾ����������

--------------------------�����
---savepoint savepointname
---rollback to savepointname �ع���ָ�������

--------------------------��
---ֻ���ڸ�������ʱ(�޸ģ�ɾ��)���Ż������������û����ܸ��´�����
---��ѯʱ��Ӱ�죬ֻ�и������ݵ��û����ܲ�ѯ�޸�֮��δ�ύ����Ϣ��
---�����û�ֻ�ܲ�ѯ����������ǰ������
---�������ʱ���Ż����

 
-------------------��ϰһ
1.���ű�����һ�����ţ����ű��Ϊ50����������ΪHR�������ص�ΪSY��
insert into dept values(50,'HR','SY')

2.���ű�����һ�����ţ����ű��Ϊ60����������ΪMARKET��
insert into dept(deptno,dname) values(60,'MARKET')

-------------------��ϰ��
1.��Ա����������һ��Ա����Ա�����Ϊ8888������ΪBOB����λΪCLERK��
����Ϊ��7788����ְ����Ϊ1985-03-03��н��3000������Ͳ���Ϊ�ա�
insert into emp values(8888,'BOB','CLERK',7788,
                       to_date('1985-03-03','YYYY-MM-dd'),3000,null,null)

-------------------��ϰ��
1.ʹ��CREATE TABLE emp_back as 
        SELECT * FROM EMP WHERE 1=0������emp_back��,�����������ɡ�

create table emp_back as select * from emp where 1=0

2.��emp������ְ���ڴ���1982��1��1��֮ǰ��Ա����Ϣ���Ƶ�emp_back���С�
insert into emp_back select * from emp 
                                   where hiredate > to_date('1982-01-01','yyyy-mm-dd')
                                   
-------------------��ϰ��
1.�޸Ĳ���20��Ա����Ϣ����82��֮����ְ��Ա����ְ����������10��
update emp_new
set hiredate = hiredate + 10
where  deptno = 20
and to_char(hiredate,'yyyy') > 1982  

2.�޸Ľ���Ϊnull��Ա������������Ϊ0
update emp_new
set comm = 0
where comm is null

3.�޸Ĺ����ص���NEW YORK��CHICAGO��Ա�����ʣ���������500
update emp_new
set sal = sal+500
where deptno in (select deptno from dept where loc in ('NEW YORK','CHICAGO'))

------------------��ϰ��
1.��emp��������һ����dname, ���洢������
alter table emp_new
add(dname varchar(40))

2.ʹ������Ӳ�ѯ����dname��Ϊ��ȷ�Ĳ������ơ�update emp_new en
set dname = (select dname from dept where deptno = en.deptno)

-----------------��ϰ��
1.ɾ��������Ϊ7566��Ա����¼
delete emp_new
where mgr = 7566

2.ɾ��������NEW YORK��Ա����¼
delete emp_new
where deptno = (select deptno from dept where loc = 'NEW YORK')

3.ɾ�����ʴ������ڲ���ƽ�����ʵ�Ա����¼
delete emp_new en
where sal > (select avg(sal) from emp_new where deptno = en.deptno)

-------------------��ϰ��
��������������У���Щ�����������
INSERT��-------------��������
UPDATE..------------�޸�����
INSERT--------------��������
ROLLBACK;------------�ع������������ݲ���
DELETE..-------------ɾ������
DELETE..-------------ɾ������
SELECT..-------------��ѯ��
COMMIT..-------------�ύ���ݣ���ɽ�������
INSERT..-------------��������
INSERT..-------------��������
DELETE..-------------ɾ������
GRANT..--------------�o���ݿ��û���Ȩ����������
INSERT..-------------��������
SELECT;--------------��ѯ��

--------------------��ϰ��
1.test��Ϊ�ձ��������������������test���״̬��
INSERT INTO test(id,name) values(1, 'a')��-------��������
INSERT INTO test(id,name) values(2, 'b')��-------��������
SAVEPOINT s1;------------------------------------���ñ���� s1
INSERT INTO test(id,name) values(3, 'c')��-------��������
INSERT INTO test(id,name) values(4, 'd')��-------��������
DELETE FROM test WHERE id in (1,3);--------------ɾ������
ROLLBACK TO s1;----------------------------------��ת�������s1�������֮��Ĳ�����Ч
DELETE FROM test WHERE id in (2,4);--------------ɾ������
COMMIT;------------------------------------------�ύ���ݣ���������
ROLLBACK;----------------------------------------�ع����ݣ�ǰһ��commit�Ѿ�����������Ч����

--------------------��ϰ��
--------------------�κ���ҵ
1.ʹ��������䣬����ѧ����student�Ͱ༶��class
create table students (        --ѧ����
      xh char(4),--ѧ��
      xm varchar2(10),--����
      sex char(2),--�Ա�
      birthday date,--��������
      sal number(7,2), --��ѧ��
      studentcid number(2) --ѧ���༶��
)
Create table classs (   --�༶��
      classid number(2), --�༶���
      cname varchar2(20),--�༶����
        ccount  number(3) --�༶����
)
2.��������ѧ����Ͱ༶�������������
��1����������༶��ϢΪ��1��JAVA1�࣬null------------��ӵ��༶�� insert
                         2��JAVA2�࣬null
                         3��JAVA3�࣬null
insert into classs values(1,'JAVA1��',null)
insert into classs values(2,'JAVA2��',null)
insert into classs values(3,'JAVA3��',null)
                   
��2�����ѧ����Ϣ���£���A001��,��������,���С�,��01-5��-05��,100,1------��ӵ�ѧ����
insert into students values('A001','����','��','01-5��-05',100,1)

��3�����ѧ����Ϣ���£�'A002','MIKE','��','1905-05-06',10
insert into students values('A002','MIKE','��',to_date('1905-05-06','yyyy-mm-dd'),10,null)

��4�����벿��ѧ����Ϣ�� 'A003','JOHN','Ů��
insert into students(xh,xm,sex) values('A003','JOHN','Ů')

��5����A001ѧ���Ա��޸�Ϊ'Ů��--------�޸���Ϣ update
update students set sex = 'Ů' where xh = 'A001'

��6����A001ѧ����Ϣ�޸����£��Ա�Ϊ�У���������Ϊ1980-04-01
update students set sex = '��',birthday = to_date('1980-04-01','yyyy-mm-dd')
where xh = 'A001'

��7��������Ϊ�յ�ѧ���༶�޸�ΪJava3��
update students set studentcid = (select classid from classs where cname = 'JAVA3��')
where birthday is null 


��8����ʹ��һ��SQL��䣬ʹ���Ӳ�ѯ�����°༶����ÿ���༶�������ֶ�
update classs s set ccount  =
                    (select count(*) from students
                            where studentcid = s.classid)
3.ʹ��������䣬�������±�
CREATE TABLE copy_emp   (
  empno number(4),----Ա�����
  ename varchar2(20),----Ա������
  hiredate date default sysdate ,-----��ְ����
  deptno number(2),-----���ź�
  sal number(8,2))-----����
4.�ڵ������Ļ����ϣ������������
(1)�ڱ�copy_emp�в������ݣ�Ҫ��sal�ֶβ����ֵ�����ź�50���μӹ���ʱ��Ϊ2000��1��1�գ������ֶ�����
insert into copy_emp values(null,null,to_date('2000-01-01','yyyy-mm-dd'),50,null)

(2)�ڱ�copy_emp�в������ݣ�Ҫ���emp���в��ź�Ϊ10�Ų��ŵ�Ա����Ϣ����
insert into copy_emp select empno,ename,hiredate,deptno,sal from emp where deptno = 10

(3)�޸�copy_emp�������ݣ�Ҫ��10�Ų�������Ա����20%�Ĺ���
update copy_emp set sal =sal*1.2 where deptno = 10

(4)�޸�copy_emp����salΪ�յļ�¼�������޸�Ϊƽ������
update copy_emp set sal = (select avg(sal) from copy_emp) where sal is null

(5)�ѹ���Ϊƽ�����ʵ�Ա���������޸�Ϊ��
update copy_emp set sal  = null where sal = (select avg(sal) from copy_emp)

(6)����򿪴���2�鿴�����޸�

(7)ִ��commit������2���ٴβ鿴������Ϣ
commit;

(8)ɾ������Ϊ�յ�Ա����Ϣ
delete copy_emp where sal is null

(9)ִ��rollback
rollback;







