hg add
hg remove -A
hg commit -m "deploy"
hg pull
hg update --check
hg push -f
echo "��������� ��ࠢ���� � ९����਩..."
pause
cd D:\Projects\
hg commit -m "deploy"
hg pull
hg update --check
cd SMScenterMVC\CR
echo "��⠫�� �������� ९������ ��������..."
pause
cr.exe db PRODACTION
cr.exe migrate
cr.exe compile
hg commit -m "deploy"
echo "��������� � �� ���ᥭ�..."
pause
cd ..
cd ..
build.bat
