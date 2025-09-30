# Documentatie

| Student       | Jamiro Aliet     |
| ------------- | ---------------- |
| StudentNummer | 2135216          |
| Docent        | Michel Koolwaaij |
| Course        | AAP              |
| Versie        | 1.1              |
| Datum         | 9/19/2025        |

## Inhoudsopgave

1. [Inleiding](#inleiding)
2. [Onderzoek](#onderzoek)
3. [Challenge](#challenge)
4. [Implementatie](#implementatie)
5. [Reflectie](#reflectie)
6. [Conclusie](#conclusie)
7. [Bronvermelding](#bronvermelding)

## Inleiding

x
Deze documentatie is gemaakt voor de "Tekstanalyse" opdracht.
De opdracht is om een "Tekstanalyse" programma te schrijven in een functionele programmer taal.
Je moet ook recursie en higher-order functions gebruiken.
Voor deze opdracht heb ik de taal **Haskell** gekozen.
De Opdracht kan je [hier](https://aim-cni.github.io/app/docs/Paradigma%20challenge/opdracht_functioneel_programmeren) terug vinden.

## Onderzoek

### Wat is een functionele programmeertaal

Haskell is een puur-functionele programmeertaal.
Een functionele programmeertaal is een programmeertaal die gebaseerd zijn op wiskundige functies.
Hierdoor

### Haskell

### Welke functionele concepten worden vaak gebruikt in haskell

## Challenge - Tekstanalyse

Omdat ik moeite had met een orgineele challenge verzinnen heb ik een challenge gepakt van [Voorbeelden van mogelijke challenges](https://aim-cni.github.io/app/docs/Paradigma%20challenge/opdracht_functioneel_programmeren).
De challenge die ik hieruit heb gekozen is de **tekstanalyse** challenge.
Bij de challenge moet je ook 2 functionele concepten koppelen. De concepten die bij deze challenge staan zijn: Higher-order-functions en Recursie.

### Higher-order-functions

Een higher-order-functions is een functie die een functie returned of een functie als parameter nodig heeft.
In haskell ziet dat er ongeveer zo uit

```haskell
applyFunction :: (Int -> Int) -> Int -> Int
applyFunction f x = f x
```

In deze code zie je een functie genaamd `applyFunction`.
Deze functie heeft een functie nodig die als parameter een `Int` nodig heeft en een `Int` returned. En de functie heeft een extra Int nodig. Dit kan je gemakkelijk zien door de `()` om de eerste 2 parameters. Die staan dus voor de paramater van de functie en de return waarde van de functie. De `()` is bedoeld voor het groeperen van de parameters.

Als je de functie wilt gebruiken moet je hem zo aanroepen:

```haskell
print (applyFunction anotherFunction 8)
```

Eerst roep je de functie `applyFunction` en daarna geef je de paramater `anotherFunction` en daarna de `Int` parameter.

### Recursie

Recursie is wanneer een functie zichzelf aanroept. Zie dit als een soort loop. In meeste programeer talen kan je problemen oplossen zonder recursie. En is de code makkelijker te testen en "Leesbaarder". Toch zijn er gevallen dat recursie handig kan zijn. Bijvoorbeeld voor een boomstructuur of recursive algorithmes.

Om er voor te zorgen dat de functie niet in een oneindige loop terecht komt moet je een **Base Case** hebben. Zodra de functie de **Base Case** Bereikt stopt de functie. Je moet ook niet vergeten om in de functie **Te werken naar de base case**. Anders blijft de functie nog steeds oneindig loopen.
Hier heb je een voorbeeld in java:

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

en in haskell:

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

## Implementatie

In dit hoofdstuk staat een korte samenvatting van de implementatie en gebruikte functionele concepten.

### Bestanden

In de map `beroepsproduct` vind je 5 bestanden.

- analysis.txt (Als de code is gerunt)
- example.txt
- WordFrequency.hs
- WordFrequencyNotReadable

TODO: CHANGE TXT FILES

#### analysis.txt

Dit bestand zie je staan als je de code hebt gerunt. In dit bestand staat de analyse van de text in `example.txt`.

#### example.txt

In dit bestand plaats je de tekst die je wilt laten analyseren door het haskell programma.

#### README.md

Hierin kan je vinden hoe je het bestand moet runnen.

#### WordFrequency.hs

Dit is de applicatie. Echter is deze code niet volledig zoals haskell code standaarden.
In Haskell wil je zoveel mogelijk variable namen versimpelen.
Een voorbeeld hiervan:

```Haskell
countCharInStrings :: Char -> [String] -> Int
countCharInStrings _ [] = 0
countCharInStrings c (s:ss) = countChar c s + countCharInStrings c ss
```

In dit stuk code ze je dat de parameters `c` en `(s:ss)` zijn genoemd.
In andere programmeer talen zou je dit snel al volledige namen geven.
De reden waarom dat in Haskell niet bij alle variable word gedaan is door de wiskundige achtergrond van de taal. In wiskundige notatie gebruik je ook niet volledige woorden maar: `E = mc^2`.

Echter heb ik in mijn eigen applicatie er voor gekozen om alles wel volledige namen te geven.
De reden hiervoor is dat ik dit leesbaarder vind.
Om een functionele taal te lezen zonder dat je het snapt is best een uitdaging.
Maar om te laten zien hoe 
### Functionele concepten

#### Recursie123

#### Higher-Order-Functions

## Reflectie

## Conclusie

## Bronvermelding

- Haskell Foundation. (n.d.). _Haskell_. Geraadpleegd op 19 september 2025, van https://www.haskell.org/

https://wiki.haskell.org/Why_Haskell_matters

https://wiki.haskell.org/index.php?title=Haskell

## QUICKNOTE

At the functions `countChar` and `countCharInStrings` you will see:
`countChar _ [] = 0`
the `_` stands for that it does not matter what character will be given, and the [] stands for an emty list.
So this lines says "If the list is empty then return 0".
