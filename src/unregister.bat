@echo off
set asmexe=%SystemRoot%\Microsoft.net\Framework\v4.0.30319\Regasm.exe
set prjdll=T:\b\dBaseCOM\DBaseButtonOCX\bin\x86\Debug\DBaseButtonOCX.dll

%asmexe% %prjdll% /nologo /unregister /tlb

