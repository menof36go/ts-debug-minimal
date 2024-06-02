## How to use

Run createFiles.bat as administrator<br />
It should create "real.ts", transpile and sourcemap it in ./Project<br />

It should create "hardlinked.ts", transpile and sourcemap it in .<br />
It should create a hardlink between Project\hardlinked.ts and hardlinked.ts<br />

It should create "softlinked.ts", transpile and sourcemap it in .<br />
It should create a softlink between Project\softlinked.ts and softlinked.ts<br />

### Scenario 1 (Only Typescript breakpoint)

Place a debugger in the softlinked version at Project\softlinked.**ts**<br />
Run launch config "Preserve" from . or CD into Project and run "Preserve & Relative"<br />
The breakpoint will be missed<br />

### Scenario 2 (Typescript breakpoint first, Javascript breakpoint second)

Place a debugger in line 1 of the softlinked version at Project\softlinked.**js**<br />
Place a debugger in line 2 of the softlinked version at Project\softlinked.**ts**<br />
The breakpoint at line 1 will be triggered at Project\softlinked.**js**<br />
The breakpoint at line 2 will be triggered at Project\softlinked.**ts**<br />

### Scenario 2 (Javascript breakpoint first, Typescript breakpoint second)

Place a debugger in line 2 of the softlinked version at Project\softlinked.**js**<br />
Place a debugger in line 1 of the softlinked version at Project\softlinked.**ts**<br />
The breakpoint at line 1 will be triggered at Project\softlinked.**js**<br />
The breakpoint at line 2 will be triggered at Project\softlinked.**js**<br />

### Scenario 4 (Hardlink works as intended)

Place a debugger in the hardlinked version at Project\hardlinked.**ts**<br />
Run launch config "Preserve" from . or CD into Project and run "Preserve & Relative"<br />
The breakpoint will be triggered normally<br />

### Thoughts

Oddly enough, breakpoints in a softlinked typescript file will only trigger, if any breakpoint exists in the javascript file.<br />
If the typescript breakpoint is triggered before any javascript breakpoint, it will be triggered inside the javascript source.<br />
All typescript breakpoints after a javascript breakpoints will be triggered inside the typescript source correctly.<br />
If no javascript breakpoint exists, all typescript breakpoints are ignore completely.<br />

### Testing setup

#### VSCode

Version: 1.89.1 (user setup)<br />
Commit: dc96b837cf6bb4af9cd736aa3af08cf8279f7685<br />
Date: 2024-05-07T05:13:33.891Z<br />
Electron: 28.2.8<br />
ElectronBuildId: 27744544<br />
Chromium: 120.0.6099.291<br />
Node.js: 18.18.2<br />
V8: 12.0.267.19-electron.0<br />
OS: Windows_NT x64 10.0.22631<br />

#### Node

v22.2.0<br />

#### Javascript Debugger

v2024.5.217 Nightly<br />
