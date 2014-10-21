SET DB=mysql
rem SET DB=pgsql
@echo off
SET OUTCPP=C:\src\taxi\cpp\taxi-simple\taxi-simple-cli\thrift
thrift -out %OUTCPP% -gen cpp taxi.thrift
thrift -out C:\src\taxi\html\a\js -gen js:jquery taxi.thrift 
rem SET FIN=gen-cpp\taxi_types.h
SET ODB=C:\lib\odb\bin\odb
SET FIN=%OUTCPP%\taxi_types.h
SET INC=  -IC:\lib\thrift\lib\cpp\src -IC:\lib\boost -IC:\lib\libodb-%DB%-2.3.0 -IC:\p\MySQL -I%OUTCPP% -IC:\src\taxi\thrift
SET OPT=--options-file C:\src\taxi\thrift\taxi-odb-options-%DB%.txt

%ODB% -d %DB% --generate-query --generate-schema %OPT% %INC% %FIN% -DGEN_ODB

copy C:\src\taxi\cpp\taxi-simple\taxi-simple-cli\thrift\*.* C:\src\taxi\cpp\taxi-simple\taxi-simple-svc\thrift
copy taxi_types-odb.* C:\src\taxi\cpp\taxi-simple\taxi-simple-svc\thrift
del taxi_types-odb.* 