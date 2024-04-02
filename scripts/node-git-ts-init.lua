#!/usr/bin/env lua
local function tsConfigGen()
	os.execute("pnpm add -D typescript @types/node")
	local file = io.open("tsconfig.json", "w")
	if file then
		file:write([[
{
  "exclude": [
    "node_modules",
    "dist"
  ],
  "include": [
    "src"
  ],
  "compilerOptions": {
    "target": "ES2022", /* Set the JavaScript language version for emitted JavaScript and include compatible library declarations. */
    "module": "NodeNext", /* Specify what module code is generated. */
    "rootDir": "./src", /* Specify the root folder within your source files. */
    "moduleResolution": "NodeNext", /* Specify how TypeScript looks up a file from a given module specifier. */
    "outDir": "./dist", /* Specify an output folder for all emitted files. */
    "noEmitOnError": true, /* Disable emitting files if any type checking errors are reported. */
    "esModuleInterop": true, /* Emit additional JavaScript to ease support for importing CommonJS modules. This enables 'allowSyntheticDefaultImports' for type compatibility. */
    "forceConsistentCasingInFileNames": true, /* Ensure that casing is correct in imports. */
    "strict": true, /* Enable all strict type-checking options. */
    "noImplicitAny": true, /* Enable error reporting for expressions and declarations with an implied 'any' type. */
    "noImplicitThis": true, /* Enable error reporting when 'this' is given the type 'any'. */
    "alwaysStrict": true, /* Ensure 'use strict' is always emitted. */
    "noUnusedLocals": true, /* Enable error reporting when local variables aren't read. */
    "noUnusedParameters": true, /* Raise an error when a function parameter isn't read. */
    "noImplicitReturns": true, /* Enable error reporting for codepaths that do not explicitly return in a function. */
    "noFallthroughCasesInSwitch": true, /* Enable error reporting for fallthrough cases in switch statements. */
    "noUncheckedIndexedAccess": true, /* Add 'undefined' to a type when accessed using an index. */
    "noImplicitOverride": true, /* Ensure overriding members in derived classes are marked with an override modifier. */
    "skipLibCheck": true /* Skip type checking all .d.ts files. */
  }
}
  ]])
		file:close()
	else
		print("Error: Could not create tsconfig.json file")
	end
	os.execute("mkdir src")
	os.execute("touch src/app.ts")
end

local function packageElection(package, flag)
	os.execute(package .. " init " .. (flag or ""))
end

local function gitInitilization()
	local gitFile = os.execute("git rev-parse --git-dir &> /dev/null")
	if gitFile then
		print("Git already initialized")
	else
		os.execute("git init")
		os.execute("touch .gitignore")
	end
end

local function packageJsonScripts()
	local package = io.open("package.json", "r"):read("a")

	package = (
		package:gsub(
			[[
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
      ]],
			[[
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1",
    "dev": "tsc -w",
    "dev:watch": "node --watch ./dist/app.js",
    "build": "rm -rf ./dist && tsc"
  },
      ]]
		)
	)

	local file = io.open("package.json", "w")

	if not file then
		print("Error: Could not open package.json file")
		os.exit()
	end

	file:write(package)
	file:close()
end

if arg[1] == "-y" then
	os.execute("pnpm init")
	gitInitilization()
	os.execute("touch README.md")
	packageJsonScripts()
	tsConfigGen()
	os.exit()
end

io.write([[Which package manager do you want to use?
  1. pnpm
  2. npm
  3. bun
  4. yarn
]])

local packageManager = {
	[1] = "pnpm",
	[2] = "npm",
	[3] = "bun",
	[4] = "yarn",
}

local choice = packageManager[tonumber(io.read())]

if choice == "pnpm" then
	packageElection(choice)
elseif choice == "npm" then
	packageElection(choice, "-y")
elseif choice == "bun" then
	packageElection(choice)
elseif choice == "yarn" then
	packageElection(choice, "-y")
else
	print("No valid package manager selected. project initialized with pnpm")
	os.execute("sleep " .. 1)
	packageElection("pnpm")
end

packageJsonScripts()

io.write("Do you want to initialize git? [Y/n]: ")
local gitChoice = io.read()
if gitChoice == "N" or gitChoice == "n" then
	print("Git not initialized")
else
	gitInitilization()
end

io.write("Do you want to initialize typescript? [Y/n]: ")
local tsChoice = io.read()

if tsChoice == "N" or tsChoice == "n" then
	print("Typescript not initialized")
else
	tsConfigGen()
end

io.write("Do you want to create a README.md? [Y/n]: ")
local readmeChoice = io.read()

if readmeChoice == "N" or readmeChoice == "n" then
	print("README not created")
else
	os.execute("touch README.md")
end
