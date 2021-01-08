--------------------------------------第七章
------------练习一
1.查询入职日期最早的员工姓名，入职日期
select ename,hiredate
from emp
where hiredate = (select min(hiredate)from emp)

2.查询工资比SMITH工资高并且工作地点在CHICAGO的员工姓名，工资，部门名称
select ename,sal,dname
from emp e,dept d
where e.deptno = d.deptno
and sal > (select sal from emp where ename = 'SMITH')
and d.loc = 'CHICAGO'

3.查询入职日期比20部门入职日期最早的员工还要早的员工姓名，入职日期
select ename,hiredate
from emp
where hiredate < (select min(hiredate) from emp where deptno = 20)

4.查询部门人数大于所有部门平均人数的的部门编号，部门名称，部门人数
select d.deptno,d.dname,count(1)
from emp e,dept d
where e.deptno = d.deptno
group by d.deptno,d.dname
having count(1) > (select avg(count(1)) from emp group by deptno)

------------------练习二
1.查询入职日期比10部门任意一个员工晚的员工姓名、入职日期，不包括10部门员工
select ename,hiredate
from emp
where hiredate >any(select hiredate from emp where deptno = 10)
and deptno <> 10

2.查询入职日期比10部门所有员工晚的员工姓名、入职日期，不包括10部门员工
select ename,hiredate
from emp
where hiredate >all(select hiredate from emp where deptno = 10)
and deptno <> 10

3.查询职位和10部门任意一个员工职位相同的员工姓名，职位，不包括10部门员工
select ename,hiredate
from emp
where job =any(select job from emp where deptno = 10)
and deptno <> 10

--------------------练习三
from emp
where (job,mgr) in (select job,mgr from emp where deptno = 10)
and deptno <> 10

2.查询职位及经理和10部门任意一个员工职位或经理相同的员工姓名，职位，不包括10部门员工
select ename,job
from emp
where (job in (select job from emp where deptno = 10)
           or
            mgr in (select mgr from emp where deptno = 10))
and deptno <> 10

-------------------练习四
1.查询比自己职位平均工资高的员工姓名、职位，部门名称，职位平均工资
select e.ename 姓名,a.job 职位,d.dname 部门名称,a.avgsal 职位平均工资
from emp e,
     (select job,avg(sal) avgsal
     from emp group by job) a,dept d
where e.deptno = d.deptno and e.job = a.job
and e.sal>a.avgsal

2.查询职位和经理同员工SCOTT或BLAKE完全相同的员工姓名、职位，不包括SCOOT和BLAKE本人。
select e.ename 姓名,b.job 职位
from emp e,
         (select job,mgr
         from emp where ename in ('SCOTT','BLAKE')) b
where e.job = b.job
and e.ename not in('SCOTT','BLAKE')

3.查询不是经理的员工姓名。
select ename
from emp
where empno not in (select mgr from emp where mgr is not null)

---------------------练习五
1.查询入职日期最早的前5名员工姓名，入职日期。
select rownum,e.*
from 
      (select ename,hiredate
       from emp
       order by hiredate) e
where rownum <= 5

2.查询工作在CHICAGO并且入职日期最早的前2名员工姓名，入职日期。
select rownum,e.*
from 
      (select ename,hiredate
       from emp
       where deptno = (select deptno from dept where loc = 'CHICAGO')
       order by hiredate) e
where rownum <=2 
---------------------练习六
1.按照每页显示5条记录，分别查询第1页，第2页，第3页信息，
要求显示员工姓名、入职日期、部门名称。
-------------方法一
----第一页
select e.*
from
      (select rownum rn,ename,hiredate,d.dname
       from emp e,dept d
       where e.deptno = d.deptno
       and rownum <=5) e

----第二页
select e.*
from
      (select rownum rn,ename,hiredate,d.dname
       from emp e,dept d
       where e.deptno = d.deptno
       and rownum <=10) e
where e.rn >5
      
----第三页
select e.*
from
      (select rownum rn,ename,hiredate,d.dname
       from emp e,dept d
       where e.deptno = d.deptno
       and rownum <=15) e
where e.rn > 10

-----------方法二
----第一页
select e.*
from
       (select rownum rn,ename,hiredate,dname
        from emp e,dept d
        where e.deptno = d.deptno) e
where e.rn <=5

----第二页
select e.*
from
       (select rownum rn,ename,hiredate,dname
        from emp e,dept d
        where e.deptno = d.deptno) e
where e.rn >5 and e.rn <=10

----第三页
select e.*
from
       (select rownum rn,ename,hiredate,dname
        from emp e,dept d
        where e.deptno = d.deptno) e
where e.rn > 10 and e.rn <=15

---------------------练习七
1.按照每页显示5条记录，分别查询工资最高的第1页，第2页，第3页信息，
要求显示员工姓名、入职日期、部门名称、工资。
-------------方法一
----第一页
select e3.*
from (select rownum rn,e2.*
     from
     (select ename,hiredate,d.dname,sal
     from emp e,dept d
     where e.deptno = d.deptno
     order by sal desc) e2
   where rownum <=5) e3
where e3.rn >0

----第二页
select e3.*
from (select rownum rn,e2.*
     from
     (select ename,hiredate,d.dname,sal
     from emp e,dept d
     where e.deptno = d.deptno
     order by sal desc) e2
   where rownum <=10) e3
where e3.rn >5

----第三页
select e3.*
from (select rownum rn,e2.*
     from
     (select ename,hiredate,d.dname,sal
     from emp e,dept d
     where e.deptno = d.deptno
     order by sal desc) e2
   where rownum <=15) e3
where e3.rn >10

-------------方法二
select e3.*
from (select rownum rn,e2.*
     from
     (select ename,hiredate,d.dname,sal
     from emp e,dept d
     where e.deptno = d.deptno
     order by sal desc) e2
   ) e3
where e3.rn >0 and e3.rn<=5

----第二页
select e3.*
from (select rownum rn,e2.*
     from
     (select ename,hiredate,d.dname,sal
     from emp e,dept d
     where e.deptno = d.deptno
     order by sal desc) e2
  ) e3
where e3.rn >5 and e3.rn <= 10

----第三页
select e3.*
from (select rownum rn,e2.*
     from
     (select ename,hiredate,d.dname,sal
     from emp e,dept d
     where e.deptno = d.deptno
     order by sal desc) e2
) e3
where e3.rn >10 and e3.rn <=15

---------------------课后作业
1.查询工资高于编号为7782的员工工资，
并且和7369号员工从事相同工作的员工的编号、姓名及工资。
select empno,ename,sal 
from emp
where sal > (select sal from emp where empno = 7782)
and job = (select job from emp where empno = 7369)

2.查询工资最高的员工姓名和工资。 
select ename,sal
from emp
where sal = (select max(sal) from emp)

3.查询部门最低工资高于10号部门最低工资的部门的编号、名称及部门最低工资。
select e.deptno,d.dname,min(e.sal)
from emp e,dept d
where e.deptno = d.deptno
group by e.deptno,d.dname
having min(sal) > (select min(sal) from emp where deptno = 10)

4.查询员工工资为其部门最低工资的员工的编号和姓名及工资。
select empno,ename,sal,e.deptno 
from emp e,(select deptno,min(sal) minsal from emp group by deptno) b
where e.deptno = b.deptno
and e.sal = b.minsal

5.显示经理是KING的员工姓名，工资。
select ename,sal
from emp
where mgr = (select empno from emp where ename = 'KING')

6.显示比员工SMITH参加工作时间晚的员工姓名，工资，参加工作时间。
select ename,sal,hiredate
from emp
where hiredate > (select hiredate from emp where ename = 'SMITH')

7.使用子查询的方式查询哪些职员在NEW YORK工作。
select e.ename,d.loc
from emp e,dept d
where e.deptno = d.deptno
and d.loc = (select loc from dept where loc = 'NEW YORK')

8.写一个查询显示和员工SMITH工作在同一个部门的员工姓名，雇用日期，查询结果中排除SMITH。
select ename,hiredate
from emp
where deptno = (select deptno from emp where ename = 'SMITH')
and ename <> 'SMITH'

9.写一个查询显示其工资比全体职员平均工资高的员工编号、姓名。
select empno,ename
from emp
where sal > (select avg(sal) from emp)

10.写一个查询显示其上级领导是King的员工姓名、工资。
select ename,sal
from emp
where mgr = (select empno from emp where ename = 'KING')

11.显示所有工作在RESEARCH部门的员工姓名，职位。
select e.ename,e.job
from emp e,dept d
where e.deptno = d.deptno
and d.dname = 'RESEARCH'

12.查询每个部门的部门编号、平均工资，要求部门的平均工资高于部门20的平均工资。
select deptno,avg(sal)
from emp
group by deptno
having avg(sal) > (select avg(sal) from emp where deptno = 20)

13.查询大于自己部门平均工资的员工姓名，工资，所在部门平均工资，高于部门平均工资的额度
select e.ename 姓名,e.sal 工资,d.avgsal 所在部门平均工资,e.sal-d.avgsal 差额
from emp e, 
         (select deptno,avg(sal) avgsal from emp group by deptno) d
where e.deptno = d.deptno
and e.sal>d.avgsal

14. 列出至少有一个雇员的所有部门
select deptno,dname
from dept
where deptno in(select deptno from emp)

15. 列出薪金比"SMITH"多的所有雇员
select ename,sal
from emp
where sal > (select sal from emp where ename = 'SMITH')

16. 列出入职日期早于其直接上级的所有雇员
select empno,ename,hiredate,mgr
from emp a
where a.hiredate<(select hiredate from emp b where a.mgr = b.empno) 

17. 找员工姓名和直接上级的名字
select w.ename,b.ename
from emp w,emp b
where w.mgr = b.empno(+)

18. 显示部门名称和人数
select dname 部门名称,e.c 人数
from (select deptno,count(1) c from emp group by deptno) e,dept d
where e.deptno = d.deptno

19. 显示每个部门的最高工资的员工
select ename,sal,e1.deptno
from emp e1,(select deptno,max(sal) m from emp group by deptno) e2
where e1.deptno = e2.deptno
and e1.sal = e2.m

20. 显示出和员工号7369部门相同的员工姓名，工资
select ename,sal
from emp
where deptno in (select deptno from emp where empno = 7369)

21. 显示出和姓名中包含"W"的员工相同部门的员工姓名
select ename
from emp
where deptno in (select deptno from emp where ename like '%W%')

22. 显示出工资大于平均工资的员工姓名，工资
select ename sal
from emp 
where sal > (select avg(sal) from emp)

23. 显示出工资大于本部门平均工资的员工姓名，工资
select ename,sal,e.deptno
from emp e,(select deptno,avg(sal) avgsal from emp group by deptno) d
where e.deptno = d.deptno
and e.sal > d.avgsal

24. 显示每位经理管理员工的最低工资，及最低工资者的姓名 
select b.minsal,w.mgr,w.ename
from emp w,
     (select mgr,min(sal) minsal
      from emp
      group by mgr) b
where w.mgr = b.mgr
order by w.mgr

25. 显示比工资最高的员工参加工作时间晚的员工姓名，参加工作时间
select ename,hiredate
from emp
where hiredate > (select hiredate from emp where sal = (select max(sal)
                                                         from emp))

26. 显示出平均工资最高的的部门平均工资及部门名称
select e2.avgsal 平均工资,d.dname 部门名称
from
(select rownum rn,e1.*----------再添加伪列，对伪列给个别名
        from
               (select deptno,avg(sal) avgsal---------查询各部门平均工资，并用降序排序，
                from emp                     ---------第一条数据就是平均工资最高的
                group by deptno
                order by avg(sal) desc) e1) e2,dept d
where e2.deptno = d.deptno-------多表连接
and e2.rn = 1--------提取伪列为1的数据



