------------------------------�ھ���
----------��ϰһ
������ϰ��ʹ������Ӳ�ѯ���
1.��ѯ������ְλƽ�����ʸߵ�Ա��������ְλ��
select ename,job
from emp e
where sal > (select avg(sal) from emp where deptno = e.deptno)

2.��ѯ����Ϊ�䲿����͹��ʵ�Ա����ţ����������ʡ�
select empno,ename,sal
from emp e
where sal = (select min(sal) from emp where deptno = e.deptno)

----------��ϰ��
������ϰ��������Ӳ�ѯ���
1.��ѯ���й�Ա��ţ����ֺͲ�������
select empno,ename,(select dname from dept where deptno = e.deptno) ��������
from emp e

2.��ѯ��ЩԱ���Ǿ���
select empno,ename,job
from emp e
where 0 < (select count(1) from emp where mgr = e.empno)

3.��ѯ��ЩԱ�����Ǿ���
select empno,ename,job
from emp e
where 0 = (select count(1) from emp where mgr = e.empno)

4.��ѯÿ�����Ź�����͵�����Ա����ţ�����������
select empno,ename,sal
from emp e
where 2 < (select count(1) from emp where deptno = e.deptno and sal < e.sal)

-----------��ϰ��
������ϰ����exists��not exists���
1.�г�������һ����Ա�����в������ơ�
select deptno,dname
from dept d
where exists (select '1' from emp where deptno = d.deptno)

2.�г�һ����Ա��û�е����в������ơ�
select deptno,dname
from dept d
where not exists (select '1' from emp where deptno = d.deptno)

----------�κ���ҵ
������ϰ��ʹ������Ӳ�ѯ��ɡ�
1.��ѯнˮ���������ڲ���ƽ��нˮ�Ĺ�Ա���֣����źš�
select ename,deptno
from emp e
where sal > (select avg(sal) from emp where deptno = e.deptno)

2.��ѯԱ��������ֱ���ϼ������֡�
select ename,(select ename from emp where e.mgr = empno) ����
from emp e

3.��ѯÿ�����Ź�����ߵ�Ա�����������ʡ�
select ename,sal
from emp e
where sal = (select max(sal) from emp where deptno = e.deptno)

4.��ѯÿ�����Ź���ǰ�����ߵ�Ա�����������ʡ�
select ename,sal
from emp e
where 2 > (select count(1) from emp where deptno = e.deptno and sal > e.sal)



