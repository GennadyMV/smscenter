create or replace package pkg_sms is

  -- Author  : H02-TURUSHEVNA
  -- Created : 15.02.2012 14:23:27
  -- Purpose : API ��� ��������� �������������

  -- Public type declarations
--  type <TypeName> is <Datatype>;

  -- Public constant declarations

--  <ConstantName> constant <Datatype> := <Value>;

  -- Public variable declarations
--  <VariableName> <Datatype>;

  -- Public function and procedure declarations

---------------------------------------------------------------------------
  --������� ������� sms �� ��������
    --���������:
            --phone_ -  11-�� ������ ����� �������� �������� � ����� ������.
            --text_ - ����� ��������� �������� 255 ��������.
            -- priority_ - ��������� ��� ���������
            --���������� �������������� sms
  function add(phone_ varchar2,text_ varchar2, priority_ number := 9) return number;
---------------------------------------------------------------------------
  --������� �������� ������� sms
    --���������:
            --sms_id_ ������������� sms
            --���������� ������ ��� � ��������� ����:
              --�������, �����������, ���������, ������
  function chk(sms_id_ number) return varchar2;
---------------------------------------------------------------------------
  --������� �������� ������
    --���������:
            --name_ ��� ������
            --type_ ��� ������:
              --1-���������,2-���������,3-���������
            --���������� ������������� ������.
  function add_task(name_ varchar2, type_ number) return number;
---------------------------------------------------------------------------
  --������� ������� sms �� ��������, � ������ ����������� ������
    --���������:
            --phone_ -  11-�� ������ ����� �������� �������� � ����� ������.
            --text_ - ����� ��������� �������� 255 ��������.
            --task_id - ������������� ������
            -- priority_ - ��������� ��� ���������
            --���������� �������������� sms
  function add_to_task(phone_ varchar2,text_ varchar2,task_id number, priority_ number := 999) return number;
---------------------------------------------------------------------------
  --������� ���������� ������������� �������� ������������
  function get_user return number;

end pkg_sms;
/

