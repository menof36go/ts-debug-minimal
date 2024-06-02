@echo off
cd %~dp0
echo import "./hardlinked.js";>real.ts
echo import "./softlinked.js";>>real.ts
cmd /c tsc --sourceMap real.ts

echo console.log("I am the hardlinked file!");>../hardlinked.ts
cmd /c tsc --sourceMap ../hardlinked.ts
mklink /h %~dp0hardlinked.ts %~dp0..\hardlinked.ts
mklink /h %~dp0hardlinked.js %~dp0..\hardlinked.js
mklink /h %~dp0hardlinked.js.map %~dp0..\hardlinked.js.map

echo console.log("I am the softlinked file!");>../softlinked.ts
echo console.log("Line 2");>>../softlinked.ts
cmd /c tsc --sourceMap ../softlinked.ts
mklink %~dp0softlinked.ts %~dp0..\softlinked.ts
mklink %~dp0softlinked.js %~dp0..\softlinked.js
mklink %~dp0softlinked.js.map %~dp0..\softlinked.js.map
