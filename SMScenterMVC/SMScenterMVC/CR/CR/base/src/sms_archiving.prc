create or replace procedure SMS_ARCHIVING is
 i integer;
begin
--   ������������� ������� � ������� MESSAGES (�� ����� ������ 1 ���.)
     INSERT INTO archive_message SELECT * FROM messages t WHERE t.created_at < sysdate-30;
     DELETE FROM messages t WHERE t.created_at < sysdate-30;
--   ������ ������ (�� ��������� ������ 1 ���)
     DELETE FROM archive_message t WHERE t.created_at < sysdate-356;
     i := PKG_SMS.add(phone_ => '79241086744',text_ => 'SMS ������������� ���������');
end SMS_ARCHIVING;
/

