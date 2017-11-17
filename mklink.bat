@echo off

del %HOMEPATH%\.gitconfig
mklink %HOMEPATH%\.gitconfig %~dp0\git\win.gitconfig

exit 0
