----------------------------��ֵ����
----------------������
select e.*,d.*
from emp e,dept d
where e.deptno = d.deptno
--sql��׼�﷨
select e.*,d.*
from emp e
inner join dept d
on e.deptno = d.deptno

---------------��������
select e.*,d.deptno,d.dname
from emp e,dept d
where e.deptno = d.deptno(+)
--sql��׼�﷨
select e.*,d.deptno,d.dname
from emp e
left join dept d
on e.deptno = d.deptno

---------------��������
select e.*,d.deptno,d.dname
from emp e,dept d
where e.deptno(+) = d.deptno
--sql��׼�﷨
select e.*,d.deptno,d.dname
from emp e
right join dept d
on e.deptno = d.deptno

---------------ȫ������
--sql��׼�﷨
select e.*,d.deptno,d.dname
from emp e
full join dept d
on e.deptno = d.deptno

-------------������
-----���Լ������������
select worker.ename,worker.mgr,boss.empno,boss.ename
from emp worker,emp boss
where worker.mgr = boss.empno
--sql��׼�﷨
select worker.ename,worker.mgr,boss.empno,boss.ename
from emp worker join emp boss
on worker.mgr = boss.empno
----------------------------------�ǵ�ֵ����
-------д��һ
select e.*,s.*
from emp e, salgrade s
where e.sal >=s.losal and e.sal <= s.hisal

-------д����
select e.*,s.*
from emp e, salgrade s
where e.sal between s.losal and s.hisal

-------------------------------��������
select e.*,d.*
from emp e
cross join dept d

--------------------------------��Ȼ����
ʹ��ע�⣺
1.�������̣���������ͬ������������ͬ���������п���֧�ֶ����
2.����и���������ͬ���������Ͳ�ͬ������ʹ��using�Ӿ�
3.USING�Ӿ��е��õ����в���ʹ�ñ����ͱ�����Ϊǰ׺��
4.NATURAL JOIN�Ӿ��USING�Ӿ����໥�ų�ģ�����ͬʱʹ�á�
select emp.ename,dept.dname
from emp
natural join dept

select e.ename,d.dname,d.loc
from emp e join dept d using(deptno)

--------------------------------ON�Ӿ�
select e.ename,e.deptno,d.dname
from emp e 
join dept d
     on e.deptno = d.deptno

----------------------------������
-------��ϰһ
1.дһ����ѯ����ʾ����Ա�����������ű�ţ��������ơ�
select e.ename,e.deptno,d.dname
from emp e, dept d
where e.deptno = d.deptno(+)
---------sql��׼д��
select e.ename,e.deptno,d.dname
from emp e 
left join dept d
on e.deptno = d.deptno

2.дһ����ѯ����ʾ���й�����CHICAGO���ҽ���Ϊ�յ�Ա�������������ص㣬����
select e.ename,d.loc,e.comm
from emp e, dept d
where e.deptno = d.deptno(+)
and d.loc ='CHICAGO' and e.comm is not null
---------sql��׼д��
select e.ename,d.loc,e.comm
from emp e 
left join dept d
on e.deptno = d.deptno
where d.loc ='CHICAGO' and e.comm is not null

3.дһ����ѯ����ʾ���������к���A�ַ���Ա�������������ص㡣
select e.ename,d.loc
from emp e,dept d
where e.deptno = d.deptno(+)
and e.ename like '%A%'
---------sql��׼д��
select e.ename,d.loc
from emp e 
left join dept d
on e.deptno = d.deptno
where e.ename like '%A%'

-----��ϰ��
1.��ѯÿ��Ա���ı�ţ����������ʣ����ʵȼ������ڹ������У����չ��ʵȼ�������������
select e.empno,e.ename,e.sal,s.grade,d.loc
from emp e,dept d,salgrade s
where e.deptno = d.deptno 
and e.sal between s.losal and s.hisal
order by s.grade
---------sql��׼д��
select e.empno,e.ename,e.sal,s.grade,d.loc
from emp e 
join dept d
     on e.deptno = d.deptno
join salgrade s
     on e.sal between s.losal and s.hisal
order by s.grade

---------˼��
˼������ѯÿ��Ա����������ֱ���ϼ�������(��������)
select worker.ename,worker.mgr,boss.empno,boss.ename
from emp worker,emp boss
where worker.mgr = boss.empno
--sql��׼�﷨
select worker.ename,worker.mgr,boss.empno,boss.ename
from emp worker join emp boss
on worker.mgr = boss.empno

---------��ϰ��
1.��ѯ���й�����NEW YORK��CHICAGO��Ա��������Ա����ţ��Լ����ǵľ��������������š�
select worker.ename,worker.empno,boss.ename,boss.empno
from emp worker,dept d,emp boss
where worker.mgr = boss.empno
and worker.deptno = d.deptno
and d.loc in ('NEW YORK','CHICAGO')
---------sql��׼д��
select worker.ename,worker.empno,boss.ename,boss.empno
from emp worker 
join dept d
     on worker.deptno = d.deptno
join emp boss
     on worker.mgr = boss.empno
where d.loc in ('NEW YORK','CHICAGO')

2.����һ��Ļ����ϣ����û�о����Ա��King��������Ա���������
select worker.ename,worker.empno,boss.ename,boss.empno
from emp worker,dept d,emp boss
where worker.mgr = boss.empno(+)
and worker.deptno = d.deptno
and d.loc in ('NEW YORK','CHICAGO')
order by worker.empno
---------sql��׼д��
select worker.ename,worker.empno,boss.ename,boss.empno
from emp worker 
join dept d
     on worker.deptno = d.deptno
left join emp boss
     on worker.mgr = boss.empno
where d.loc in ('NEW YORK','CHICAGO')

3.��ѯ����Ա����ţ��������������ƣ�����û�в��ŵ�Ա��ҲҪ��ʾ������
select e.empno,e.ename,d.dname
from emp e,dept d
where e.deptno = d.deptno(+)
---------sql��׼д��
select e.empno,e.ename,d.dname
from emp e
left join dept d
     on e.deptno = d.deptno
     
----------��ϰ��
----ʹ��SQL-99д�������������ϰ
1.����һ��Ա����Ͳ��ű�Ľ������ӡ�
select emp.*,dept.*
from emp
cross join dept

2.ʹ����Ȼ���ӣ���ʾ��ְ������80��5��1��֮���Ա���������������ƣ���ְ����
select emp.ename,dept.dname,emp.hiredate
from emp
natural join dept
where emp.hiredate > to_date('1980-05-01','yyyy-mm-dd')

3.ʹ��USING�Ӿ䣬��ʾ������CHICAGO��Ա���������������ƣ������ص�
select e.ename,d.dname,d.loc
from emp e join dept d using(deptno)
where loc = 'CHICAGO'

4.ʹ��ON�Ӿ䣬��ʾ������CHICAGO��Ա���������������ƣ������ص㣬н�ʵȼ�
select e.ename,d.dname,d.loc,s.grade
from emp e
join dept d
     on e.deptno = d.deptno
join salgrade s
     on e.sal between s.losal and s.hisal 
where d.loc = 'CHICAGO'
5.ʹ�������ӣ���ѯÿ��Ա��������������������û�о����KingҲҪ��ʾ������
select worker.ename,boss.ename
from emp worker 
left join emp boss
     on worker.mgr = boss.empno

6.ʹ�������ӣ���ѯÿ��Ա��������������������û�о����KingҲҪ��ʾ������
select worker.ename,boss.ename
from emp boss 
right join emp worker
     on worker.mgr = boss.empno

--------------------�κ���ҵ
1.��ʾԱ��SMITH���������������ƣ�ֱ���ϼ�����
select worker.ename,d.dname,boss.ename
from emp worker,dept d,emp boss
where worker.deptno = d.deptno
and worker.mgr = boss.empno
and worker.ename = 'SMITH'
---------sql��׼д��
select worker.ename,d.dname,boss.ename
from emp worker 
natural join dept d
join emp boss
     on worker.mgr = boss.empno
where worker.ename = 'SMITH'

2.��ʾԱ���������������ƣ����ʣ����ʼ���Ҫ���ʼ������4����
select e.ename,d.dname,e.sal,s.grade
from emp e,dept d,salgrade s
where e.deptno = d.deptno and e.sal between s.losal and s.hisal
and s.grade>4
---------sql��׼д��
select e.ename,d.dname,e.sal,s.grade
from emp e
natural join dept d
join salgrade s
     on e.sal between s.losal and s.hisal
where s.grade>4

3.��ʾԱ��KING��FORD�����Ա���������侭������
select worker.ename,boss.ename
from emp worker,emp boss
where worker.mgr = boss.empno(+)
and (boss.ename in ('KING','FORD')
or worker.ename in ('KING','FORD'))
---------sql��׼д��
select worker.ename,boss.ename
from emp worker 
left join emp boss
     on worker.mgr = boss.empno
where boss.ename in ('KING','FORD')
or worker.ename in ('KING','FORD')

4.��ʾԱ���������μӹ���ʱ�䣬���������μӹ���ʱ�䣬Ҫ��μ�ʱ��Ⱦ����硣
select worker.ename,worker.hiredate,boss.ename,boss.hiredate
from emp worker,emp boss
where worker.mgr = boss.empno
and worker.hiredate < boss.hiredate
---------sql��׼д��
select worker.ename,worker.hiredate,boss.ename,boss.hiredate
from emp worker
join emp boss
     on worker.mgr = boss.empno
where worker.hiredate < boss.hiredate




     
