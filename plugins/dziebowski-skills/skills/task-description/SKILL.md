---
name: task-description
description: Write or refine the body of a development task for a tracker (goal, user story, acceptance criteria) as a description of the outcome, cut down to a single slice. Use when the user asks to describe, write up or improve a task; when you are about to create a task in a tracker (ClickUp, GitLab, GitHub); or when another skill needs a task body.
---

# Opis zadania

Treść zadania opisuje **wynik**: co jest prawdą po wykonaniu zadania, widziane z zewnątrz. Sposób dojścia wybiera wykonawca; ustalenia techniczne z rozmowy dostają własną, osobną sekcję. Jedno zadanie to jeden **wycinek** (vertical slice): jedno obserwowalne zachowanie z przypadkami brzegowymi, od wejścia do efektu, w rozmiarze jednego MR do przejrzenia.

Ten skill wytwarza tylko treść. Gałęzie, zapis do trackera i workflow należą do innych skilli.

## Kroki

1. **Zbierz.** Weź wszystko, co opisuje zadanie: rozmowę, wklejony tekst, a gdy dostajesz link lub `CU-<id>`, samo zadanie z trackera (tylko odczyt). Przeczytaj konwencje projektu (CLAUDE.md, AGENTS.md); zob. *Konwencje projektu*. W repozytorium wyślij subagenta po fakty: obszar zmiany, słownictwo domeny, istniejące moduły i testy, szacunek rozmiaru zmiany. Gdy zachodzi któryś warunek z *Powiązań*, przeczytaj [`REGULATED.md`](REGULATED.md). Gotowe, gdy znasz zachowanie, jego odbiorcę i obowiązujące konwencje.
2. **Wytnij wycinek.** Nazwij zachowania, które niesie materiał, i zastosuj *Rozmiar zadania*. Przy więcej niż jednym wycinku ułóż listę w kolejności realizacji i kontynuuj z pierwszym. Gotowe, gdy masz jeden wycinek mieszczący się we wszystkich limitach.
3. **Napisz** tytuł i sekcje według *Tytułu zadania* i *Sekcji*. Szczegóły techniczne z rozmowy przenieś do *Notatek do implementacji*, a ich cel wyraź w kryterium.
4. **Sprawdź** każde kryterium wszystkimi testami z *Kryteriów akceptacji*, a cały wycinek limitami z *Rozmiaru zadania*. Kryterium, które oblewa test, przepisz albo usuń. Gotowe, gdy każde kryterium przechodzi każdy test.
5. **Dostarcz** według *Wyniku*. Fakty sprawdzaj sam; decyzje, których nie da się ustalić (odbiorca, korzyść, granica zakresu, czy zadanie dotyka bezpieczeństwa), oznacz w treści jako `?` i zadaj w notatce jedną numerowaną paczką, każde pytanie z rekomendacją. Po odpowiedziach popraw treść i dostarcz ją ponownie.

## Rozmiar zadania

Limity są twarde; przekroczenie któregoś oznacza podział, bez pytania o zgodę:

- Od 1 do 5 kryteriów. Szóste kryterium oznacza drugi wycinek. Jedno kryterium wystarcza, gdy niesie całe zachowanie (często w `fix`); nigdy nie dopisuj kryterium dla liczby.
- Każde kryterium dotyczy zachowania tego wycinka. Zachowanie **niezależne**, które da się dostarczyć i sprawdzić bez pozostałych, to osobny wycinek.
- Zachowanie bez odbiorcy w tym wycinku (obsługę przypadku, którego nic jeszcze nie wyzwala) przenieś do wycinka, który wprowadza jego odbiorcę.
- Zadanie dotykające więcej niż jednej domeny (`scope`) podziel według domen.
- Nowy moduł zaczyna się od **pocisku smugowego** (tracer bullet): moduł istnieje, ma publiczny interfejs i niesie jedno najprostsze zachowanie od wejścia do efektu, z testem. Każdy kolejny wycinek dodaje jedno zachowanie (obsługę błędów, kolejny tryb, konfigurację).
- W repozytorium: szacunek powyżej ~400 zmienionych linii, razem z testami, oznacza podział.

Sygnał, by jeszcze raz przyjrzeć się wycinkowi: 3 lub więcej kryteriów `TEST:`. Każde oznacza kod testu, więc razem zwykle zdradzają dwa zachowania w jednym zadaniu.

Przy podziale dostarcz listę wycinków (nazwa i jedno zdanie, w kolejności realizacji) i pełną treść tylko pierwszego. Pozostałe opisz na prośbę.

## Tytuł zadania

Rdzeń tytułu pochodzi ze skilla `task-title` (rdzeń, typ, pytanie kontrolne). Prefiksy wokół rdzenia dodaj według konwencji projektu; domyślnie Conventional Commits:

`<type>[(<scope>)][!]: [CU-<id>] <rdzeń>`

- `scope` to domena funkcjonalna systemu (`sensor`, `comm`, `power`); nazwa pliku czy warstwy się nie nadaje. Gdy nie wynika z materiału, zaproponuj ją w notatce.
- Wstaw `[CU-<id>]`, gdy ID jest znane; zadanie jeszcze nieutworzone ma tytuł bez niego.
- `type` według `cliff.toml` projektu; domyślnie `feat`, `fix`, `refactor`, `perf`, `docs`, `test`, `build`, `ci`, `chore`. `!` oznacza zmianę niekompatybilną.
- `fix`, gdy kod miał robić X i robił to źle. `feat`, gdy ma robić Y zamiast X, także gdy stare zachowanie było świadomą decyzją (wtedy często `feat!`).

## Sekcje

### Cel

1–2 zdania: jaki problem lub potrzeba istnieje dziś i dlaczego to zadanie go rozwiązuje. W sekwencji wycinków jedno zdanie o miejscu tego wycinka na ścieżce. W `fix`: obecne i oczekiwane zachowanie, w kategoriach odbiorcy („Faktura z rabatem pokazuje sumę o 0,01 wyższą niż suma jej pozycji; powinna być jej równa”).

### Historyjka

Jedna historyjka: „Jako [rola] chciałbym, aby [zachowanie], co umożliwi mi [korzyść].” Po angielsku: "As a [role], I want [behaviour], so that [benefit]." Rola to aktor z domeny: użytkownik, terapeuta, urządzenie, inny węzeł systemu, developer. Zachowanie i korzyść językiem domeny („pomiar temperatury”, „wykrycie, że węzeł żyje”). Jedno zdanie; dłuższa historyjka niesie materiał na kryteria albo notatki.

### Kryteria akceptacji

Kryterium to zdanie w czasie teraźniejszym opisujące **obserwowalny stan końcowy**. Testy, które przechodzi każde kryterium:

1. **Pytanie tak/nie.** Zdanie zamienia się w pytanie „Czy …?” bez dodawania informacji, a odpowiedź „tak” albo „nie” da się ustalić.
2. **Obserwowalne z zewnątrz.** Opisuje to, co widzi odbiorca: użytkownik, urządzenie, inny węzeł, developer uruchamiający build. Nazwy funkcji, plików, wątków, opcji konfiguracji i struktur danych należą do *Notatek do implementacji*.
3. **Technologia jako kontrakt.** Technologia, format czy interfejs pojawia się, gdy jest częścią wyniku, kontraktem zewnętrznym: protokół z innym węzłem, format czytany przez inne narzędzie, wersja platformy, na której ma działać build. Test: czy ktoś spoza implementacji zauważyłby zamianę tej technologii na inną?
4. **Wyróżniające.** Kryterium dotyczy tego zadania: byłoby fałszywe dla każdego innego zadania i jest fałszywe przed wykonaniem tego. „Build przechodzi”, „testy przechodzą”, „dokumentacja zaktualizowana” opisują każdą zmianę; ogólne kryterium staje się wyróżniające, gdy nazywa konkret („Instrukcja serwisowa opisuje procedurę kalibracji czujnika”).
5. **Konkretne wartości**, gdy są rdzeniem zachowania: okres, próg, wektor testowy, limit.

Marker `TEST:` poprzedza kryterium, które przed zamknięciem MR jest pokryte testem automatycznym uruchamianym lokalnie i w CI. Stawiaj go przy kluczowych zachowaniach domeny: logice, algorytmach, stanach krytycznych. Kryterium sprawdzane ręcznie albo przeglądem zostaje bez markera. Zadanie `feat` lub `fix` bez żadnego `TEST:` zgłoś w notatce jako decyzję do potwierdzenia.

W `fix` co najmniej jedno kryterium opiera się na przypadku, który dziś odtwarza błąd: konkretne wejście lub warunki i poprawny wynik. Jest fałszywe przed poprawką, więc z założenia jest wyróżniające, i zwykle niesie `TEST:` jako test regresji. Gdy materiał nie daje przypadku odtwarzającego, oznacz go jako `?` i zapytaj o niego w notatce.

Przykłady, pary przed → po:

- „Priorytet wątku komunikacji ustawiony w Kconfig” → do *Notatek do implementacji*; kryterium nie niesie wyniku.
- „Moduł wywołuje `crc32c()` na buforze ramki” → „TEST: Każdy heartbeat niesie poprawne CRC-32C (wektor "123456789" → E3069283)”.
- „Build działa” → usunięte; nie jest wyróżniające.
- „Poprawione zaokrąglanie w liczeniu sumy” → „TEST: Faktura z pozycjami 10,00 i 5,00 i rabatem 15% pokazuje sumę 12,75”.
- „TEST: Koder ramek obsługuje wszystkie wzorce, a nadajnik odrzuca ramkę w trakcie nadawania” → dwa zachowania, dwa wycinki.

### Poza zakresem

Opcjonalna. Gdy granica nie jest oczywista, zwłaszcza w sekwencji wycinków: zachowania, których czytelnik mógłby się tu spodziewać, a które dostarczą inne zadania.

### Notatki do implementacji

Opcjonalna. Ustalenia techniczne z rozmowy, których wykonawca potrzebuje, a nie wyczyta łatwo z repozytorium: konfiguracja sprzętu, ograniczenia platformy, decyzje projektowe podjęte w rozmowie; w `fix` przyczyna błędu, gdy jest znana, oznaczona jako potwierdzona albo podejrzewana. Lista punktowana ustaleń; kolejność kroków i plan pracy powstają w trakcie implementacji.

### Bezpieczeństwo

Domyślnie włączona, warunkowa: obecna, gdy zadanie dotyka funkcji bezpieczeństwa, środka kontroli ryzyka albo elementu SOUP. Nazywa ten element i wymaganą weryfikację. Gdy z materiału nie wynika, czy zadanie dotyka czegoś takiego, zapisz to jako `Do potwierdzenia: …` (w języku treści, po angielsku `To confirm: …`) i zapytaj w notatce. Projekt może wyłączyć sekcję (zob. *Konwencje projektu*).

### Powiązania

Obecna tylko w projekcie regulowanym. Przeczytaj [`REGULATED.md`](REGULATED.md), gdy:

- CLAUDE.md projektu deklaruje traceability (SLR, SI, SU) albo własną listę funkcji bezpieczeństwa lub ryzyk,
- użytkownik podał identyfikator SLR, SI, SU lub ryzyka.

## Konwencje projektu

CLAUDE.md projektu nadpisuje domyślne ustawienia tego skilla. Może:

- dodać sekcje do treści zadania; wypełniaj je według konwencji, podając tylko znane identyfikatory,
- wyłączyć Conventional Commits albo zmienić format tytułu,
- zmienić próg rozmiaru zmiany,
- oznaczyć projekt jako niezwiązany z bezpieczeństwem, co wyłącza sekcję *Bezpieczeństwo*,
- ustalić język treści; bez takiej konwencji treść jest w języku rozmowy.

## Wynik

W języku rozmowy, w tej kolejności:

1. **Wycinki** (tylko przy podziale): numerowana lista, nazwa i jedno zdanie każdy.
2. **Tytuł zadania**: jedna linia z prefiksami, w bloku kodu.
3. **Opis**: blok markdown z nagłówkami `##` w tej kolejności: Cel, Historyjka, Kryteria akceptacji, Poza zakresem, Notatki do implementacji, Bezpieczeństwo, Powiązania. Nagłówki w języku treści (po angielsku: Goal, User story, Acceptance criteria, Out of scope, Implementation notes, Safety, Links). Sekcje opcjonalne tylko wtedy, gdy mają treść.
4. **Notatka** (poza blokami, nie do trackera): pytanie kontrolne tytułu; przy poprawianiu istniejącego zadania krótka lista, co się zmieniło i dlaczego; numerowane decyzje do podjęcia, z rekomendacjami.

Gdy ten skill wywołał inny skill, zwróć tylko tytuł, opis i decyzje do podjęcia.
