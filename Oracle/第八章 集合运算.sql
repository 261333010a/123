------------------------------�ڰ���
--------��ϰһ
1.�ֱ�ʹ���������㼰��ȫ����������ɣ�����ʱ������˳�򣬲�ѯԱ��7839�Ĺ�����λ�б�
-----��������
select hiredate ʱ��,job
from emp where empno = 7839
union
select begindate ʱ��,job
from emp_jobhistory

-----��ȫ��������
(select begindate ʱ��,job
from  emp_jobhistory
union all
select hiredate ʱ��,job
from emp where empno = 7839)
order by ʱ�� 

2.ʹ�ö�����ӣ���ѯÿ�����ŵĲ��ű�ţ�����������û�������Ĳ�����ʾ0��
select d.deptno ���ű��,nvl(e.c,0) ��������-----��ʾ0
from       
       (select deptno,count(1) c-----��ѯ��������
        from emp
        group by deptno) e, dept d
where e.deptno(+) = d.deptno-----������� ��������
order by d.deptno

3.ʹ���������㣬��ѯÿ�����ŵĲ��ű�ţ�����������û�������Ĳ�����ʾ0��
select deptno,count(1) ��������-----Ϊ����
from emp
group by deptno
union
select deptno,nvl(null,0) ��������
from dept

4.ʹ���������㣬��ѯ10�Ų��ż�20�Ų��ŵ�Ա�����������ű�š�
select deptno,ename
from emp
where deptno = 10
union
select deptno,ename
from emp
where deptno = 20

5. ʹ�ü������㣬�������Ч��
select deptno ����,loc �����ص�,to_char(null) Ա����Ϣ,to_date(null) ��ְ����
from dept
union
select deptno,to_char(null),ename,hiredate
from emp
------------��ϰ��
1.�ü������㣬�г�������jobΪSALESMAN �Ĳ��ŵĲ��źš�
select deptno ���ź�
from emp
minus
select deptno
from emp
where job = 'SALESMAN'

2.дһ�����ϲ�ѯ���г��������Ϣ��EMP�������й�Ա�����ֺͲ��ű��,���������Ƿ������κβ���
select deptno,ename
from emp
union 
select deptno,to_char(null)
from dept

3.�ü��������ѯ��ְλΪSALESMAN�Ͳ��ű��Ϊ10����Ա��š�������ְλ�����ų��ظ������
select empno,ename,job
from emp
where job = 'SALESMAN'
union all
select empno,ename,job
from emp
where deptno = 10

4.�ü��ϲ�ѯ������Ϊ10��20��������Ա��š����������ڲ������ơ�
select empno,ename,dname
from emp e,dept d
where e.deptno = d.deptno
and d.deptno = 10
union
select empno,ename,dname
from emp e,dept d
where e.deptno = d.deptno
and d.deptno = 20








