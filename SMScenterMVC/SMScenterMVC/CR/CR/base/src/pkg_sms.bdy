create or replace package body pkg_sms is

  -- Private type declarations
--  type <TypeName> is <Datatype>;

  -- Private constant declarations
--  <ConstantName> constant <Datatype> := <Value>;

  -- Private variable declarations
--  <VariableName> <Datatype>;

  -- Function and procedure implementations
/*  function <FunctionName>(<Parameter> <Datatype>) return <Datatype> is
    <LocalVariable> <Datatype>;
  begin
    <Statement>;
    return(<Result>);
  end;*/

--begin

-----------------------------------------------------------------------------
  --������� ������� sms �� ��������
    --���������:
            --_phone -  11-�� ������ ����� �������� �������� � ����� ������.
            --_text - ����� ��������� �������� 255 ��������.
            -- priority_ - ��������� ��� ��������� �� ��������� 9
            --���������� �������������� sms
  function add(phone_ varchar2,text_ varchar2, priority_ number) return number
  is
    mess_id number;
  begin
    mess_id:=pkg_sms.add_to_task(phone_,text_ ,0, priority_);
    return mess_id;
  end;
---------------------------------------------------------------------------
  --������� �������� ������� sms
    --���������:
            --sms_id ������������� sms
            --���������� ������ ��� � ��������� ����:
              --�������, �����������, ���������, ������
  function chk(sms_id_ number) return varchar2
  is
  result_ varchar2(20 CHAR);
  begin
    select s.name into result_ from messages m
    left join status_msg s on m.status_id=s.id
    where m.id=sms_id_;
    return result_;

    exception
    when no_data_found then
      raise_application_error(-pkg_error.ERROR_MESSAGE_NO_FOUND,'��� ������ ���������!');
  end;
---------------------------------------------------------------------------
  --������� �������� ������
    --���������:
            --name_ ��� ������
            --type_ ��� ������:
              --1-���������,2-���������,3-���������
            --���������� ������������� ������.
  function add_task(name_ varchar2, type_ number) return number
  is
--  result_ number;
  task_id number;
  error_task_name_empty exception;
    begin
      --��������� ����� ��������
      if name_ is null
         or length(trim(name_))=0
        then raise error_task_name_empty;
      end if;

      task_id:=s_tasks.nextval;
      --������� �������
      insert into tasks (id,name,type_task_id,user_id,group_msg)
      values(task_id,name_,type_,pkg_sms.get_user,0);

    return task_id;

    exception
      when error_task_name_empty then
        raise_application_error(-pkg_error.ERROR_TASK_NAME_EMPTY,'��� ������������ �������!');
  end;
---------------------------------------------------------------------------
  --������� ������� sms �� ��������, � ������ ����������� ������
    --���������:
            --phone_ -  11-�� ������ ����� �������� �������� � ����� ������.
            --text_ - ����� ��������� �������� 255 ��������.
            --task_id - ������������� ������
            -- priority_ - ��������� ��� ���������
            --���������� �������������� sms
  function add_to_task(phone_ varchar2,text_ varchar2,task_id number, priority_ number) return number
  is
  error_phone_number exception;
  error_messge_text exception;
  mess_id number;
  result_ number;
  v_priority number := priority_;
    begin
      result_:=-1;
--�������� ����������
      --��������� ����� ��������
      if phone_ is null
         or length(trim(phone_))<>11
         or length(trim(translate(phone_, '0123456789',' '))) is not null
        then raise error_phone_number;
      end if;
      --��������� ����� ���������
      if text_ is null or length(trim(phone_))=0
        then raise error_messge_text;
      end if;
      -- ���������
      if v_priority = 999 or v_priority is null then
         SELECT type_task.priority INTO v_priority FROM tasks LEFT JOIN type_task ON tasks.type_task_id=type_task.id WHERE tasks.id=task_id;
      end if;
      --�������� �������������
     mess_id:=s_messages.nextval;
--������� ��������� � ��������� � ������� �� ���������.
      insert into messages(id,phone,message,user_id,task_id, priority)
       values(mess_id,trim(phone_),text_,pkg_sms.get_user,task_id,v_priority);
      result_:=mess_id;
    return result_;

--��������� ����������
    exception
--      when no_data_found then exit;
      when error_phone_number then
        raise_application_error(-pkg_error.ERROR_PHONE_NUMBER,'�� ��������� ����� ����� ��������! ������ ���� 11 ����.');
      when error_messge_text then
        raise_application_error(-pkg_error.ERROR_MESSAGE_TEXT,'����� ��������� �����������!');
      when others then raise;
  end;

---------------------------------------------------------------------------
  --������� ���������� ������������� �������� ������������
  function get_user return number
  is
  user_id number;
    begin
    select id into user_id from users
    where upper(trim(login))=upper(trim(user));
    return user_id;

  exception
    when no_data_found then
      raise_application_error(-pkg_error.ERROR_USER_LOGIN,'�� ������ ������������!');
  end;
  -- Initialization
  --<Statement>;
  end pkg_sms;
/

