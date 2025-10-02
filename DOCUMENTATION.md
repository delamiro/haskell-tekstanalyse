# Documentatie

| Student       | Jamiro Aliet     |
| ------------- | ---------------- |
| StudentNummer | 2135216          |
| Docent        | Michel Koolwaaij |
| Course        | AAP              |
| Versie        | 1.1              |
| Datum         | 9/19/2025        |

## Inhoudsopgave

- [1. Inleiding](#1-inleiding)
- [2. Onderzoek](#2-onderzoek)
  - [2.1 Haskell](#21-haskell)
  - [2.2 Functionele concepten in haskell](#22-functionele-concepten-in-haskell)
    - [2.2.1](#221-pure-functies)
    - [2.2.1](#222-unmutability)
    - [2.2.1](#223-first-class-functies)
    - [2.2.1](#224-higer-order-functies)
    - [2.2.1](#225-recursie)
    - [2.2.1](#226-lazy-evaluation)
- [3. Challenge](#3-challenge---tekstanalyse)
  - [3.1 Higher-Order-Functions](#31-higher-order-functions)
  - [3.2 Recursie](#32-recursie)
- [4. Implementatie](#4-implementatie)
  - [4.1 Bestanden](#41-bestanden)
  --TODO, pas dit aan zodra files vast staan
    - [4.1.1 Analysis.txt](#411-analysistxt)
  - [4.2 Functionele-concepten](#42-functionele-concepten)
    - [4.2.1 Recursie - toegepast](#421-recursie---toegepast)
    - [4.2.2 Higher-order-functions - toegepast](#422-higher-order-functions---toegepast)
- [5. Reflectie](#5-reflectie)
  - [5.1 Recursie](#51-recursie)
  - [5.2 Higher-Order-functions](#52-higher-order-functions)
- [6. Conclusie](#6-conclusie)
- [7. Bronvermelding](#7-bronvermelding)

## 1. Inleiding

Deze documentatie is gemaakt voor de "[Paradigma challenge](https://aim-cni.github.io/app/docs/category/paradigma-challenge)" opdracht voor het vak [AAP](https://aim-cni.github.io/app/docs/category/course-info-app).
Voor deze challenge mocht je een eigen verzonnen challenge verzinnen of een al verzonnen challenge kiezen.
Het doel van de opdracht is om kennis te maken met **Functioneel programmeren**.
En om **Functionele concepten** te leren gebruiken zoals **Recursie**.

## 2. Onderzoek

### 2.1 Haskell

> "Express your ideas clearly and learn a new way of thinking about programming. Based on lambda calculus Haskell is a purely functional programming language that features referential transparency, immutability and lazy evaluation. Concepts that will blow your mind — relearn programming while having an absolute blast."
> — [Haskell.org](https://www.haskell.org/)

Haskell is een puur functionele programmeertaal. Dit betekent dat alle functies `pure` zijn en geen `side effects` hebben, ze wijzigen geen *global state* of doen iets onverwachts. Bij dezelfde input krijg je altijd dezelfde output. Dit maakt testen en begrijpen van je code eenvoudig.

Belangrijke concepten zoals *referential transparency*, *immutability* en *lazy evaluation* maken Haskell zeer betrouwbaar en expressief. Complexe algoritmes kunnen duidelijk en beknopt worden geschreven, zonder verborgen gedrag.

Door deze eigenschappen wordt Haskell vaak gebruikt in domeinen waar correctheid cruciaal is, zoals compilerbouw, financiële systemen en wetenschappelijke berekeningen.

Haskell daagt je uit om anders te denken over programmeren: precies, declaratief en elegant.

### 2.2 Functionele concepten in haskell

In haskell zijn de belangerijkste functionele concepten:

- Pure functies
- ummutability
- First-class functies
- Higher-order functies
- recursie
- lazy evaluation

#### 2.2.1 Pure functies

Een pure functie is een functie zonder bijwerkingen.
Deze functies hebben altijd hetzelfde resultaat bij dezelfde input.

```Haskell
add x y = x + y
add 2 3 -- altijd 5
```

#### 2.2.2 Unmutability

Waarden veranderen niet. In plaats van dat je de bestaande waarde aanpast maak je een nieuwe waarde aan

```Haskell
x = 9
y = x + 1 -- x zal
```

#### 2.2.3 First-class functies

Functies zijn eerste-klasse burgers: je kunt ze opslaan in variabelen, doorgeven als argumenten, of teruggeven uit andere functies.

```Haskell
applyTwice f x = f (f x)
applyTwice (+3) 10  -- geeft 16
```

#### 2.2.4 Higer-order functies

Functies die andere functies nemen als argument of een functie teruggeven.

```Haskell
map (+1) [1,2,3]  -- geeft [2,3,4]
```

#### 2.2.5 Recursie

In plaats van loops gebruikt Haskell recursie om herhaling te implementeren.

```Haskell
factorial 0 = 1
factorial n = n * factorial (n-1)
```

#### 2.2.6 Lazy evaluation

Berekeningen worden pas uitgevoerd als ze echt nodig zijn.

```Haskell
take 5 [1..]  -- geeft [1,2,3,4,5]
```

## 3. Challenge - Tekstanalyse

Omdat ik moeite had met een orgineele challenge verzinnen heb ik een challenge gepakt van [Voorbeelden van mogelijke challenges](https://aim-cni.github.io/app/docs/Paradigma%20challenge/opdracht_functioneel_programmeren).
De challenge die ik hieruit heb gekozen is de **tekstanalyse** challenge.
Het doel van de challenge is om een programma te schrijven dat woord frequentie analyseert in een tekstbestand.
Hij moet dus een text bestand kunnen lezen, en vervolgens analyseren hoeveel woorden er in zitten.
Bij de challenge moet je ook 2 functionele concepten koppelen.
De concepten die bij deze challenge staan zijn: Higher-order-functions(HOF) en Recursie.

### 3.1 Higher-order-functions (HOF)

Een **HOF** is een functie die een functie returned of een functie als parameter nodig heeft.
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

In Haskell heb je al een aantal **HOF**, dit zijn: `map`,`filter`,`sum`

### 3.2 Recursie

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

## 4 Implementatie

In dit hoofdstuk staat een korte samenvatting van de implementatie en gebruikte functionele concepten.

### 4.1 Bestanden

In de map `beroepsproduct` vind je 5 bestanden.

- README.md
- TextAnalysis.hs
- Analysis.txt
- TextToAnalyse.txt
- BetterTextAnalysis.hs

TODO: CHANGE TXT FILES

#### 4.1.1 README.md

In de README.md staat wat je allemaal nodig hebt en moet doen om deze code te runnen.
Dit zijn dingen die ik aanraad, als je een andere manier volgt kan ik niet garanderen dat de code werkt dus lees de README.md goed.

#### 4.1.2 TextAnalysis.hs

Dit is de applicatie. Echter is deze code niet volledig zoals haskell code standaarden.
In Haskell wil je zoveel mogelijk variable namen versimpelen.
Een voorbeeld hiervan is:

```Haskell
countCharInStrings :: Char -> [String] -> Int
countCharInStrings _ [] = 0
countCharInStrings c (s:ss) = countChar c s + countCharInStrings c ss
```

In dit voorbeeld zijn de parameters `c` en `(s:ss)` genoemd.
In andere programmeertalen zou men vaak meer beschrijvende namen gebruiken.

Echter heb ik in mijn eigen applicatie er voor gekozen om alles wel volledige namen te geven.
De reden hiervoor is dat ik dit leesbaarder vind.
De reden dat Haskell vaak kortere namen gebruikt, komt door de wiskundige oorsprong van de taal. Net zoals in wiskundige notaties, waar je bijvoorbeeld E = mc^2 gebruikt in plaats van lange beschrijvingen, worden in Haskell veel variabelen kort en symbolisch benoemd.
Om een functionele taal te leren is best lastig, en variable volledige namen te geven helpt enorm.

De applicatie analyseerd het bestand `TextToAnalyse.txt`.
In de analyse kan je terug vinden:

- Hoeveel characters er in de text zit
- Hoeveel woorden de text heeft
- Hoeveel unique woorden de text heeft
- Hoevaal een specifiek character is gebruikt (als je het programma runt krijg je een prompt om een char in te vullen om te analyseren)
- De de dubbele character count. (Dit was om te laten zien dat ik een **HOF** kan toepassen maar niet heel usefull in deze code)



#### 4.1.1 analysis.txt

Dit bestand zie je staan als je de code hebt gerunt. In dit bestand staat de analyse van de text in `example.txt`.

#### 4.1.2 example.txt

In dit bestand plaats je de tekst die je wilt laten analyseren door het haskell programma.

#### 4.1.3 README.md

Hierin kan je vinden hoe je het bestand moet runnen.

#### 4.1.4 WordFrequencyNotReadable.hs

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

### 4.2 Functionele concepten

#### 4.2.1 Recursie - Toegepast

In `WordFrequency.hs` kan je recursie zien bij de functies: `countUniqueWords` en `countCharInString` en `countCharInStringList`.
Al deze functies roepen zichzelf weer aan.

#### 4.2.2 Higher-Order-Functions - Toegepast

In `WordFrequency.hs` is de functie `doubleCharCount` een higher-order-function.
Dit kan je zien aandat het om een functie vraagt in de parameter.

## 5. Reflectie

Tijdens deze opdracht heb ik gebruik gemaakt van: `Higher-order-functions` en `Recursie`.

### 5.1 Recursie

In het begin vond ik `recursie` een apart idee, In een objectgeoriënteerde taal (OOP) kan je recursie bijna altijd herschrijven zodat het leesbaarder is.
In het begin was ik ook bang dat recursie lastig te lezen en begrijpen zou zijn omdat het iets minder leesbaar is.
Maar na het programmeren van deze opdracht zie ik in dat recursie soms echt heel handig kan zijn.
En na twee minuten kan je echt wel recursie lezen.
Ik denk ook dat in vorige projecten bepaalde problemen die ik had best gemakkelijk opgelost konden worden door het gebruiken van recursie.
Ik denk dat ik recursie ook dus in de toekomst ga meenemen en gebruiken in toekomstige projecten

### 5.2 Higher-order-functions

Voor het maken van dit rapport wou ik eigenlijk zeggen dat ik weinig nut zag in `Higher-order-functions`.
Ik heb al mijn "problemen" tijdens deze challenge opgelost met recursie.
Ik kon me ook niks voorstellen waarvoor je een functie als parameter zou willen meegeven.
En ik wou dit gedeelte van het rapport ook gebruiken om te klagen over `Higher-order-functions`.
Maar, tijdens het maken van dit rapport ben ik ergens achtergekomen waardoor ik snap waarom je het wel zou willen gebruiken.

Ik wist niet dat de functies zoals `map`, `filter` en `(.)` ook `Higher-order-functions` zijn.
Ik heb wel kort over ze gelezen maar ik snapte ook niet helemaal hoe deze functies gebruikt moesten worden.
Dus heb ik alles zelf proberen te programmeren, wat voor het leren van de taal en functioneel programmeren top was.
Maar de code is ook vrij inefficient.
Als ik `Higher-order-functions` had gebruikt was mijn code compacter,leesbaarder en efficienter geworden.

Een voorbeeld hiervan:

```Haskell
countUniqueWords :: [String] -> Int
countUniqueWords [] = 0
countUniqueWords (firstWord:restOfTheWords)
    | firstWord `elem` restOfTheWords = countUniqueWords restOfTheWords
    | otherwise = 1 + countUniqueWords restOfTheWords
```

Deze functie in `WordFrequency.hs` telt de unique woorden in een lijst van strings.
Ik heb aan chatGPT gevraagd hoe hij deze functie beter zou maken.

```text
countUniqueWords :: [String] -> Int
countUniqueWords [] = 0
countUniqueWords (firstWord:restOfTheWords)
    | firstWord `elem` restOfTheWords = countUniqueWords restOfTheWords
    | otherwise = 1 + countUniqueWords restOfTheWords

how would you make this function better
```

En hij gaf 3 problemen aan.

1. elem is O(n) en word gecalled bij ieder woord dus de complexiteit van de functie is ongeveer O(n²).
2. Recursie is niet nodig, haskell heeft eigen libary functies die het meer **idiomatically** kunnen doen.
3. Case sensitivity word genegeerd ("hello" en "Hello" zijn 2 verschillende woorden).

hij gaf eigenlijk 2 opties om dit te fixen.

- gebruik `nub`, de functie blijft O(n²) maar is compacter en leesbaarder

```Haskell
import Data.List (nub)
import Data.Char (toLower)

countUniqueWords :: [String] -> Int
countUniqueWords = length . nub . map (map toLower)
```

- gebruik `Data.Set`, is O(n log n)

```Haskell
import qualified Data.Set as Set
import Data.Char (toLower)

countUniqueWords :: [String] -> Int
countUniqueWords = Set.size . Set.fromList . map (map toLower)
```

En beide oplossingen worden compacter gemaakt door `Higher-order-functions` en `Data.Set` is zelf efficienter.
Ook na dat ik heb gekeken welke HOFS er allemaal zijn, heb ik een veel beter idee gekregen met waarom je het zou gebruiken.
En wanneer je ze zou willen toepassen.

De les van deze challenge: Voortaan beter onderzoek doen naar dingen die ik niet snap

## 6. Conclusie

## 7. Bronvermelding

- Haskell Foundation. (n.d.). Haskell. Geraadpleegd op 19 september 2025, van https://www.haskell.org/

https://wiki.haskell.org/Why_Haskell_matters

https://wiki.haskell.org/index.php?title=Haskell

## QUICKNOTE

At the functions `countChar` and `countCharInStrings` you will see:
`countChar _ [] = 0`
the `_` stands for that it does not matter what character will be given, and the [] stands for an emty list.
So this lines says "If the list is empty then return 0".
