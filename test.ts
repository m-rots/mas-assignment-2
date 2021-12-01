import { parse } from "https://deno.land/std@0.83.0/encoding/toml.ts";
import { join } from "https://deno.land/std@0.116.0/path/mod.ts";

interface Config {
    directory: string
    files: {
        [key: string]: TestFile
    }
}

interface TestFile {
    module: string
}

const configText = await Deno.readTextFile("tests.toml");
const config = parse(configText) as unknown as Config;

const maybeDir = Deno.args.at(0)
if (!maybeDir) {
    console.log("Please provide the path with the student's Prolog files.")
    console.log("\nFor example:")
    console.log("deno run --allow-all test.ts /path/to/files")
    Deno.exit(1)
}

const dir = await Deno.realPath(maybeDir)

console.log(`Running test suite for path: ${dir}`)

for (const [name, file] of Object.entries(config.files)) {
    const fileName = `${name}.pl`;
    const filePath = join(dir, fileName);

    const contents = await Deno.readTextFile(filePath)
    const header = "% Added by test.ts"
    if (contents.startsWith(header)) {
        console.debug(`skipping ${fileName}`)
        continue
    }

    const newContents = `${header}\n${file.module}\n\n${contents}`
    await Deno.writeTextFile(filePath, newContents)
}

console.log(`Processed all prolog files in: ${dir}`)

for (const name in config.files) {
    console.log(`\nRunning test: ${name}`)
    const fileName = await Deno.realPath(`${name}.plt`);

    const p = Deno.run({
        cmd: ["swipl", "-g", "run_tests", "-t", "halt", fileName],
        cwd: dir,
    });

    await p.status()
}