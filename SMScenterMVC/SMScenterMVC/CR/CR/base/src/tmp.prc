create or replace procedure tmp is
cursor rows is select * from abonent_group_link;

begin
  --������� ��� ���������� ���������� �����.
  for j in rows
  loop
  update abonent_group_link s set id=s_abonent_group_link.nextval
  where s.group_id=j.group_id and s.abonent_id=j.abonent_id;
  end loop;
  commit;
end tmp;
/

