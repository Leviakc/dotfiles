#!/usr/bin/env -S deno run --allow-read --allow-write

/**
 *  hashbang.ts
 */

// let cmd = new Deno.Command("pwd");
// const { stdout: print } = await cmd.output();
// console.log(stdout);

// await Deno.stdout.write(print);
// let cmd = new Deno.Command("git init"); //  this does not work

const serverOpt = async (opt: string) => {
  if (!opt) {
    const denoServer = await Deno.readTextFile("deno.txt");
    Deno.writeTextFileSync("./lua/gomen/plugins/lsp.lua", denoServer);
    return;
  }

  const defaultServer = await Deno.readTextFile("default.txt");
  Deno.writeTextFileSync("./lua/gomen/plugins/lsp.lua", defaultServer);
};

serverOpt(Deno.args[0]);
console.log("Server changed");
