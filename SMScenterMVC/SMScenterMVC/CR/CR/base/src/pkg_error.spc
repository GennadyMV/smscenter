create or replace package PKG_ERROR is
/******************************************************************************
  -- Author  : H02-GERASIMOVMN
  -- Created : 16.02.2012 13:50:47
  -- Purpose : ����� �������� ���� ������������ ������

  ����:       ������:  �����:            ��������:
----------  -------  ----------------  ------------------------------------
2012-02-16           ������ ���������  �������� ����� ������
2012-02-21           ������ ���������  ���������� ERROR_MESSAGE_NO_FOUND, ERROR_STATUS_NO_FOUND
2012-06-05           ������ ������     ���������� ERROR_SOME_PARAM_EMPTY

******************************************************************************/

-- ������ ������
  ERROR_TASK_NAME_EMPTY                constant INTEGER := 20001; -- ��� ������� ������ ����������� ������������
  ERROR_TYPE_NO_FOUND                  constant INTEGER := 20002; -- ������ ���� ������ ������������ ��� �������
  ERROR_MESSAGE_NO_FOUND               constant INTEGER := 20003; -- ��� ������ ���������
  ERROR_STATUS_NO_FOUND                constant INTEGER := 20004; -- ��� ������ ������� ���������
  ERROR_MESSAGE_TEXT                   constant INTEGER := 20005; -- ����������� ����� ���������
  ERROR_PHONE_NUMBER                   constant INTEGER := 20006; -- �� ���������� ����� ��������
  ERROR_USER_LOGIN                     constant INTEGER := 20007; -- �� ������ ������������ � ����� �������
  ERROR_DATE_PERIOD                    constant INTEGER := 20008; -- �� ������ �������� ���
  ERROR_SOME_PARAM_EMPTY               constant INTEGER := 20009; -- ������� �� ��� ���������

end PKG_ERROR;
/

