#!/usr/bin/env lua
local function tsConfigGen()
	os.execute("pnpm add -D typescript")
	local file = io.open("tsconfig.json", "w")
	if file then
		file:write([[
{
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
	end
end

if arg[1] == "-y" then
	os.execute("pnpm init")
	os.execute("git init")
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
	os.execute("sleep " .. tonumber(1))
	packageElection("pnpm")
end

io.write("Do you want to initialize git? [Y/n]: ")
local gitChoice = io.read()
if gitChoice == "Y" or gitChoice == "y" then
	gitInitilization()
else
	print("Git not initialized")
end

io.write("Do you want to initialize typescript? [Y/n]: ")
local tsChoice = io.read()
if tsChoice == "Y" or tsChoice == "y" then
	tsConfigGen()
else
	print("Typescript not initialized")
end
