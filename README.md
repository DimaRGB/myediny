myediny
=======

myediny

sublime text 3 - instruction to setup
	1. Package manager - https://sublime.wbond.net/installation
	2. Install next packages (Ctrl + Shift + P -> write text 'install' -> enter):
		-	SublimeOnSaveBuild
		-	Better CoffeeScript

setup coffeescript build:
	Preferences -> Package Settings -> Better CoffeeScript -> Settings - User
	paste next text, binDir - path of coffeescript bin file:

		{
		    "envPATH": "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
		,   "binDir": "/usr/lib/node_modules/coffee-script/bin"
		,   "noWrapper": true
		,   "watchOnSave": true
		,   "watchOnModified": 0.5
		,   "compileOnSave": true
		,   "showOutputOnSave": false
		,   "compileDir": "compiled"
		,   "compilePaths": false
		}

