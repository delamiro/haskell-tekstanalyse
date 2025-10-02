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

### Haskell

> "Express your ideas clearly and learn a new way of thinking about programming. Based on lambda calculus Haskell is a purely functional programming language that features referential transparency, immutability and lazy evaluation. Concepts that will blow your mind — relearn programming while having an absolute blast."  
> — [Haskell.org](https://www.haskell.org/)

Haskell is een puur functionele taal.
Dit houd in dat alle functies "puur" zijn en geen `side effects` hebben.
Denk bij `side effects` aan een global state die veranderd.
In Haskell hebben functies met dezelfde input altijd dezelfde output. Je kan dus alles gemakkelijk van elkaar testen.

Haskell is anders dan andere functionele talen door **Lazy evaluation** en **lambda calculus**.

#### Lazy evaluation

Haskell doet pas een berekening uitvoeren wanneer deze echt nodig is.
Een voorbeeld is dat je een **oneindige** lijst kan maken in haskell. zonder dat het vast loopt.

Als je in python een oneindige lijst aan maakt en daarna de eerste 5 wilt returnen, loopt python vast.

Als je dit in haskell doet die dit wel omdat hij de rest nooit uitrekent.

#### lambda calculus

Lambda calculus is een wiskundige manier om berekeningen met functies te beschrijven.

```Haskell
\x -> x + 1
```

Dit is een functie die een getal neemt en er 1 bij optelt. Als je deze toepast op 5:

```Haskell
(\x -> x + 1) 5  -- geeft 6
```

Lambda calculus is de basis van functionele talen zoals haskell.

### Welke functionele concepten worden vaak gebruikt in haskell

In haskell zijn de belangerijkste functionele concepten:

- Pure functies
- ummutability
- First-class functies
- Higher-order functies
- recursie
- lazy evaluation

#### Pure functies

Een pure functie is een functie zonder bijwerkingen.
Deze functies hebben altijd hetzelfde resultaat bij dezelfde input.

```Haskell
add x y = x + y
add 2 3 -- altijd 5
```

#### Unmutability

Waarden veranderen niet. In plaats van dat je de bestaande waarde aanpast maak je een nieuwe waarde aan

```Haskell
x = 9
y = x + 1 -- x zal
```

#### First-class functies

Functies zijn eerste-klasse burgers: je kunt ze opslaan in variabelen, doorgeven als argumenten, of teruggeven uit andere functies.

```Haskell
applyTwice f x = f (f x)
applyTwice (+3) 10  -- geeft 16
```

#### Higer-order functies

Functies die andere functies nemen als argument of een functie teruggeven.

```Haskell
map (+1) [1,2,3]  -- geeft [2,3,4]
```

#### Recursie

In plaats van loops gebruikt Haskell recursie om herhaling te implementeren.

```Haskell
factorial 0 = 1
factorial n = n * factorial (n-1)
```

#### Lazy evaluation

Berekeningen worden pas uitgevoerd als ze echt nodig zijn.

```Haskell
take 5 [1..]  -- geeft [1,2,3,4,5]
```

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

In Haskell heb je al een aantal higher-order-functions, dit zijn: `map`,`filter`,`sum`

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

- analysis.txt
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

TODO kijk of dit wel de juiste functie is

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
Om een functionele taal te leren is best lastig, en variable volledige namen te geven helpt enorm.

#### WordFrequencyNotReadable.hs

TODO: Bespreek met docent over chatgpt code

Omdat ik zelf nieuwsgierig was naar hoe mijn code eruit zou zien als ik alles volgens de code conventies zou houden,
En hoe klein mijn code zou zijn als ik alles optimaal zou schrijven.
Heb ik dit bestand gemaakt.
Dit is mijn beroepsproduct maar dan zo "haskell-idiomatic" geschreven als het maar kan.
Bij dit bestand heb ik wel 2 functies verwijderd die wel in `WordFrequency.hs` zitten.
Namelijk: `doubleCharCount` en `multiplyByTwo`.
Deze functies (zoals ik ook heb beschreven in het code commentaar) zijn totaal niet nodig voor deze applicatie,
En zijn eigenlijk alleen maar geschreven zodat ik kon aantonen dat ik een Higher-Order-Functie kan schrijven.

Zelf vind ik het wel intressant hoe klein het programma echt kan worden.
Dit bestand is precies **35** lines lang.

### Functionele concepten

#### Recursie - Toegepast

In `WordFrequency.hs` kan je recursie zien bij de functies: `countUniqueWords` en `countCharInString` en `countCharInStringList`.
Al deze functies roepen zichzelf weer aan.

#### Higher-Order-Functions - Toegepast

## Reflectie

Tijdens deze opdracht heb ik gebruik gemaakt van: `Higher-order-functions`,`Recursie` en `pure functies`.

-- TODO: fix dit na gesprek met docent
Zelf vind ik `Higher-order-functions` heel apart en irritant om mee te werken.

In het begin vond ik recursie een apart idee, In een objectgeoriënteerde taal (OOP) kan je recursie bijna altijd herschrijven zodat het leesbaarder is.
In het begin was ik ook bang dat recursie lastig te lezen en begrijpen zou zijn omdat het iets minder leesbaar is.
Maar na het programmeren van deze opdracht zie ik in dat recursie soms echt heel handig kan zijn.
En na twee minuten kan je echt wel recursie lezen.
Ik denk ook dat in vorige projecten bepaalde problemen die ik had best gemakkelijk opgelost konden worden door het gebruiken van recursie.
Ik denk dat ik recursie ook dus in de toekomst ga meenemen en gebruiken in toekomstige projecten

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
