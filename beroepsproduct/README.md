# Haskell Project

This repository contains standalone Haskell files. This README explains the prerequisites and how to run the files.

---

## Prerequisites

Before running the files, make sure you have the following installed:

1. [GHCup](https://www.haskell.org/ghcup/) – the Haskell toolchain installer
2. [Visual Studio Code](https://code.visualstudio.com/) – recommended editor
3. [Haskell extension for VSCode](https://marketplace.visualstudio.com/items?itemName=haskell.haskell) – adds Haskell support in VSCode

---

## How to Run

Since the files are individual Haskell scripts, you can run them using the command:

```bash
runghc fileName.hs
```

> **Note:**
> You can also use:
>
> ```bash
> runhaskell fileName.hs
> ```
>
> The difference between `runhaskell` and `runghc` is that `runghc` allows **GHC options**, which can customize compilation and runtime behavior.
>
> **Example:**
>
> ```bash
> ghc -Werror MyFile.hs
> ```
>
> This treats all warnings as errors.
>
> To see more options, run:
>
> ```bash
> ghc --help
> ```

---

## Additional Tips

* For best experience, open the project in VSCode and make sure the Haskell extension is enabled.
* Use `runghc` for quick execution of scripts, and `ghc` for compiling files into binaries.
