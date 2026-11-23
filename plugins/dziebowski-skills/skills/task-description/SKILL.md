---
name: task-description
description: Write or refine the body of a development task for a tracker (goal with the role that benefits, acceptance criteria) as a description of the outcome, cut down to a single slice. Use when the user asks to describe, write up or improve a task; when you are about to create a task in a tracker (ClickUp, GitLab, GitHub); or when another skill needs a task body.
---

# Opis zadania

Skill wytwarza tytuł i treść jednego zadania oraz notatkę dla użytkownika. Treść opisuje **wynik** jednego **vertical slice**: co jest prawdą po wykonaniu zadania, widziane przez **odbiorcę**. Gałęzie, zapis do trackera i workflow należą do innych skilli.

## Pojęcia

- **Materiał**: wszystko, co opisuje zadanie: rozmowa, wklejony tekst, zadanie z trackera.
- **Zachowanie**: jedna obserwowalna reakcja systemu na wejście, z jej przypadkami brzegowymi.
- **Odbiorca**: aktor z domeny, który obserwuje zachowanie: użytkownik, terapeuta, urządzenie, inny węzeł systemu, developer.
- **Vertical slice**: jedno zachowanie od wejścia do efektu u odbiorcy, w rozmiarze jednego MR do przejrzenia. Jedno zadanie to jeden vertical slice.
- **Wymaganie**: ustalenie, którego zmianę zauważyłby albo odrzucił ktoś spoza implementacji: kontrakt zewnętrzny (protokół z innym węzłem, format czytany przez inne narzędzie, wersja platformy) albo ograniczenie narzucone z zewnątrz (budżet pamięci, wymagana biblioteka). Pozostałe ustalenia techniczne to **podpowiedzi**; wypadają z zadania, a notatka wymienia je jednym zdaniem.
- **Wydzielony materiał**: zachowania z materiału spoza wybranego vertical slice.
- **Otwarte pytanie**: **fakt**, którego nie da się sprawdzić samemu (brak dostępu, treść załącznika, nieznana wartość), albo **decyzja**, którą podejmuje użytkownik (odbiorca, korzyść, granica vertical slice), od której zależy treść zadania. W treści jego miejsce zajmuje `?`; treść z `?` to poprawny szkic.
- **Projekt związany z bezpieczeństwem**: CLAUDE.md projektu deklaruje związek z bezpieczeństwem albo traceability, albo użytkownik podał identyfikator ryzyka lub funkcji bezpieczeństwa.

## Kroki

1. **Zbierz** materiał; zadanie z trackera tylko czytaj. Przeczytaj konwencje projektu (CLAUDE.md, AGENTS.md). W repozytorium, gdy obszaru lub rozmiaru zmiany nie da się ustalić z rozmowy, wyślij subagenta po obszar zmiany, słownictwo domeny, istniejące moduły i testy oraz szacunek rozmiaru. Gdy CLAUDE.md deklaruje traceability (SLR, SI, SU) albo listę funkcji bezpieczeństwa lub ryzyk, albo użytkownik podał taki identyfikator, przeczytaj [`REGULATED.md`](REGULATED.md). Gotowe, gdy znasz zachowania, ich odbiorców i konwencje.
2. **Wytnij** vertical slice, od którego trzeba zacząć, według R1–R7 (i B3 w projekcie związanym z bezpieczeństwem). Pozostałe zachowania zostaw jako wydzielony materiał. Gotowe, gdy vertical slice spełnia wszystkie reguły R.
3. **Napisz** tytuł według T1–T6 i treść według C1–C4 i K1–K7. Każde wymaganie z materiału staje się kryterium; podpowiedzi pomiń. Przy poprawianiu istniejącego zadania każda informacja z oryginału (linki, załączniki, ustalenia z komentarzy) trafia do treści, na listę relacji albo na listę zmian w notatce jako usunięta, z powodem.
4. **Sprawdź** każde kryterium regułami K1–K5, vertical slice regułami R1–R7 i tytuł regułą T6. Kryterium, które łamie regułę, przepisz albo usuń. Gotowe, gdy każda reguła jest spełniona dla każdego kryterium.
5. **Dostarcz** według *Wyniku*. Po odpowiedziach na otwarte pytania popraw treść i dostarcz ją ponownie.

## Rozmiar vertical slice

Reguły są twarde: złamanie którejś oznacza podział, bez pytania o zgodę.

- **R1.** Vertical slice ma od 1 do 5 kryteriów; ich liczba wynika z zachowania. Jedno kryterium wystarcza, gdy niesie całe zachowanie (często w `fix`).
- **R2.** Vertical slice niesie jedno zachowanie. Zachowanie z własnym odbiorcą, które da się dostarczyć i sprawdzić bez pozostałych, to osobny vertical slice.
- **R3.** Vertical slice prowadzi od wejścia do efektu u odbiorcy, także przez kilka komponentów lub węzłów (nadawca i odbiorca protokołu; obraz buildu i job CI, który go używa). Fragment ścieżki sprawdzalny tylko harnessem testowym należy do vertical slice całej ścieżki.
- **R4.** Zachowanie albo przypadek brzegowy, którego sytuację tworzy dopiero inne zachowanie, należy do vertical slice tamtego zachowania (odrzucenie żądania w trakcie nawiązywania połączenia należy do vertical slice nawiązywania połączenia).
- **R5.** Vertical slice należy do jednej domeny (`scope`).
- **R6.** Nowy moduł zaczyna się od **tracer bullet**: moduł z publicznym interfejsem i jednym najprostszym zachowaniem od wejścia do efektu u odbiorcy, z testem. Zachowanie mieszczące się w R1–R7 wchodzi w całości; skracaj zachowanie, a ścieżkę zostaw pełną. Każdy kolejny vertical slice dodaje jedno zachowanie.
- **R7.** W repozytorium szacunek zmiany wynosi najwyżej ~400 linii, razem z testami.

Trzy lub więcej kryteriów `TEST:` to sygnał, że vertical slice niesie dwa zachowania: sprawdź go ponownie z R2.

Wydzielony materiał jest punktem wyjścia do osobnej dyskusji o kolejnym zadaniu. Notatka wymienia go słowami materiału („konsola: STATUS, SENSOR”, „watchdog”), bez podziału na vertical slices, kolejności, tytułów i opisów.

## Tytuł

- **T1.** Rdzeń tytułu, typ i pytanie kontrolne wyznacz skillem [`task-title`](../task-title/SKILL.md).
- **T2.** Format według konwencji projektu; domyślnie Conventional Commits: `<type>[(<scope>)][!]: <rdzeń>`.
- **T3.** `type` według `cliff.toml` projektu; domyślnie `feat`, `fix`, `refactor`, `perf`, `docs`, `test`, `build`, `ci`, `chore`. `fix`: kod miał robić X i robił to źle. `feat`: kod ma robić Y zamiast X, także gdy X było świadomą decyzją (wtedy często `feat!`). `!` oznacza zmianę niekompatybilną.
- **T4.** `scope` to domena funkcjonalna systemu (`sensor`, `comm`, `power`), nigdy plik ani warstwa. Domena, która nie wynika z materiału, jest decyzją: wstaw rekomendowaną. Zadanie infrastrukturalne (CI, obraz buildu, zależności) ma tytuł bez `scope`, chyba że projekt definiuje scope dla infrastruktury.
- **T5.** ID zadania występuje w tytule wyłącznie wtedy, gdy konwencja projektu określa jego format i miejsce (np. `[CU-<id>]` przed rdzeniem), i tylko gdy jest znane. Brak ID nie jest otwartym pytaniem.
- **T6.** Odpowiedź „tak” na pytanie kontrolne wynika z kryteriów wziętych razem. Tytuł zależny od decyzji zakłada rekomendowaną odpowiedź.

## Treść

Treść zawiera wyłącznie sekcje Cel i Kryteria akceptacji, plus sekcje wymagane konwencją projektu. Opisuje tylko ten vertical slice; granice z innymi zadaniami wyrażają relacje w trackerze.

### Cel

- **C1.** 1–2 zdania nazywające **rolę** (odbiorcę), jej dzisiejszy **problem lub potrzebę** i **korzyść** po wykonaniu zadania. Więcej zdań to materiał na kryteria.
- **C2.** Rola, potrzeba i korzyść w języku domeny („pomiar temperatury”, „wykrycie, że węzeł żyje”).
- **C3.** W `fix` problemem jest obecne zachowanie, a korzyścią oczekiwane.
- **C4.** Rola jest obowiązkowa w każdym typie zadania. Forma „Jako [rola] chcę, aby [zachowanie], co umożliwi mi [korzyść]” jest dopuszczalna, gdy oddaje też dzisiejszy problem albo wymaga jej konwencja projektu.

Przykłady:

- `feat`: „RCU nie wie dziś, czy SMM działa. Okresowy heartbeat od SMM pozwoli RCU wykryć awarię SMM w ciągu kilku sekund.”
- `fix`: „Księgowa widzi na fakturze z rabatem sumę o 0,01 wyższą niż suma jej pozycji; suma powinna być jej równa.”
- `build`: „Developer musi dziś ręcznie instalować toolchain, żeby zbudować firmware. Obraz buildu pozwoli mu zbudować firmware jednym poleceniem, tak samo lokalnie i w CI.”

### Kryteria akceptacji

Kryterium to zdanie w czasie teraźniejszym opisujące obserwowalny stan końcowy.

- **K1. Tak/nie.** Zdanie zamienia się w pytanie „Czy …?” bez dodawania informacji, a odpowiedź da się ustalić.
- **K2. Widziane przez odbiorcę.** Kryterium opisuje to, co obserwuje odbiorca. Wymaganie stojące za nazwą funkcji, pliku, wątku, opcji konfiguracji czy struktury danych wyraża przez skutek (okres, opóźnienie, zachowanie pod obciążeniem).
- **K3. Technologia tylko jako wymaganie.** Technologia, format, interfejs czy ograniczenie występuje w kryterium wtedy, gdy jest wymaganiem. Takie kryterium bywa sprawdzane przeglądem.
- **K4. Wyróżniające.** Kryterium jest fałszywe przed wykonaniem tego zadania i dla każdego innego zadania. Ogólne kryterium („build przechodzi”, „dokumentacja zaktualizowana”) staje się wyróżniające, gdy nazywa konkret („Instrukcja serwisowa opisuje procedurę kalibracji czujnika”).
- **K5. Konkretne wartości**, gdy są rdzeniem zachowania: okres, próg, wektor testowy, limit.
- **K6. `TEST:`** poprzedza kryterium pokryte przed zamknięciem MR testem automatycznym uruchamianym lokalnie i w CI. Stawiaj go przy kluczowych zachowaniach domeny: logice, algorytmach, stanach krytycznych. `feat` lub `fix` bez żadnego `TEST:` to decyzja.
- **K7. `fix`** ma co najmniej jedno kryterium oparte na przypadku, który dziś odtwarza błąd: konkretne wejście lub warunki i poprawny wynik, zwykle z `TEST:` jako test regresji. Brak takiego przypadku w materiale to fakt do uzupełnienia.

Przykłady, przed → po:

- „Priorytet wątku komunikacji ustawiony w Kconfig” → „Heartbeat wychodzi co 1 s ± 10 ms także przy pełnym obciążeniu łącza”, gdy za priorytetem stoi wymaganie czasowe; usunięte, gdy był podpowiedzią.
- „Moduł wywołuje `crc32c()` na buforze ramki” → „TEST: Każdy heartbeat niesie poprawne CRC-32C (wektor "123456789" → E3069283)”.
- „Build działa” → usunięte (K4).
- „Poprawione zaokrąglanie w liczeniu sumy” → „TEST: Faktura z pozycjami 10,00 i 5,00 i rabatem 15% pokazuje sumę 12,75”.
- „TEST: Koder ramek obsługuje wszystkie wzorce, a nadajnik odrzuca ramkę w trakcie nadawania” → dwa vertical slices (R2).

## Relacje

Powiązania z innymi zadaniami, wymaganiami, MR-ami i dokumentami tracker trzyma jako natywne relacje. Skill zwraca je jako listę relacji do ustawienia: rodzaj (blokuje, zależy od, realizuje wymaganie) i cel (ID, link albo nazwa). Linki z poprawianego zadania trafiają na tę listę, chyba że są częścią kryterium.

## Bezpieczeństwo

Dotyczy wyłącznie projektu związanego z bezpieczeństwem; w pozostałych projektach temat bezpieczeństwa nie pojawia się w odpowiedzi. Gdy zadanie dotyka funkcji bezpieczeństwa, środka kontroli ryzyka albo elementu SOUP:

- **B1.** Wymaganie bezpieczeństwa jest kryterium. Środek kontroli ryzyka dostaje kryterium skuteczności: sytuacja niebezpieczna na wejściu i reakcja na wyjściu („TEST: Po 3 s bez heartbeatu RCU odcina zasilanie silnika”).
- **B2.** Nowy element SOUP albo zmiana wersji istniejącego to kryterium sprawdzane przeglądem („Biblioteka X 2.1 ma ocenę i wpis na liście SOUP projektu”). Identyfikator ryzyka lub funkcji bezpieczeństwa trafia na listę relacji.
- **B3.** Środek kontroli ryzyka to jeden vertical slice: wykrycie i reakcja razem, bo dopiero razem dają skuteczność, którą da się zweryfikować. Gdy całość przekracza R1–R7, uprość środek (najprostsza reakcja) i zachowaj reakcję.

To, czy zadanie dotyka bezpieczeństwa, gdy nie wynika z materiału, jest decyzją.

## Konwencje projektu

CLAUDE.md projektu nadpisuje ustawienia domyślne. Może dodać sekcje treści (wypełniaj je według konwencji, tylko znanymi identyfikatorami), zmienić format tytułu albo wyłączyć Conventional Commits, określić format i miejsce ID zadania, zmienić próg R7, zadeklarować związek z bezpieczeństwem i ustalić język treści. Bez konwencji językowej treść jest w języku rozmowy.

## Wynik

W języku rozmowy, w tej kolejności:

1. **Tytuł**: jedna linia w bloku kodu.
2. **Opis**: blok markdown z nagłówkami `##` w języku treści: Cel, Kryteria akceptacji (po angielsku: Goal, Acceptance criteria).
3. **Relacje** (gdy są): lista poza blokiem opisu.
4. **Notatka** (nie do trackera):
   - pytanie kontrolne tytułu,
   - przy poprawianiu: lista zmian z powodami, łącznie z tym, co usunięto,
   - otwarte pytania: jedna numerowana lista, decyzje z rekomendacją, fakty z prefiksem „Fakt:”; pytanie, od którego zależy tytuł, ma przy tytule swój numer,
   - pominięte podpowiedzi (gdy są): jedno zdanie,
   - wydzielony materiał (gdy jest).
5. **Następne zadanie** (gdy jest wydzielony materiał): jedno zdanie proponujące kolejną dyskusję i element wydzielonego materiału, od którego zacząć. Po zgodzie użytkownika opisz to zadanie tym skillem od kroku 1.

Gdy ten skill wywołał inny skill, zwróć tytuł, opis, relacje, otwarte pytania i wydzielony materiał; o kolejnym zadaniu decyduje wywołujący.
