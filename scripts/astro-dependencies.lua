#!/usr/bin/env lua

io.write([[Which package manager are you using?
  1. pnpm
  2. npm
  3. yarn
]])

local packageManager = {
	[1] = "pnpm",
	[2] = "npm",
	[3] = "yarn",
}

local choice = packageManager[tonumber(io.read())]

io.write("Do you want to add prettier? [Y/n]: ")
local prettierChoice = io.read()

if prettierChoice == "N" or prettierChoice == "n" then
	print("Tailwind not initialized")
else
	if choice == "npm" then
		os.execute("npm install --save-dev prettier prettier-plugin-astro prettier-plugin-tailwindcss")
	elseif choice == "yarn" then
		os.execute("yarn add --dev prettier prettier-plugin-astro prettier-plugin-tailwindcss")
	else
		os.execute("pnpm add -D prettier prettier-plugin-astro prettier-plugin-tailwindcss")
	end
	os.execute("touch .prettierrc.mjs")

	local file = io.open(".prettierrc.mjs", "w")
	if file then
		file:write([[
  /** @type {import("prettier").Config} */
  export default {
    plugins: ['prettier-plugin-astro', 'prettier-plugin-tailwindcss'],
    overrides: [
      {
        files: '*.astro',
        options: {
          parser: 'astro',
        },
      },
    ],
  };
    ]])
		file:close()
	else
		print("Error: Could not create .prettierrc.mjs file")
	end
end

io.write("Do you want to add sass? [Y/n]: ")
local sassChoice = io.read()
if sassChoice == "N" or sassChoice == "n" then
	print("sass not initialized")
else
	if choice == "npm" then
		os.execute("npm install --save-dev sass")
	elseif choice == "yarn" then
		os.execute("yarn add --dev sass")
	else
		os.execute("pnpm add -D sass")
	end
end

io.write("Do you want to add tailwind? [Y/n]: ")
local twChoice = io.read()

if twChoice == "N" or twChoice == "n" then
	print("Tailwind not initialized")
else
	if choice == "npm" then
		os.execute("npx astro add tailwind")
	else
		os.execute((choice or "pnpm") .. " astro add tailwind")
	end
end

io.write("Do you want to add a framework UI? [Y/n]: ")
local uiChoice = (io.read())
if uiChoice == "Y" or uiChoice == "y" or uiChoice == "" then
	io.write([[Which ui framework do you want to use or are using?
  1. react
  2. lit
  3. preact,
  4. svelte,
  5. solid,
  6. vue,
  7. alpinejs
]])

	local uiFramework = {
		[1] = "react",
		[2] = "lit",
		[3] = "preact",
		[4] = "svelte",
		[5] = "solid",
		[6] = "vue",
		[7] = "alpinejs",
	}

	local uiFrameworkChoice = uiFramework[tonumber(io.read())]

	if choice == "npm" then
		os.execute("npx astro add " .. uiFrameworkChoice)
	else
		os.execute((choice or "pnpm") .. " astro add " .. uiFrameworkChoice)
	end
end

io.write("Do you want to add a SSR Adapter? [Y/n]: ")
local ssrChoice = (io.read())
if ssrChoice == "N" or ssrChoice == "n" then
	print("SSR Adapter not required")
else
	io.write("Do you want to add a SSR Adapter? [Y/n]: ")

	local ssrAdapter = {
		[1] = "cloudflare",
		[2] = "node",
		[3] = "vercel",
		[4] = "netlify",
	}

	local ssrAdapterChoice = ssrAdapter[tonumber((io.read()))]

	if choice == "npm" then
		os.execute("npx astro add " .. ssrAdapterChoice)
	else
		os.execute((choice or "pnpm") .. " astro add " .. ssrAdapterChoice)
	end
end
