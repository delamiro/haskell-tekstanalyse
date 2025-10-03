# Documentatie

| Student       | Jamiro Aliet     |
| ------------- | ---------------- |
| StudentNummer | 2135216          |
| Docent        | Michel Koolwaaij |
| Course        | AAP              |
| Versie        | 1.3              |
| Datum         | 9/19/2025        |

## Inhoudsopgave

- [1. Inleiding](#1-inleiding)
- [2. Onderzoek](#2-onderzoek)
  - [2.1 Haskell](#21-haskell)
  - [2.2 Functionele concepten in haskell](#22-functionele-concepten-in-haskell)
    - [2.2.1 Pure functies](#221-pure-functies)
    - [2.2.1 Unmutability](#222-unmutability)
    - [2.2.1 First-class-functies](#223-first-class-functies)
    - [2.2.1 Higher-order-functies](#224-higer-order-functies)
    - [2.2.1 Recursie](#225-recursie)
    - [2.2.1 Lazy evaluation](#226-lazy-evaluation)
- [3. Challenge - tekstanalyse](#3-challenge---tekstanalyse)
  - [3.1 Higher-Order-Functions (HOF)](#31-higher-order-functions-hof)
  - [3.2 Recursie](#32-recursie)
- [4. Implementatie](#4-implementatie)
  - [4.1 Bestanden](#41-bestanden)
    - [4.1.1 README.md](#411-readmemd)
    - [4.1.2 TextAnalysis.hs](#412-textanalysishs)
    - [4.1.3 Analysis.txt](#413-analysistxt)
    - [4.1.4 TextToAnlyse.txt](#414-texttoanalysetxt)
    - [4.1.5 BetterTextAnalysis.hs](#415-bettertextanalysishs)
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

Haskell is een puur functionele programmeertaal. Dit betekent dat alle functies `pure` zijn en geen `side effects` hebben, ze wijzigen geen _global state_ of doen iets onverwachts. Bij dezelfde input krijg je altijd dezelfde output. Dit maakt testen en begrijpen van je code eenvoudig.

Belangrijke concepten zoals _referential transparency_, _immutability_ en _lazy evaluation_ maken Haskell zeer betrouwbaar en expressief. Complexe algoritmes kunnen duidelijk en beknopt worden geschreven, zonder verborgen gedrag.

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

In `TextAnalysis.hs` Is iedere functie uitgelegd met commentaar waar nodig.

In de `README.md` staat hoe je de code kan runnen.

#### 4.1.3 Analysis.txt

Dit bestand zie je staan als je de code hebt gerunt. In dit bestand staat de analyse van de text in `TextToAnalyse.txt`.

#### 4.1.4 TextToAnalyse.txt

In dit bestand plaats je de tekst die je wilt laten analyseren door het haskell programma.

#### 4.1.5 BetterTextAnalysis.hs

Tijdens het schrijven van dit document ben ik er achter gekomen dat ik **HOF**'s niet goed genoeg begrepen heb.
Dit komt later in het hoofdstuk [5.2 Higher-Order-Functions](#52-higher-order-functions) terug en ga ik nu niet te diep op in.
Maar de reden waarom ik dit benoem is omdat de code in `TextAnalysis.hs` optimaler kan.
Ook heb ik met niet volledig gehouden aan de code conventies voor Haskell.
Toch was ik ergens nieuwsgierig naar hoe mijn applicatie er uit zou zien in optimale Haskell code.
Dus heb ik mijn code van `TextAnalysis.hs` aan chatgpt gegeven met als vraag of hij dit kon optimaliseren.
En chatgpt kwam terug met de code die nu in `BetterTextAnalysis.hs` staat.
In de code heb ik wel de 2 functies verwijderd die wel in het orginele bestand stonden.
Namelijk: `doubleCharCount` en `multiplyByTwo`.
Deze functies waren er alleen maar om aan te toonen dat ik wist wat een **HOF** was en deden verder niks bijzonders.

Als je `TextAnalysis.hs` en `BetterTextAnalysis.hs` naast elkaar houdt zie je een aantal verschillen.

Het eerste verschil is dat `BetterTextAnalysis.hs` een import gebruikt namelijk: `import Data.List (nub)`.
Deze import is voor de functie nub.
Deze functie zit niet standaard in Haskell zoals bijvoorbeeld `filter`.
`nub` is een functie die alle duplicates uit de lijst haalt.

In `TextAnalysis.hs` zie je dat ik problemen met recursie heb opgelost, Terwijl in `BetterTextAnalysis.hs` functies gebruikt worden die standaard geimporteed zijn in ieder haskell bestand.
De functies die worden gebruikt zijn:

- **filter**: is een HOF die een lijst filtert, heeft wel een functie nodig om te weten op wat die moet filteren.
- **sum**: telt alle getallen in een lijst bij elkaar op.
- **map**: is ee HOF die een functie uitvoert op ieder element van een lijst.

Doordat deze standaard geimporteerde functies gebruikt worden hoeven we ook geen _Basecase_ bij onze functies meer te zetten.
Dit scheelt 3 regels.

Verder zie je ook dat in `analyzeText` niet alles in een aparte variable word gestopt,
Maar alles in `contents` word berekend.
De reden waarom ik dit had gedaan in het bestand `TextAnalysis.hs` is omdat ik het op 2 plekken nodig had.
En dat is wel een goede reden om het dus in een variable te stoppen.
Maar nog steeds wel intressant om te zien dat ze het niet in aparte variable stoppen.

In `BetterTextAnalysis.hs` zie je ook dat er gebruik word gemaakt van **(.)**.
Een voorbeeld hiervan is in de functie countCharInStringList :

```haskell
countCharInStringList :: Char -> [String] -> Int
countCharInStringList c = sum . map (countCharInString c)
```

De **(.)** zorgt ervoor dat je functies kan chainen.
Het voert de functies uit van rechts naar links.
In dit voorbeeld zie je dat het 2 functies chained, maar je zou meerder functies met elkaar kunnen chainen.

Door deze code te lezen en begrijpen kwam ik er vrij snel achter dat `filter` en `map` beide HOF functies zijn.
Door hoe je deze functies gebruikt is voor mij het concept van HOF's veel duidelijker geworden.
Ik ben ook blij dat ik dit document hebt laten genereren

In de `README.md` staat hoe je de code kan runnen.

### 4.2 Functionele concepten

#### 4.2.1 Recursie - Toegepast

In `TextAnalysis.hs` kan je recursie zien bij de functies: `countUniqueWords` en `countCharInString` en `countCharInStringList`.
Al deze functies roepen zichzelf weer aan.

#### 4.2.2 Higher-Order-Functions - Toegepast

In `TextAnalysis.hs` is de functie `doubleCharCount` een **HOF**.
Dit kan je zien aandat het om een functie vraagt in de parameter.

En in `BetterTextAnalysis.hs` heb ik gebruik gemaakt van _filter_ en _map_. Dat zijn beide **HOF's**

## 5. Reflectie

### 5.1 Recursie

In het begin vond ik `recursie` een apart idee, In een objectgeoriënteerde taal (OOP) kan je recursie bijna altijd herschrijven zodat het leesbaarder is.
In het begin was ik ook bang dat recursie lastig te lezen en begrijpen zou zijn omdat het iets minder leesbaar is.
Maar na het programmeren van deze opdracht zie ik in dat recursie soms echt heel handig kan zijn.
En na twee minuten kan je echt wel recursie lezen.
Ik denk ook dat in vorige projecten bepaalde problemen die ik had best gemakkelijk opgelost konden worden door het gebruiken van recursie.
Ik denk dat ik recursie ook dus in de toekomst ga meenemen en gebruiken in toekomstige projecten.

### 5.2 Higher-order-functions

Voor het maken van dit rapport wou ik eigenlijk zeggen dat ik weinig nut zag in **HOF's**.
Ik heb al mijn "problemen" tijdens deze challenge opgelost met recursie.
Ik kon me ook niks voorstellen waarvoor je een functie als parameter zou willen meegeven.
En ik wou dit gedeelte van het rapport ook gebruiken om te klagen over **HOF's**.
Maar, tijdens het maken van dit rapport ben ik ergens achtergekomen waardoor ik snap waarom je het wel zou willen gebruiken.

Ik wist niet dat de functies zoals `map`, `filter` en `(.)` ook **HOF's** zijn.
Ik heb wel kort over ze gelezen maar ik snapte ook niet helemaal hoe deze functies gebruikt moesten worden.
Dus heb ik alles zelf proberen te programmeren, wat voor het leren van de taal en functioneel programmeren top was.
Maar de code is ook vrij inefficient.
Als ik **HOF's** had gebruikt was mijn code compacter,leesbaarder , efficienter en meer Haskell idiomatic geworden.

Een voorbeeld hiervan:

```Haskell
countUniqueWords :: [String] -> Int
countUniqueWords [] = 0
countUniqueWords (firstWord:restOfTheWords)
    | firstWord `elem` restOfTheWords = countUniqueWords restOfTheWords
    | otherwise = 1 + countUniqueWords restOfTheWords
```

Deze functie in `TextAnalysis.hs` telt de unique woorden in een lijst van strings.
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

En beide oplossingen worden compacter gemaakt door **HOF's** en `Data.Set` is zelf efficienter.
Door te kijken naar hoe `filter` gebruikt word snap ik nu veel beter waarom en wanneer je een **HOF** gebruikt.

De les van deze challenge: Voortaan beter onderzoek doen naar dingen die ik niet snap

## 6. Conclusie

Voor het maken van deze opdracht had ik geen idee hoe functioneel-programmeren werkte,
En wist ik het nut van `recursie` en `higher-order-funcions` niet.

Na het maken van deze opdracht snap ik nu de krachten van functioneel-programmeren,
Hoe je `recursie` en `higher-order-functions` nuttig toe kan passen,
en heb ik geleerd wat voor nuttige dingen haskell kan doen.

En wat ik ook heb geleerd van deze opdracht is om beter documentatie te lezen.
Dit had mij denk ik best veel moeite bespaard door dat ik alles nu **recursief** heb opgelost
In plaats van met **HOF's**.
Maar aan de andere kant, doordat ik alles **recursief** heb opgelost heb ik recusie goed geleerd.

## 7. Bronvermelding

- HaskellWiki. (2024, 3 mei). _Why Haskell matters_. Geraadpleegd van [https://wiki.haskell.org/Why_Haskell_matters](https://wiki.haskell.org/Why_Haskell_matters)

- HaskellWiki. (z.d.). _Haskell_. Geraadpleegd van [https://wiki.haskell.org/index.php?title=Haskell](https://wiki.haskell.org/index.php?title=Haskell)

- AIM-CNI. (z.d.). _Course info APP_. Geraadpleegd van [https://aim-cni.github.io/app/docs/category/course-info-app](https://aim-cni.github.io/app/docs/category/course-info-app)

- OpenAI. (2025). _ChatGPT (GPT-5) [Large language model]_. Geraadpleegd op 3 oktober 2025 van [https://chat.openai.com]
