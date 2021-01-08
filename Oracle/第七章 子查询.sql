--------------------------------------������
------------��ϰһ
1.��ѯ��ְ���������Ա����������ְ����
select ename,hiredate
from emp
where hiredate = (select min(hiredate)from emp)

2.��ѯ���ʱ�SMITH���ʸ߲��ҹ����ص���CHICAGO��Ա�����������ʣ���������
select ename,sal,dname
from emp e,dept d
where e.deptno = d.deptno
and sal > (select sal from emp where ename = 'SMITH')
and d.loc = 'CHICAGO'

3.��ѯ��ְ���ڱ�20������ְ���������Ա����Ҫ���Ա����������ְ����
select ename,hiredate
from emp
where hiredate < (select min(hiredate) from emp where deptno = 20)

4.��ѯ���������������в���ƽ�������ĵĲ��ű�ţ��������ƣ���������
select d.deptno,d.dname,count(1)
from emp e,dept d
where e.deptno = d.deptno
group by d.deptno,d.dname
having count(1) > (select avg(count(1)) from emp group by deptno)

------------------��ϰ��
1.��ѯ��ְ���ڱ�10��������һ��Ա�����Ա����������ְ���ڣ�������10����Ա��
select ename,hiredate
from emp
where hiredate >any(select hiredate from emp where deptno = 10)
and deptno <> 10

2.��ѯ��ְ���ڱ�10��������Ա�����Ա����������ְ���ڣ�������10����Ա��
select ename,hiredate
from emp
where hiredate >all(select hiredate from emp where deptno = 10)
and deptno <> 10

3.��ѯְλ��10��������һ��Ա��ְλ��ͬ��Ա��������ְλ��������10����Ա��
select ename,hiredate
from emp
where job =any(select job from emp where deptno = 10)
and deptno <> 10

--------------------��ϰ��
from emp
where (job,mgr) in (select job,mgr from emp where deptno = 10)
and deptno <> 10

2.��ѯְλ�������10��������һ��Ա��ְλ������ͬ��Ա��������ְλ��������10����Ա��
select ename,job
from emp
where (job in (select job from emp where deptno = 10)
           or
            mgr in (select mgr from emp where deptno = 10))
and deptno <> 10

-------------------��ϰ��
1.��ѯ���Լ�ְλƽ�����ʸߵ�Ա��������ְλ���������ƣ�ְλƽ������
select e.ename ����,a.job ְλ,d.dname ��������,a.avgsal ְλƽ������
from emp e,
     (select job,avg(sal) avgsal
     from emp group by job) a,dept d
where e.deptno = d.deptno and e.job = a.job
and e.sal>a.avgsal

2.��ѯְλ�;���ͬԱ��SCOTT��BLAKE��ȫ��ͬ��Ա��������ְλ��������SCOOT��BLAKE���ˡ�
select e.ename ����,b.job ְλ
from emp e,
         (select job,mgr
         from emp where ename in ('SCOTT','BLAKE')) b
where e.job = b.job
and e.ename not in('SCOTT','BLAKE')

3.��ѯ���Ǿ����Ա��������
select ename
from emp
where empno not in (select mgr from emp where mgr is not null)

---------------------��ϰ��
1.��ѯ��ְ���������ǰ5��Ա����������ְ���ڡ�
select rownum,e.*
from 
      (select ename,hiredate
       from emp
       order by hiredate) e
where rownum <= 5

2.��ѯ������CHICAGO������ְ���������ǰ2��Ա����������ְ���ڡ�
select rownum,e.*
from 
      (select ename,hiredate
       from emp
       where deptno = (select deptno from dept where loc = 'CHICAGO')
       order by hiredate) e
where rownum <=2 
---------------------��ϰ��
1.����ÿҳ��ʾ5����¼���ֱ��ѯ��1ҳ����2ҳ����3ҳ��Ϣ��
Ҫ����ʾԱ����������ְ���ڡ��������ơ�
-------------����һ
----��һҳ
select e.*
from
      (select rownum rn,ename,hiredate,d.dname
       from emp e,dept d
       where e.deptno = d.deptno
       and rownum <=5) e

----�ڶ�ҳ
select e.*
from
      (select rownum rn,ename,hiredate,d.dname
       from emp e,dept d
       where e.deptno = d.deptno
       and rownum <=10) e
where e.rn >5
      
----����ҳ
select e.*
from
      (select rownum rn,ename,hiredate,d.dname
       from emp e,dept d
       where e.deptno = d.deptno
       and rownum <=15) e
where e.rn > 10

-----------������
----��һҳ
select e.*
from
       (select rownum rn,ename,hiredate,dname
        from emp e,dept d
        where e.deptno = d.deptno) e
where e.rn <=5

----�ڶ�ҳ
select e.*
from
       (select rownum rn,ename,hiredate,dname
        from emp e,dept d
        where e.deptno = d.deptno) e
where e.rn >5 and e.rn <=10

----����ҳ
select e.*
from
       (select rownum rn,ename,hiredate,dname
        from emp e,dept d
        where e.deptno = d.deptno) e
where e.rn > 10 and e.rn <=15

---------------------��ϰ��
1.����ÿҳ��ʾ5����¼���ֱ��ѯ������ߵĵ�1ҳ����2ҳ����3ҳ��Ϣ��
Ҫ����ʾԱ����������ְ���ڡ��������ơ����ʡ�
-------------����һ
----��һҳ
select e3.*
from (select rownum rn,e2.*
     from
     (select ename,hiredate,d.dname,sal
     from emp e,dept d
     where e.deptno = d.deptno
     order by sal desc) e2
   where rownum <=5) e3
where e3.rn >0

----�ڶ�ҳ
select e3.*
from (select rownum rn,e2.*
     from
     (select ename,hiredate,d.dname,sal
     from emp e,dept d
     where e.deptno = d.deptno
     order by sal desc) e2
   where rownum <=10) e3
where e3.rn >5

----����ҳ
select e3.*
from (select rownum rn,e2.*
     from
     (select ename,hiredate,d.dname,sal
     from emp e,dept d
     where e.deptno = d.deptno
     order by sal desc) e2
   where rownum <=15) e3
where e3.rn >10

-------------������
select e3.*
from (select rownum rn,e2.*
     from
     (select ename,hiredate,d.dname,sal
     from emp e,dept d
     where e.deptno = d.deptno
     order by sal desc) e2
   ) e3
where e3.rn >0 and e3.rn<=5

----�ڶ�ҳ
select e3.*
from (select rownum rn,e2.*
     from
     (select ename,hiredate,d.dname,sal
     from emp e,dept d
     where e.deptno = d.deptno
     order by sal desc) e2
  ) e3
where e3.rn >5 and e3.rn <= 10

----����ҳ
select e3.*
from (select rownum rn,e2.*
     from
     (select ename,hiredate,d.dname,sal
     from emp e,dept d
     where e.deptno = d.deptno
     order by sal desc) e2
) e3
where e3.rn >10 and e3.rn <=15

---------------------�κ���ҵ
1.��ѯ���ʸ��ڱ��Ϊ7782��Ա�����ʣ�
���Һ�7369��Ա��������ͬ������Ա���ı�š����������ʡ�
select empno,ename,sal 
from emp
where sal > (select sal from emp where empno = 7782)
and job = (select job from emp where empno = 7369)

2.��ѯ������ߵ�Ա�������͹��ʡ� 
select ename,sal
from emp
where sal = (select max(sal) from emp)

3.��ѯ������͹��ʸ���10�Ų�����͹��ʵĲ��ŵı�š����Ƽ�������͹��ʡ�
select e.deptno,d.dname,min(e.sal)
from emp e,dept d
where e.deptno = d.deptno
group by e.deptno,d.dname
having min(sal) > (select min(sal) from emp where deptno = 10)

4.��ѯԱ������Ϊ�䲿����͹��ʵ�Ա���ı�ź����������ʡ�
select empno,ename,sal,e.deptno 
from emp e,(select deptno,min(sal) minsal from emp group by deptno) b
where e.deptno = b.deptno
and e.sal = b.minsal

5.��ʾ������KING��Ա�����������ʡ�
select ename,sal
from emp
where mgr = (select empno from emp where ename = 'KING')

6.��ʾ��Ա��SMITH�μӹ���ʱ�����Ա�����������ʣ��μӹ���ʱ�䡣
select ename,sal,hiredate
from emp
where hiredate > (select hiredate from emp where ename = 'SMITH')

7.ʹ���Ӳ�ѯ�ķ�ʽ��ѯ��ЩְԱ��NEW YORK������
select e.ename,d.loc
from emp e,dept d
where e.deptno = d.deptno
and d.loc = (select loc from dept where loc = 'NEW YORK')

8.дһ����ѯ��ʾ��Ա��SMITH������ͬһ�����ŵ�Ա���������������ڣ���ѯ������ų�SMITH��
select ename,hiredate
from emp
where deptno = (select deptno from emp where ename = 'SMITH')
and ename <> 'SMITH'

9.дһ����ѯ��ʾ�乤�ʱ�ȫ��ְԱƽ�����ʸߵ�Ա����š�������
select empno,ename
from emp
where sal > (select avg(sal) from emp)

10.дһ����ѯ��ʾ���ϼ��쵼��King��Ա�����������ʡ�
select ename,sal
from emp
where mgr = (select empno from emp where ename = 'KING')

11.��ʾ���й�����RESEARCH���ŵ�Ա��������ְλ��
select e.ename,e.job
from emp e,dept d
where e.deptno = d.deptno
and d.dname = 'RESEARCH'

12.��ѯÿ�����ŵĲ��ű�š�ƽ�����ʣ�Ҫ���ŵ�ƽ�����ʸ��ڲ���20��ƽ�����ʡ�
select deptno,avg(sal)
from emp
group by deptno
having avg(sal) > (select avg(sal) from emp where deptno = 20)

13.��ѯ�����Լ�����ƽ�����ʵ�Ա�����������ʣ����ڲ���ƽ�����ʣ����ڲ���ƽ�����ʵĶ��
select e.ename ����,e.sal ����,d.avgsal ���ڲ���ƽ������,e.sal-d.avgsal ���
from emp e, 
         (select deptno,avg(sal) avgsal from emp group by deptno) d
where e.deptno = d.deptno
and e.sal>d.avgsal

14. �г�������һ����Ա�����в���
select deptno,dname
from dept
where deptno in(select deptno from emp)

15. �г�н���"SMITH"������й�Ա
select ename,sal
from emp
where sal > (select sal from emp where ename = 'SMITH')

16. �г���ְ����������ֱ���ϼ������й�Ա
select empno,ename,hiredate,mgr
from emp a
where a.hiredate<(select hiredate from emp b where a.mgr = b.empno) 

17. ��Ա��������ֱ���ϼ�������
select w.ename,b.ename
from emp w,emp b
where w.mgr = b.empno(+)

18. ��ʾ�������ƺ�����
select dname ��������,e.c ����
from (select deptno,count(1) c from emp group by deptno) e,dept d
where e.deptno = d.deptno

19. ��ʾÿ�����ŵ���߹��ʵ�Ա��
select ename,sal,e1.deptno
from emp e1,(select deptno,max(sal) m from emp group by deptno) e2
where e1.deptno = e2.deptno
and e1.sal = e2.m

20. ��ʾ����Ա����7369������ͬ��Ա������������
select ename,sal
from emp
where deptno in (select deptno from emp where empno = 7369)

21. ��ʾ���������а���"W"��Ա����ͬ���ŵ�Ա������
select ename
from emp
where deptno in (select deptno from emp where ename like '%W%')

22. ��ʾ�����ʴ���ƽ�����ʵ�Ա������������
select ename sal
from emp 
where sal > (select avg(sal) from emp)

23. ��ʾ�����ʴ��ڱ�����ƽ�����ʵ�Ա������������
select ename,sal,e.deptno
from emp e,(select deptno,avg(sal) avgsal from emp group by deptno) d
where e.deptno = d.deptno
and e.sal > d.avgsal

24. ��ʾÿλ�������Ա������͹��ʣ�����͹����ߵ����� 
select b.minsal,w.mgr,w.ename
from emp w,
     (select mgr,min(sal) minsal
      from emp
      group by mgr) b
where w.mgr = b.mgr
order by w.mgr

25. ��ʾ�ȹ�����ߵ�Ա���μӹ���ʱ�����Ա���������μӹ���ʱ��
select ename,hiredate
from emp
where hiredate > (select hiredate from emp where sal = (select max(sal)
                                                         from emp))

26. ��ʾ��ƽ��������ߵĵĲ���ƽ�����ʼ���������
select e2.avgsal ƽ������,d.dname ��������
from
(select rownum rn,e1.*----------�����α�У���α�и�������
        from
               (select deptno,avg(sal) avgsal---------��ѯ������ƽ�����ʣ����ý�������
                from emp                     ---------��һ�����ݾ���ƽ��������ߵ�
                group by deptno
                order by avg(sal) desc) e1) e2,dept d
where e2.deptno = d.deptno-------�������
and e2.rn = 1--------��ȡα��Ϊ1������



