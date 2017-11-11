@echo off

del %HOMEPATH%\.gitconfig
mklink %HOMEPATH%\.gitconfig %~dp0\win.gitconfig

exit 0
