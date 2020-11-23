# Exercism V Track

[![Tests](https://github.com/petertseng/exercism-v/workflows/Tests/badge.svg?branch=master)](https://github.com/petertseng/exercism-v/actions?query=workflow%3ATests+branch%3Amaster)

Exercism exercises in V.

Last known status:

This language has the potential to be made into an Exercism track, but with the caveat that there is an important decision to be made regarding directory structure and V's modules.
Here are the factors resulting in the necessity of this decision:

* Recall that Exercism's directory structure is that an exercise named "Hello World" is considered to have a *slug* of hyphen-separated words like hello-world, which is then placed in `exercises/hello-world` of a track repo.
* Recall that V expects modules to be named after the directory they are located in.
    * https://github.com/vlang/v/blob/master/doc/docs.md#modules
    * https://github.com/vlang/v/issues/2685
* Experimentation shows that hyphens are not a valid character in V module names.

This is then a problem, since it implies that any exercise with multiple words in its name would force an illegal module name.

After experimentation, here are three ways that work, for consideration by a future maintainer who wishes to take on this track:

1. Break with Exercism's convention of using directory names like `hello-world` (separated by hyphens) and instead use directory names like `hello_world` (separated by underscores), using `module` and `import` lines matching those underscore-separated names such as `module hello_world` and `import hello_world`.
    * See `exercises/hello_world` in this repo for this approach.
    * NB: Omitting a separator entirely (like `helloworld`) does work, but becomes unreadable for longer exercise names.
    * It's not yet been confirmed whether breaking from convention in this way will cause problems elsewhere in the Exercism ecosystem, and in either case breaking from convention will require special handling for tools that assume the convention (such as comparing exercises against problem-specifications).
2. Keep with the convention of using directory names like `hello-world`. Within `exercises/hello-world`, have a `hello_world` module, which would be located in `exercises/hello-world/hello_world` and uses `module hello_world` and `import hello_world` as  usual.
    * See `exercises/hello-world-nest` in this repo for this approach. If this approach is taken, of course in the final track repo this would instead be called `exercises/hello-world`, containing `exercises/hello-world/hello_world`.
    * This seems like a less-good experience for a student of this track, since there is a seemingly-unnecessary level of nesting in directory structure, beyond the one directory per exercise.
3. Keep with the convention of using directory names like `hello-world`. Use `module main`.
    * See `exercises/hello-world-main-mod` for this approach. If this approach is taken, of course in the final track repo this would instead be called just `exercises/hello-world`.
    * This doesn't appear to have either of the problems of the above. It keeps with Exercism convention and doesn't introduce any unnecessary nesting.
    * Only concern here is the documentation stating `fn main()` declaration can be skipped in one file programs which might mean it cannot be skipped in multi-file programs - since we don't have a `fn main()`, perhaps we thus cannot have multi-file programs.

Other attempts were tested unsuccessfully:

* Using no `module` nor `import` lines at all
    * in this case, the functions to be tested cannot be found
    * See `exercises/helloworldnomod`
* Having the module name not match the directory name
    * in this case, the module then cannot be found
    * See `exercises/hello-world-mismatched`, in which the module is named `hello_world_mismatched`, using underscores instead of hyphens.
* Trying to use a hyphenated module name anyway
    * in this case, then `error: cannot import multiple modules at a time` on the `import hello-world` line.
    * See `exercises/hello-world`

Please see [CI results](https://github.com/petertseng/exercism-v/actions?query=workflow%3ATests+branch%3Amaster) to see all attempts resulting from the cartesian product of various testing scripts vs exercise directory structures.

Since this is only a report of what has been tried so far, a future maintainer should feel free to consider new ways to solve the above problem.
For example, maybe in the future V will allow hyphens in module names.
Or, a future maintainer has an idea that was not covered above.
