# Haskell text analyse project

This project is a school assesment to learn a functional programming language.
I chose **Haskell** because i wanted to challenge myself since this is the __most functional__ language.

## Prerequisites

To run these files you need to install 3 things:

1. [GHCup](https://www.haskell.org/ghcup/)
2. [VsCode](https://code.visualstudio.com/)
3. [VsCode Haskell extension](https://marketplace.visualstudio.com/items?itemName=haskell.haskell)

### GHCup

**GHCup** is a version manager for the Haskell toolchain. when you are installing **GHCup** you also will download:

- **GHC** Haskell compiler
- **cabal** Haskell package manager
- **Haskell Language** Server the language server for Haskell. It provides
completion, inline errors, code actions etc. in supporting editors (e. g. VSCode)

> **Important**  
> When installing you need to say you want to install all these things. So look carefull during installation!!!

### VsCode

This is the text editor that i will use. When there is a instruction on how to run a file, it will be assumed that you are using this editor.

### VsCode Haskell extension

Highlights syntax and will color your haskell code properly. This makes coding easier and more readable.

## The school assignment

The school assignment is to make a *textanalyse* application that wordfrequentie analysed in a text file.

I also need to use recursion and higher order functions.

### What is recursion?

Recursion is when a function calls itself. To make it so that the function will not be a infinite loop, it has a **Base Case**. If the **Base case** is true then the recursion stops. It also has to work towards the **Base case** so you need to **Make progress**.  This is a example in Java code:

```java
public void countdown(int startNumber){
    // Base case: stop when startNumber reaches 0
    if(n <= 0){
        System.out.println("Done!");
        return;
    }
    System.out.println(n);
    // Make progress and recursive call: it grabs startNumber -1 aka it counts down
    countdown(startNumber - 1);
}
```

In most casses you can rewrite or rethink the code in a way where you don't need recursive functions. However in **functional** programming languages recursion is the default way to solve problems.

```haskell
countdown :: Int -> IO ()
countdown n =
    if n <= 0 then
        putStrLn "Done!"          
        -- base case
    else do
        print n                   
        countdown (n - 1)         -- recursive call

```

This is the same countdown function but in haskell.
The structure looks the same, you start with a **Base case**, **Make progress** and then it works.

### What are higher-order functions?

A higher-order function is a function that operates on other functions. it can take them as an input, return them or both.

```haskell
applyFunction :: (Int -> Int) -> Int -> Int
applyFunction f x = f x
```

In this code you see a function called `applyFunction`. It needs a function that takes an int and returns int `(Int -> Int)`

` -> Int -> Int` also takes an Int and returns a Int
So `applyFunction takes a function as input and applies it to a number.

`applyFunction f x = f x`
`f` is the function we pass in
`x` is the number we want to apply `f` to
`applyFunction` calls `f` with `x`

If you want to use this for a print you can call it like

```Haskell
print (applyFunction anotherFunction 8)
```

First you call `applyFunction` then give it the paramater `anotherFunction` and the int paramater (8 is used as the example).
