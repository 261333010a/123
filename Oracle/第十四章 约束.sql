---------------------------------------��ʮ����
-----------��ϰһ
1.ѧУ��һ��ѡ��ϵͳ�����а������¹�ϵģʽ��
ϵ(ϵ��ţ� ������
   ϵ����:  Ψһ����
   ϵ���Σ� �ǿ�Լ����
   ϵ����Уȥ��ȡֵ��Χֻ�����Ϻ�У���ͻ���У��)
�༶(�༶��ţ� ������
     �༶���ƣ� Ψһ����
     ����ϵ��  ���)

create table tab_grade
(
       col_gradeid number(5) constraint grade_id_pk primary key,
       col_gradename varchar2(40) constraint grade_name_un unique,
       col_gradeboss varchar2(20) not null,
       col_gradeaddress varchar2(20) 
       constraint grade_add_ck check (col_gradeaddress in('�Ϻ�У��','����У��'))
)

create table tab_class
(
       col_classid number(10) constraint class_id_pk primary key,
       col_classname varchar2(20) constraint class_name_un unique,
       col_grade number(5) not null 
       constraint class_grade_fk references tab_grade(col_gradeid) 
)

2.����ѧ����������������:
ѧ�� �����ַ��� 10λ ����
���� �䳤�ַ��� 20λ �ǿ�
�Ա� �����ַ��� 2λ ȡֵ��Χֻ��Ϊ�л�Ů
�������� ������ 
���ڰ༶ 

create table tab_student
(
       col_sid char(10) constraint student_id_pk primary key,
       sname varchar2(20) not null,
       gender char(2) 
       constraint student_gen_ck check (gender between 0 and 1),
       birthday date,
       grade number(10) not null
)
drop table tab_student
-----------�κ���ҵ
1.����5��Լ���ĺ��塣
����Լ�� primary key��һ����ֻ����1������Լ������������Ϊ��ֵ��
                   �������е�ֵ�����ظ���ֻ��Ψһ
ΨһԼ�� unique��ΨһԼ�����е�ֵ�����ظ���ֻ��Ψһ�������ж����ֵ
                 ÿ��������ж��ΨһԼ��
�ǿ�Լ�� not null����Լ�����в����п�ֵ��ֻ�����м����
���Լ�� foreign key��ȷ��������������ֶεĹ�ϵ��������յ����б�������������Ψһ��
                       ����е�ֵ������������ֵ�ķ�Χ�ڣ�����Ϊ��
�����Լ�� check��ȷ��ĳ���е����������ݶ��������������                       

2.����ѧ����ϵsc��������������
ѡ����ˮ�� ��ֵ�� ������
ѧ����� �ǿ� ���
�γ̱�� �ǿ� �����
�ɼ�     0-100֮��

create table sc
(
       sc_classid number(4) primary key,
       sc_studentid char(10) not null
         constraint sc_sid_fk references tab_student(col_sid),
       sc_gradeid number(10) not null
         constraint sc_gid_fk references tab_class(col_classid),
       sc_achievement number(3) 
         constraint sc_ach_ck check (sc_achievement between 0 and 100)
)

3.����copy_emp��Ҫ���ʽͬemp����ȫһ�������������ݡ�
create table copy_emp as (select * from emp where 1 = 0)

4.����copy_dept��Ҫ���ʽͬdept����ȫһ�������������ݡ�
create table copy_dept as (select * from dept where 1 = 0)

5.����copy_emp �������deptno������copy_dept��deptno,����ܷ�ɹ�,Ϊʲô��
alter table copy_emp add foreign key(deptno) references copy_dept(deptno)
ԭ��������ΨһԼ����ƥ�� deptno����������ΨһԼ��

6.׷��copy_dept��������deptno
alter table copy_dept add primary key(deptno) 





