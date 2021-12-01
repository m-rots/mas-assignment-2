# MAS Assignment 2

This repository contains a test-suite to automatically check whether the Prolog
code submitted by students matches the expected output.

## Directory structure

If the file names of the Prolog files do not match the names below, you should
make sure to rename these files first:

- `blocks.pl`
- `mean.pl`
- `movies.pl`
- `navigate.pl`
- `sum.pl`
- `tower_blocks.pl`

## Running the test suite

To run the test suite, you must first ensure you have the following tools
installed:

- [SWI-Prolog](https://www.swi-prolog.org/download/stable) (make sure that
  `swipl` is added to PATH)

- [Deno](https://deno.land/#installation)

You can then run the following command to run the test-suite:

```bash
deno run --allow-all test.ts "/path/containing/submitted/files"
```

## The tests

All 6 questions where Prolog code is asked have a test suite. If you're curious
why some errors are generated, make sure to first checkout the corresponding
`.plt` files.

These test results should not be used for the final scores. Instead, carefully
look at what's going wrong to assess whether you can still give points.
Likewise, even if the test suite succeeds, make sure to check whether the
submitted code matches the question's criteria.

If you think we can improve these tests, please hit me up on Discord!

### Blocks

For the blocks test, make sure you update the student's submitted `blocks.pl`
file to include the following facts:

```prolog
on(b, a).
on(c, b).
on(d, c).
on(e, d).
```

### Sum

If the test hangs on the sum test, then append/3 and permutation/2 are in the
wrong order. You should subtract 5 points for this, as the output does not match
the given output in the PDF.

To make sure the rest of the test suite is able to complete, comment out sum/3
in the `sum.pl` file.
