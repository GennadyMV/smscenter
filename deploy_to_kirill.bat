hg add
hg remove -A
hg commit -m "deploy"
hg push -f
echo "��������� ��ࠢ���� � ९����਩..."
pause
cd D:\kirill\Projects\
hg pull
hg update
cd SMScenterMVC\CR
echo "��⠫�� �������� ९������ ��������..."
pause
cr.exe db DEVELOPMENT
cr.exe migrate
cr.exe compile
echo "��������� � �� ���ᥭ�..."
pause
cd ..
cd ..
build_debug.bat
cd SMScenterMVC\CR
cr.exe db DEVELOPMENT
cd ..
cd ..
hg commit -m "SMSCENTER_DEBUG"
hg push
