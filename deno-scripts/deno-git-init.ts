#!/usr/bin/env -S deno run --allow-read --allow-write --allow-run

// Start git repo if not already started

let cmd = new Deno.Command("git", { args: ["rev-parse", "--git-dir"] });
const { stdout } = await cmd.output();
const gitDir = new TextDecoder().decode(stdout);

if (!gitDir) {
  const gitCmd = new Deno.Command("git", { args: ["init"] });
  const { stdout } = await gitCmd.output();
  await Deno.stdout.write(stdout);
} else {
  console.log("Git repo already exists");
}

// Start deno project if not already started

const files = [];
for await (const dirEntry of Deno.readDir("./")) {
  if (/deno\./.test(dirEntry.name)) files.push(dirEntry.name);
}

if (files.length > 0) {
  console.log("Deno files already exist");
  Deno.exit();
}

cmd = new Deno.Command("deno", { args: ["init"] });
await cmd.output();
// const { stdout: denoOutput } = await cmd.output();
// console.log(denoOutput, "denoOutput");
// deno output is empty
console.log("\nDeno project initialized");

const denoConfig = `{
  "imports": {
  },
  "tasks": {
    "dev": "deno run --watch main.ts"
  },
  "lint": {
    "include": ["src/"],
    "rules": {
    "include": ["no-await-in-sync-fn", "no-class-assign"]
    }
  },
  "fmt": {
    "semiColons": true,
    "singleQuote": true,
    "useTabs": true,
    "lineWidth": 80
  },
  "compilerOptions": {
    "strict": true,
    "noUnusedLocals": true,
    "strictNullChecks": true,
    "noUncheckedIndexedAccess": true,
    "noUnusedParameters": true,
    "noImplicitReturns": true
  }
}`;

Deno.writeTextFileSync("deno.json", denoConfig);
