---------------------------------------��ʮ����
�û���һ����DBA(���ݿ����Ա)������ά���ģ������û����û�������ִ���κ�Oracle������
      �����򿪻Ự����ֻ�и����û���ص�Ȩ�ޣ����ܲ���
      
��sys�û������û��͸����û�quanxian

�����û���create user userName identified by password 

����Ȩ�ޣ�grant Ȩ�� to �û�

ɾ���û���drop user userName

Ȩ�ޣ�
Ȩ�޷��ࣺ
     ϵͳȨ�ޣ������û������ݿ���ִ��ָ������Ϊ��һ��������ɱȽ�ͨ�õ�һ��Ȩ�ޡ�
     ����Ȩ�ޣ������û����ʺͲ���һ��ָ���Ķ���
                �ö�����һ��ȷ�д洢�����ݿ��е���������
                
����ϵͳȨ�ޣ�grant ϵͳȨ���б�[,ϵͳȨ���б�,...]  to �û�[,�û�] [with admin option]
with admin option:����Ȩ�޵Ľ������ٰѴ���Ȩ���������û�

����ϵͳȨ�ޣ�REVOKE sys_priv_list(ϵͳȨ���б�) FROM user_list(�û�);
ע�⣺����ϵͳȨ�޺󣬸����ȥ��Ȩ�޲��ᱻ����

�������Ȩ�ޣ�grant on ������ to [user/public] [with admin option]
���ն���Ȩ�ޣ�revoke ����Ȩ������ ON ������ FROM user;
ע�⣺���ն���Ȩ�޺󣬸����ȥ��Ȩ�޻ᱻ����

��ɫ����Ȩ�޵ļ���
������ɫ��create role roleName

Ϊ��ɫ����Ȩ�ޣ�grant Ȩ���б� to roleName

ͨ����ɫΪ�û���Ȩ��grant roleName to �û�

ͨ����ɫ���û��ջ�Ȩ�ޣ�revoke roleName from �û�
�ӽ�ɫ����Ȩ�ޣ�revoke Ȩ�� from  roleName
ɾ����ɫ��drop role roleName               
                
----------�κ���ҵ                
1.�������û�neu
��sys�û���command��create user neu identified by 123456;

2.���û�neu��Ȩ,ʹ���ܹ���¼�����ݿ⣬�ܹ���ѯscott�µ�emp��
���޸�emp���sal,ename�����ֶ�
grant create session to neu;-----��¼�����ݿ�
grant select on scott.emp to neu; ----��ѯscott�µ�emp��               
grant update on scott.emp to neu; ----�޸�emp���sal,ename�����ֶ�               
                
3.�����û�neu�ĵ�¼Ȩ��
revoke create session from neu;

4.�����û�neu�����ж���Ȩ��
revoke all privilege on scott.emp from neu;                
                
5.������ɫrole_neu
create role role_neu;               
                
6.����ɫrole_neu��Ȩ,ʹ���ܹ���¼�����ݿ�
grant create session to role_neu; 
               
7.����ɫrole_neu���û�neu
grant role_neu to neu               
                
8.ɾ����ɫrole_neu
drop role role_neu                
                
9.ɾ���û�neu
drop user neu                
                

