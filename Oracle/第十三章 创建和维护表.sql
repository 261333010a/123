------------------------------------------��ʮ����
---------��ϰһ
1.ѧУ����һ��ѡ��ϵͳ�������漰���γ̱�ѧ������ֱ𴴽����������Լ�˼������Ӧ�е��м���������
create table tab_grade
(
       col_classid number(3),
       col_classname varchar2(40),
       col_classteacher varchar2(40)
)

create table tab_student
(
       col_sid number(3),
       col_sname varchar2(40),
       col_age number(3)
)
---------��ϰ��
1.ͨ���Ӳ�ѯ�ķ�ʽ����һ����dept10,�ñ���10�Ų��ŵ�Ա�����ݡ�
create table dept10 as (select * from emp where deptno = 10)

---------��ϰ��
1.��Ա���������һ���Ա��У�����Ϊgender������Ϊchar(2)��Ĭ��ֵΪ���С�
alter table emp_new add(gender char(2))
alter table emp_new modify(gender default 1)


select empno, ename, job, mgr, hiredate, sal, comm, deptno, dname, gender from emp_new
2.�޸�Ա�������Ա��е���������Ϊchar(4)
alter table emp_new modify(gender char(4))

3.�޸�Ա�������Ա��е�Ĭ��ֵΪ��Ů��
alter table emp_new modify(gender default 0)

4.ɾ��Ա�����е��Ա���
alter table emp_new drop column gender
alter table emp drop (gender)

---------�κ���ҵ
1.�������������Ҫ����Ҫ����ʲô���͵��ֶ�?
(1)���2000���ֽڶ����ַ���
char(2000)
(2)������롮������ ����ո�6��
char(10)
(3)�Ա�����'��'��'Ů��
char(2)
(4)���4000���ֽڱ䳤�ַ�����
varchar2(4000)
(5)��������ݿ�������'����'����ʾ����'������
varchar2(20)
(6)��ʾ���ַ�ΧΪ- 10��125�η���10��126�η�, ���Ա�ʾС�� Ҳ���Ա�ʾ����
number
(7)����ʾ4λ����  -9999 �� 9999
number(4)
(8)��ʾ5λ��Ч���� 2λС���� һ��С��  -999.99 �� 999.99
number(5,2)
(9)���������պ�ʱ����
date
(10)���������պ�ʱ�������
timestamp
(11)�����ƴ����ͼ��/����
blob

2.������date_test,������d������Ϊdate�͡�
����date_test���в���������¼��һ����ǰϵͳ���ڼ�¼��һ����¼Ϊ��1998-08-18��
create table date_test 
(
       d date
)
insert into date_test values(sysdate)
insert into date_test values(to_date('1998-08-18','yyyy-mm-dd'))

3.������dept����ͬ��ṹ�ı�dtest����dept���в��ű����40֮ǰ����Ϣ����ñ�
create table dtest as (select * from dept where deptno < 40)

3.������emp��ṹ��ͬ�ı�empl�������䲿�ű��Ϊǰ30�ŵ�Ա����Ϣ���Ƶ�empl��
create table empl as (select * from emp where deptno <= 30)

4.��Ϊѧ����student����һ��ѧ���Ա�gender Ĭ��ֵ ��Ů����
alter table tab_student add(gender char(2))
alter table tab_student modify(gender default 0)

5.���޸�ѧ����������������Ϊ�����ַ���10λ��
alter table tab_student modify(col_sname char(10))






