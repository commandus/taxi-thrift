@echo off
rem thrift -gen cpp taxi.thrift
rem thrift -gen java taxi.thrift
rem thrift -gen javame taxi.thrift
thrift -out ..\html\a\app -gen js:jquery taxi.thrift 
