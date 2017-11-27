@echo off

del %HOMEPATH%\.gitconfig
del %HOMEPATH%\.gitignore_global
mklink %HOMEPATH%\.gitconfig %~dp0\git\win.gitconfig
mklink %HOMEPATH%\.gitignore_global %~dp0\git\.gitignore_global

exit 0
