@echo off&color 1f
title 生成 zip 文件
setlocal EnableDelayedExpansion
mode con: cols=100

set p=%~dp0
if not "%p:~-7%"=="\media\" (
echo.
echo “zip.bat”所在目录不对，请在辅助包解压后的 media 目录里运行“zip.bat”！
echo.
pause
exit
)
cd /d %p%

set "v=%SystemDrive%\Program Files (x86)\WinRAR\WinRAR.exe"
if exist !v! goto MENU
set "v=!v: (x86)=!"
if exist !v! goto MENU
for /f tokens^=^2^ delims^=^" %%a in ('reg query "HKCR\WinRAR\shell\open\command" /v ""') do set v=%%a
if not exist !v! (
echo.
echo 未找到 WinRAR 路径，请先安装 WinRAR！
echo.
pause
exit
)

:MENU
echo.
echo  输入一个或多个数字后按回车键（5 和 6 不能同时输入）
:L0
echo  ___________________________________________________________
echo.
echo  1. 生成软件、图片等的 zip 文件
echo.
echo. 2. 生成“9ping-mp3.zip”（含《九评共产党》所有 mp3）
echo.
echo. 3. 生成“jtdwh-mp3.zip”（含《解体党文化》所有 mp3）
echo.
echo. 4. 生成“gczydzjmd-mp3.zip”（含《共产主义的终极目的》所有 mp3）
echo.
echo  5. 生成“zhenxiang.zip”（用于网站打包下载）
echo.
echo  6. 生成“zhenxiang.zip”（比 5 内容多一些）
echo.
echo  7. 更新翻墙软件的 zip 文件
echo.
set s=
set /p s=请输入: 
echo.
if "%s%"=="" goto L0

:L1
if "%s:1=%" == "%s%" goto L2
set p="!v!" a -y -o+ -ibck
del *-win.zip *-android.zip wrar540sc.zip 9pinggb.zip gczydzjmd.zip *-jpg.zip 1>nul 2>nul
%p% "zym-win.zip" fg*.exe
%p% "wjll-win.zip" u*.exe
%p% "wjydt-android.zip" um*.apk
%p% "zym-android.zip" fgma*.apk
%p% "iNTD_TV-android.zip" iNTD_TV.apk
%p% "lithium-android.zip" lithium.apk
%p% "adobe-android.zip" adobe.apk
%p% "vlc-android.zip" vlc.apk
%p% "rar-android.zip" rar-android.apk
%p% "wrar540sc.zip" wrar*.exe
%p% "9pinggb.zip" 9pinggb.htm
%p% "gczydzjmd.zip" gczydzjmd.htm
%p% "jbzxxl-jpg.zip" jbzxxl*.jpg
%p% "fldfhcsj-jpg.zip" fldfhcsj*.jpg
%p% "czsjm-jpg.zip" czsjm*.jpg
%p% "zcswwq-jpg.zip" zcswwq*.jpg
%p% "ysnbjhp-jpg.zip" ysnbjhp*.jpg
%p% "gyyrdyfx-jpg.zip" gyyrdyfx*.jpg
%p% "bjmh-jpg.zip" bjmh*.jpg
%p% "qsjzm-jpg.zip" qsjzm*.jpg
%p% "wsmqntd-jpg.zip" wsmqntd*.jpg
%p% "nbdsfgls-jpg.zip" nbdsfgls*.jpg

:L2
if "%s:2=%" == "%s%" goto L3
del 9ping-mp3.zip 1>nul 2>nul
"!v!" a -y -o+ -ibck "9ping-mp3.zip" *9ping*.mp3

:L3
if "%s:3=%" == "%s%" goto L4
del jtdwh-mp3.zip 1>nul 2>nul
"!v!" a -y -o+ -ibck "jtdwh-mp3.zip" *jtdwh*.mp3

:L4
if "%s:4=%" == "%s%" goto L5
del gczydzjmd-mp3.zip 1>nul 2>nul
"!v!" a -y -o+ -ibck "gczydzjmd-mp3.zip" *gczydzjmd*.mp3

:L5
set b=0
if "%s:5=%" == "%s%" (
if "%s:6=%" == "%s%" goto L7
set b=1
)
if exist 真相\ rd /s /q 真相\

set p= /y /k /f /r
xcopy 说明.txt 真相\ %p%
xcopy *.apk 真相\软件\ %p%
del 真相\软件\iNTD_TVsp1.apk
xcopy *.exe 真相\软件\ %p%
xcopy *.epub 真相\电子书\ %p%
xcopy jbzxxl*.jpg 真相\图片\基本真相系列\ %p%
xcopy fldfhcsj*.jpg 真相\图片\法轮大法弘传世界\ %p%
xcopy czsjm*.jpg 真相\图片\藏字石揭秘\ %p%
xcopy zcswwq*.jpg 真相\图片\走出思维误区\ %p%
xcopy ysnbjhp*.jpg 真相\图片\一生能被几回骗\ %p%
xcopy gyyrdyfx*.jpg 真相\图片\给有缘人的一封信\ %p%
xcopy bjmh*.jpg 真相\图片\宝镜漫画\ %p%
xcopy qsjzm*.jpg 真相\图片\《明慧特刊：起诉江泽民》节选\ %p%
xcopy wsmqntd*.jpg 真相\图片\为什么劝你退党\ %p%
xcopy nbdsfgls*.jpg 真相\图片\您把毒誓发给了谁\ %p%

if !b!==1 (
echo f|xcopy weihuo.mp4 "真相\视频\伪火 - 天安门自焚事件真相.mp4" %p%
echo f|xcopy 9ping.pdf 真相\九评共产党.pdf %p%
)
echo f|xcopy gczydzjmd.htm 真相\共产主义的终极目的.htm %p%

if exist zhenxiang.zip del zhenxiang.zip
"!v!" a -y -o+ -ibck -r -x*\wrar*.exe zhenxiang.zip 真相\
if exist 真相\ rd /s /q 真相\

:L7
if "%s:7=%" == "%s%" goto L
set p="!v!" a -y -o+ -ibck
del zym-win.zip wjll-win.zip wjydt-android.zip zym-android.zip iNTD_TV-android.zip 1>nul 2>nul
%p% "zym-win.zip" fg*.exe
%p% "wjll-win.zip" u*.exe
%p% "wjydt-android.zip" um*.apk
%p% "zym-android.zip" fgma*.apk
%p% "iNTD_TV-android.zip" iNTD_TV.apk

:L
echo.
echo 完成
pause
goto L0
