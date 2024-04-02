#!/usr/bin/env -S deno run --allow-read --allow-write --allow-run

// Start git repo if not already started

let cmd = new Deno.Command("git", { args: ["rev-parse", "--git-dir"] });
const { stdout } = await cmd.output();
const gitDir = new TextDecoder().decode(stdout);

if (!gitDir) {
  const gitCmd = new Deno.Command("git", { args: ["init"] });
  const { stdout } = await gitCmd.output();
  await Deno.stdout.write(stdout);
  // Creates .gitignore file
  new Deno.Command("touch", { args: [".gitignore"] });
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

console.log("\n");
cmd = new Deno.Command("deno", { args: ["init"] });
const { stdout: denoOutput, stderr } = await cmd.output();

denoOutput.length > 0
  ? await Deno.stdout.write(denoOutput)
  : await Deno.stdout.write(stderr);

// Second way to run deno init
// const command = new Deno.Command(Deno.execPath(), {
//   args: ["init"],
//   stdin: "piped",
//   stdout: "piped",
// });
// const child = command.spawn();
// child.stdout.pipeTo(await Deno.stdout.writable);
// child.stdin.close();

const denoConfig = `{
  "imports": {
  },
  "tasks": {
    "dev": "deno run --watch main.ts"
  },
  "lint": {
    "include": ["src/"],
    "rules": {
      "include": [
        "no-await-in-sync-fn",
        "no-class-assign",
        "no-empty",
        "require-await"
      ]
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
    "noImplicitOverride": true,
    "noUncheckedIndexedAccess": true,
    "noUnusedParameters": true,
    "noImplicitReturns": true
  }
}`;

Deno.writeTextFileSync("deno.json", denoConfig);

// Readme file created
const readmeOpt = prompt("\nCreate a README.md file? (Y/n): ");

if (readmeOpt?.toLowerCase() === "n" || readmeOpt?.toLowerCase() === "no" || readmeOpt?.toLowerCase() === "N") {
  Deno.exit();
}

cmd = new Deno.Command("touch", { args: ["README.md"] });
cmd.outputSync();
