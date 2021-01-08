--------------------------------������
-----------------��ϰһ
1.��ѯ����20��Ա����ÿ���µĹ����ܺͼ�ƽ�����ʡ�
-----����һ
select deptno,sum(sal) �ܹ���,avg(sal) ƽ������
from emp
where deptno = 20
group by deptno
-----������
select deptno,sum(sal) �ܹ���,avg(sal) ƽ������
from emp
group by deptno
having deptno = 20

2.��ѯ������CHICAGO��Ա����������߹��ʼ���͹��ʡ�
------����һ
select d.loc,count(1),max(sal),min(sal)
from emp e , dept d
where e.deptno = d.deptno
group by d.loc
having d.loc = 'CHICAGO'
------������
select d.loc,count(1),max(sal),min(sal)
from emp e
join dept d
     on e.deptno = d.deptno
where d.loc = 'CHICAGO'
group by d.loc
3.��ѯԱ������һ���м��ָ�λ���͡�
select count(distinct job)
from emp

----------------��ϰ��
1.��ѯÿ�����ŵĲ��ű�ţ��������ƣ�������������߹��ʣ���͹��ʣ������ܺͣ�ƽ�����ʡ�
select e.*,d.dname ��������
from
(select deptno,count(deptno) ��������,max(sal) ��߹���,min(sal) ��͹���,
sum(sal) �����ܺ�,avg(sal) ƽ������
from emp 
group by deptno) e,dept d
where e.deptno = d.deptno

2.��ѯÿ�����ţ�ÿ����λ�Ĳ��ű�ţ��������ƣ�
��λ���ƣ�������������߹��ʣ���͹��ʣ������ܺͣ�ƽ�����ʡ�
select e.*,d.dname ��������
from
(select deptno,job ��λ����,count(1) ��������,max(sal) ��߹���,min(sal) ��͹���,
       sum(sal) �����ܺ�,avg(sal) ƽ������
from emp
group by deptno,job) e,dept d
where e.deptno = d.deptno

3.��ѯÿ������������������������ţ�����������Ҫ�����û�о������Ա��Ϣ��
select count(w.mgr) ���������,w.mgr ������,b.ename ��������
from emp w,emp b
where w.mgr = b.empno(+)
group by w.mgr,b.ename

--------------------��ϰ��
1.��ѯ������������2�Ĳ��ű�ţ��������ƣ�����������
select e.deptno ���ű��,d.dname ��������,count(e.deptno) ��������
from emp e,dept d
where e.deptno = d.deptno
group by e.deptno,d.dname
having count(e.deptno) > 2

2.��ѯ����ƽ�����ʴ���2000������������2�Ĳ��ű�ţ��������ƣ���������������ƽ�����ʣ�
�����ղ���������������
select e.deptno ���ű��,d.dname ��������,count(e.deptno) ��������,avg(sal) ƽ������
from emp e,dept d
where e.deptno = d.deptno
group by e.deptno,d.dname
having avg(sal) > 2000 and count(e.deptno) > 2
order by count(e.deptno)

----------------�κ���ҵ
1.��ѯ����ƽ��������2500Ԫ���ϵĲ������Ƽ�ƽ������
select d.dname,avg(sal)
from emp e,dept d
where e.deptno = d.deptno
group by d.dname,d.deptno
having avg(sal) > 2500

2.��ѯԱ����λ�в����ԡ�SA����ͷ����ƽ��������2500Ԫ���ϵĸ�λ��ƽ�����ʣ�
����ƽ�����ʽ�������
select job,avg(sal)
from emp
where job not like 'SA%'
group by job
having avg(sal) > 2500

3.��ѯ����������2�����ϵĲ������ơ���͹��ʡ���߹���,
������õĹ��ʽ����������뵽����λ��
select d.dname,round(min(sal),0),round(max(sal),0)
from emp e,dept d
where e.deptno = d.deptno
group by d.dname,d.deptno
having count(d.deptno) > 2

4.��ѯ��λ��ΪSALESMAN�����ʺʹ��ڵ���2500�ĸ�λ��ÿ�ָ�λ�Ĺ��ʺ͡� 
select job,sum(sal)
from emp
where job <> 'SALESMAN'
group by job 
having sum(sal) >= 2500

5.��ʾ�������;����������������������Ա������͹��ʣ�û�о����KINGҲҪ��ʾ��
��������͹���С��3000�ģ�����͹����ɸߵ�������
select b.mgr,b.ename,min(w.sal)
from emp w,emp b
where w.mgr = b.empno(+)
group by b.mgr,b.ename
having  min(w.sal) >=3000
order by min(w.sal) desc

6.дһ����ѯ����ʾÿ��������߹��ʺ���͹��ʵĲ��
select deptno,max(sal) - min(sal) ���
from emp
group by deptno



