@ECHO OFF
IF NOT "%~f0" == "~f0" GOTO :WinNT
@"jruby.exe" "C:/Users/Paul/Documents/Work/Coding/cuke4duke/examples/java/lib/.jruby/bin/cucumber" %1 %2 %3 %4 %5 %6 %7 %8 %9
GOTO :EOF
:WinNT
@"jruby.exe" "%~dpn0" %*
