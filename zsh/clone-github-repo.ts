import * as log from "https://deno.land/std/log/mod.ts";
import { parse } from "https://deno.land/std/flags/mod.ts";

const flags = parse(Deno.args, {
  string: ["std-log-level"]
})
const args_without_flags = flags._
const STD_LOG_LEVEL = flags["std-log-level"] || "INFO"
await log.setup({
  handlers: {
    console: new log.handlers.ConsoleHandler(STD_LOG_LEVEL),
  },
  loggers: {
    default: {
      level: STD_LOG_LEVEL,
      handlers: ["console"],
    },
  },
});

log.debug("init")

log.debug(args_without_flags)
const address_or_repo = args_without_flags.at(0)
const github_prefix =  "https://github.com/"
let source, target
if (address_or_repo.startsWith(github_prefix)) {
  source = address_or_repo
  target = address_or_repo.substring(github_prefix.length)
} else {
  source = github_prefix + address_or_repo
  target = address_or_repo
}

const process = Deno.run({
  cmd: ["git", "clone", source + ".git", "~/g/" + target]
})

log.debug(await process.status())
