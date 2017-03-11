@echo off
::set Path=lib;%Path%
set startTime=%1
if {%1}=={} ( set startTime="test")
set runCycles=%2
set runDuration=%3
set currentTime=%time:~0,2%
if {%1}=={} (if {%2}=={} (if {%3}=={} java  -cp bin/lib/wtd.jar;bin/lib/dom4j-1.6.1.jar;bin/lib/jaxen-1.1.1.jar;bin/lib/log4j-1.2.17.jar;bin/lib/selenium-server-standalone-2.53.0.jar;bin/lib/activation-1.1.1.jar;bin/lib/javax.mail-1.5.6.jar;bin/lib/mysql-connector-java-5.0.5.jar;bin/lib/substance-7.3.jar;bin/lib/trident-1.3.jar;bin/lib/trident-7.3-swing.jar com.pub.wtd.common.Main
)

) else ( if not {%1}=={} (if not {%2}=={} (if not {%3}=={} (
::start to launch the schedule 
:mark
set currentTime=%time:~0,2%
if %startTime% equ %currentTime% (
for /L %%i in (1,1,%2) do (
echo ********************start the new  cycle test********************
java -cp bin/lib/wtd.jar;bin/lib/dom4j-1.6.1.jar;bin/lib/jaxen-1.1.1.jar;bin/lib/log4j-1.2.17.jar;bin/lib/selenium-server-standalone-2.53.0.jar;bin/lib/activation-1.1.1.jar;bin/lib/javax.mail-1.5.6.jar;bin/lib/mysql-connector-java-5.0.5.jar;bin/lib/substance-7.3.jar;bin/lib/trident-1.3.jar;bin/lib/trident-7.3-swing.jar com.pub.wtdcommon.Main
ping 127.0.0.1 -n %3 >null
)
echo *******************finish one cycle test*************************
)
echo ***********sleep 60 seconds for the next cycle test**************
ping 127.0.0.1 -n 60 >null

goto mark

)
)
) 
) 
