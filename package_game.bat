set Base=C:\Program Files\Epic Games\4.6\Engine
set RunUAT="%Base%\Build\BatchFiles\RunUAT.bat"
set Build="%Base%\Build\BatchFiles\Build.bat"
set Compile="%Base%\Binaries\DotNET\UnrealBuildTool.exe"

set project="C:\Users\utilisateur\Desktop\buildbot-ue4\slave-martin\packages\build\TestDemo\NetworkDemo.uproject"

%Compile% NetworkDemo Development Win64 -project=%project% -editorrecompile
%RunUAT% BuildCookRun -project=%project% -noP4 -platform=Win64 -clientconfig=Development -serverconfig=Development -maps=AllMaps -compile -archive -archivedirectory="Output Directory" -cook -stage -pak