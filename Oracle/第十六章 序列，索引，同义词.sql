--------------------------------------��ʮ����
����(sequence)
---�������� 
create sequence sequenceName
minvalue 1 ----��Сֵ
maxvalue 999999999 ----���ֵ
start with 1 ----��ʼֵ
increment by 1 ----ÿ������ֵ
cache 20 ----�������� ������

���ԣ�currval ��ǰֵ nextval ��һ��ֵ
�ȷ�����һ��ֵ ���ڷ��ʵ�ǰֵ
select sequenceName.nextval from dual ----ÿִ��һ�λ����һ����ֵ
select sequenceName.currval from dual ----���ص�ǰֵ
---����������������id
insert into emp(empno,ename) values(sequenceName.nextval,'erha')

�޸�����
alter sequence sequenceName [increment by ]...
ps:�޸����е��﷨�����޸�start with �Ӿ�

ɾ������
drop sequence sequenceName

rowid(α��) ϵͳ�Զ�����
��ʾÿһ�����ݿ��м�¼�������ַ���ܱ�ͨ������ֵ��ѯ����Ķ�λ��һ���м�¼
select rowid,ename
from emp

��ʽ��oooooo        fff            bbbbbb   rrr
      ���ݶ�����  ����ļ����  ����   �б��


����(index)
���������������ڱ��е�ĳһ��
�﷨��create index indexName on table (column)

���������������ڱ���ĳ���е������
�﷨��create index indexName on table (column1,column2)


�ʺϴ������������
  ���������ܴ�
  Ҫ��ѯ�Ľ������2%-4%����
  ����������WHERE�����е��л��߶�����ӵ���
  ��ѯ�е����ݷ�Χ�ֲ��ܹ�
  ��ѯ���а���������NULLֵ,��Ϊ��ֵ��������������
  
���ʺϴ������������
  ��������С�ı�
  �ڲ�ѯ�в���������Ϊ��ѯ��������
  Ƶ�����µı�
  ��������Ϊ���ʽ��һ���ֱ�ʹ��ʱ�����糣��ѯ��������SALARY*12����ʱ��SALARY���ϴ���������û��Ч����
  ��ѯ�������е��к���ʱ���ò�������
  
����ȱ�㣺��ռ�ÿռ� �ڽ���dml�������ٶ�

ɾ��������drop index indexName

ͬ���(synonym)
�ô���
  ���Լ򻯶����ݿ����ķ���;
  ����������û���ķ���;
  �򻯹����Ķ�������;
  ��ʡ���������ݿ�ռ䣬�Բ�ͬ�û��Ĳ���ͬһ�ű�û�ж��ٲ��;
  ��չ�����ݿ��ʹ�÷�Χ���ܹ��ڲ�ͬ�����ݿ��û�֮��ʵ���޷콻��;
  ͬ��ʿ��Դ����ڲ�ͬһ�����ݿ�������ϣ�ͨ������ʵ������;

����ͬ����﷨��create [public] synonym synonymName
                 for [schema.]������
                  
ɾ��ͬ��ʣ�drop synonym synonymName

--------��ϰһ
1.����һ�����У���������ʼֵ��1��ʼ�������ֵ��������1����ѭ����
create sequence test_seq
start with 1 -------��ʼֵ
minvalue 1 ----------��СֵΪ1
nomaxvalue -------�����ֵ
increment by 1 --------ÿ������1

2.��ѯ���еĵ�ǰֵ����һ��ֵ
select test_seq.nextval from dual-------��һ��ֵ
select test_seq.currval from dual-------��ǰֵ

3.ʹ�õ�1�����������У����ű��в���������¼�����ű��ʹ������ֵ��
�������Ʒֱ�Ϊ��Education��Market�����зֱ�Ϊ��DALLAS��WASHTON
insert into dept values(test_seq.nextval,'Education','DALLAS')
insert into dept values(test_seq.nextval,'Market','WASHTON')
SELECT * FROM DEPT

--------��ϰ��
���Բ�������������

--------��ϰ��
1.�����¹�ϵģʽ��
student(sno,sname,gender,birthday,email);--ѧ��
course(cno,cname,type,credit);--�γ�
sc��sno,cno,grade);--ѡ��
�Է�����Щ�����ʺϴ���������
sno,cno

--------�κ���ҵ
1.�������У���ʼλ1������Ϊ1����СֵΪ1�����ֵΪ9999
create sequence test_ss
start with 1
minvalue 1
maxvalue 9999
increment by 1

2.�������У���ʼֵΪ50��ÿ������5��
create sequence test_se
start with 50
increment by 5

3.�ڱ�copy_dept�в����¼�����в��ź��������һ���д������������ɣ�
insert into copy_dept values(test_se.nextval,'Eat','shanghai')

4.��Ϊ���ʴ����������Ƚ�<10000,>1000,��round��sal��>10000,�ĸ�������Ч���ĸ�������Ч��
create index ind_emp_sal on emp(sal)

select * from emp where sal < 10000
select * from emp where sal > 1000
select * from emp where round(sal) > 10000 ----��Ч �к���









