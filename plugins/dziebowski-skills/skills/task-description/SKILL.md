---
name: task-description
description: Write or refine the body of a development task for a tracker (goal with the role that benefits, acceptance criteria) as a description of the outcome, cut down to a single slice. Use when the user asks to describe, write up or improve a task; when you are about to create a task in a tracker (ClickUp, GitLab, GitHub); or when another skill needs a task body.
---

# Opis zadania

Treść zadania opisuje **wynik**: co jest prawdą po wykonaniu zadania, widziane z zewnątrz. Sposób dojścia wybiera wykonawca; ustalenie techniczne trafia do treści tylko wtedy, gdy jest wymaganiem, i wtedy jest kryterium. Treść opisuje wyłącznie to zadanie: nie zapowiada innych zadań i nie wylicza, czego zadanie nie robi. Jedno zadanie to jeden **wycinek** (vertical slice): jedno obserwowalne zachowanie z przypadkami brzegowymi, od wejścia do efektu u odbiorcy, w rozmiarze jednego MR do przejrzenia.

Ten skill wytwarza tylko treść. Gałęzie, zapis do trackera i workflow należą do innych skilli.

## Kroki

1. **Zbierz.** Weź wszystko, co opisuje zadanie: rozmowę, wklejony tekst, a gdy dostajesz link lub ID zadania, samo zadanie z trackera (tylko odczyt). Przeczytaj konwencje projektu (CLAUDE.md, AGENTS.md); zob. *Konwencje projektu*. W repozytorium, gdy obszaru lub rozmiaru zmiany nie da się ustalić z rozmowy, wyślij subagenta po fakty: obszar zmiany, słownictwo domeny, istniejące moduły i testy, szacunek rozmiaru zmiany. Gdy zachodzi któryś warunek z *Projektu regulowanego*, przeczytaj [`REGULATED.md`](REGULATED.md). Gotowe, gdy znasz zachowanie, jego odbiorcę i obowiązujące konwencje.
2. **Wytnij wycinek.** Nazwij zachowania, które niesie materiał, i zastosuj *Rozmiar zadania*. Gdy materiał niesie więcej niż jeden wycinek, wybierz ten, od którego trzeba zacząć, i opisz tylko jego. Pozostałego materiału nie dziel na wycinki, nie układaj w kolejności i nie opisuj: zgłoś go w notatce według *Wydzielonego materiału*. Gotowe, gdy masz jeden wycinek mieszczący się we wszystkich limitach.
3. **Napisz** tytuł i sekcje według *Tytułu zadania* i *Sekcji*. Ustalenie techniczne z rozmowy, które jest wymaganiem (zmienia to, co zostanie dostarczone, albo wiąże sposób wykonania), zapisz jako kryterium, najlepiej przez jego obserwowalny skutek. Ustalenie, które jest tylko podpowiedzią sposobu, pomiń. W projekcie związanym z bezpieczeństwem zastosuj *Projekt związany z bezpieczeństwem*. Przy poprawianiu istniejącego zadania nic z oryginału nie znika po cichu: każda informacja (linki, załączniki, ustalenia z komentarzy) trafia do którejś sekcji, na listę relacji albo na listę zmian w notatce jako usunięta, z powodem.
4. **Sprawdź** każde kryterium wszystkimi testami z *Kryteriów akceptacji*, a cały wycinek limitami z *Rozmiaru zadania*. Kryterium, które oblewa test, przepisz albo usuń. Sprawdź też spójność tytułu z kryteriami: odpowiedź „tak” na pytanie kontrolne tytułu wynika z kryteriów wziętych razem. Gdy nie wynika, popraw tytuł albo kryteria, zależnie od tego, które rozmija się z wycinkiem. Gotowe, gdy każde kryterium przechodzi każdy test, a kryteria odpowiadają na pytanie kontrolne.
5. **Dostarcz** według *Wyniku*. Fakty sprawdzaj sam; fakt, którego nie da się sprawdzić (brak dostępu, treść załącznika, nieznany adres), oznacz w treści jako `?` i zapytaj o niego w notatce z prefiksem „Fakt:”. Kryterium z `?` w miejscu wartości to poprawny szkic do czasu odpowiedzi. Decyzje, których nie da się ustalić (odbiorca, korzyść, granica zakresu, a w projekcie związanym z bezpieczeństwem także to, czy zadanie dotyka bezpieczeństwa), oznacz w treści jako `?` i zadaj w notatce jedną numerowaną paczką, każde pytanie z rekomendacją. Fakty i decyzje idą w tej samej liście. Po odpowiedziach popraw treść i dostarcz ją ponownie.

## Rozmiar zadania

Limity są twarde; przekroczenie któregoś oznacza podział, bez pytania o zgodę:

- Od 1 do 5 kryteriów. Szóste kryterium oznacza drugi wycinek. Jedno kryterium wystarcza, gdy niesie całe zachowanie (często w `fix`); nigdy nie dopisuj kryterium dla liczby.
- Każde kryterium dotyczy zachowania tego wycinka. Zachowanie **niezależne**, które ma własnego odbiorcę i da się je dostarczyć i sprawdzić bez pozostałych, to osobny wycinek.
- Wycinek prowadzi od wejścia do efektu u odbiorcy, także przez kilka komponentów lub węzłów (nadawca i odbiorca protokołu, obraz buildu i job CI, który go używa). Część ścieżki, którą da się sprawdzić tylko harnessem testowym, nie jest osobnym wycinkiem.
- Zachowanie bez odbiorcy w tym wycinku (obsługę przypadku, którego nic jeszcze nie wyzwala) przenieś do wycinka, który wprowadza jego odbiorcę. Tak samo przypadek brzegowy: reakcja na sytuację, którą tworzy dopiero inne zachowanie (odrzucenie żądania w trakcie nawiązywania połączenia), należy do wycinka, który wprowadza to zachowanie.
- Zadanie dotykające więcej niż jednej domeny (`scope`) podziel według domen.
- Nowy moduł zaczyna się od **pocisku smugowego** (tracer bullet): moduł istnieje, ma publiczny interfejs i niesie jedno najprostsze zachowanie od wejścia do efektu u odbiorcy, z testem. Tylko gdy pełne zachowanie rzeczywiście przekracza limity, skróć zachowanie, nie ścieżkę; zachowanie mieszczące się w limitach zostaje w całości. Każdy kolejny wycinek dodaje jedno zachowanie (obsługę błędów, kolejny tryb, konfigurację).
- W repozytorium: szacunek powyżej ~400 zmienionych linii, razem z testami, oznacza podział.

Sygnał, by jeszcze raz przyjrzeć się wycinkowi: 3 lub więcej kryteriów `TEST:`. Każde oznacza kod testu, więc razem zwykle zdradzają dwa zachowania w jednym zadaniu.

### Wydzielony materiał

Skill opisuje jedno zadanie. Materiał, który nie zmieścił się w wybranym wycinku, jest punktem wyjścia do osobnej dyskusji o kolejnym zadaniu, a nie częścią tej odpowiedzi. W notatce wymień go krótko, słowami materiału („konsola: STATUS, SENSOR”, „watchdog”, „dioda statusu”), tak by nic nie zginęło po cichu. Bez podziału na wycinki, kolejności, tytułów i opisów: to powstanie w dyskusji o tamtym zadaniu. Treść tego zadania nie odwołuje się do wydzielonego materiału.

## Tytuł zadania

Rdzeń tytułu (rdzeń, typ, pytanie kontrolne) wyznacz skillem [`task-title`](../task-title/SKILL.md); jego zasad tu nie powtarzaj. Prefiksy wokół rdzenia dodaj według konwencji projektu; domyślnie Conventional Commits:

`<type>[(<scope>)][!]: <rdzeń>`

- `scope` to domena funkcjonalna systemu (`sensor`, `comm`, `power`); nazwa pliku czy warstwy się nie nadaje. Gdy nie wynika z materiału, wstaw w tytule zaproponowaną domenę i zgłoś ją w notatce do potwierdzenia. Zadanie infrastrukturalne bez domeny funkcjonalnej (CI, obraz buildu, zależności) ma tytuł bez scope, chyba że projekt definiuje scope dla infrastruktury.
- ID zadania pojawia się w tytule tylko wtedy, gdy konwencja projektu określa jego format i miejsce (np. `[CU-<id>]` przed rdzeniem); wstaw je, gdy jest znane, a zadanie jeszcze nieutworzone ma tytuł bez niego. Bez takiej konwencji tytuł nie ma ID i nie pytaj o nie.
- `type` według `cliff.toml` projektu; domyślnie `feat`, `fix`, `refactor`, `perf`, `docs`, `test`, `build`, `ci`, `chore`. `!` oznacza zmianę niekompatybilną.
- `fix`, gdy kod miał robić X i robił to źle. `feat`, gdy ma robić Y zamiast X, także gdy stare zachowanie było świadomą decyzją (wtedy często `feat!`).
- Gdy wynik nazwany w tytule (albo typ) zależy od otwartej decyzji, tytuł zakłada rekomendowaną odpowiedź, a notatka podaje numer decyzji, od której zależy.

## Sekcje

### Cel

1–2 zdania, które razem nazywają:

- **rolę**: kto odczuwa efekt zadania. Aktor z domeny: użytkownik, terapeuta, urządzenie, inny węzeł systemu, developer. To ten sam odbiorca, z którego perspektywy pisane są kryteria.
- **problem lub potrzebę**, którą ta rola ma dziś,
- **korzyść**, jaką rola zyskuje po wykonaniu zadania.

Rola, potrzeba i korzyść językiem domeny („pomiar temperatury”, „wykrycie, że węzeł żyje”), nie implementacji. W `fix` problemem jest obecne zachowanie, a korzyścią oczekiwane. Cel dłuższy niż dwa zdania niesie materiał na kryteria. Rola jest obowiązkowa w każdym typie zadania; gdy nie wynika z materiału, wstaw `?` i zapytaj w notatce.

Przykłady:

- `feat`: „RCU nie wie dziś, czy SMM działa. Okresowy heartbeat od SMM pozwoli RCU wykryć awarię SMM w ciągu kilku sekund.”
- `fix`: „Księgowa widzi na fakturze z rabatem sumę o 0,01 wyższą niż suma jej pozycji; suma powinna być jej równa.”
- `build`: „Developer musi dziś ręcznie instalować toolchain, żeby zbudować firmware. Obraz buildu pozwoli mu zbudować firmware jednym poleceniem, tak samo lokalnie i w CI.”

Forma historyjki (user story), „Jako [rola] chcę, aby [zachowanie], co umożliwi mi [korzyść]”, jest dopuszczalnym zapisem celu, gdy oddaje też dzisiejszy problem albo gdy wymaga jej konwencja projektu.

### Kryteria akceptacji

Kryterium to zdanie w czasie teraźniejszym opisujące **obserwowalny stan końcowy**. Testy, które przechodzi każde kryterium:

1. **Pytanie tak/nie.** Zdanie zamienia się w pytanie „Czy …?” bez dodawania informacji, a odpowiedź „tak” albo „nie” da się ustalić.
2. **Obserwowalne z zewnątrz.** Opisuje to, co widzi odbiorca: użytkownik, urządzenie, inny węzeł, developer uruchamiający build. Nazwy funkcji, plików, wątków, opcji konfiguracji i struktur danych nie pojawiają się w kryterium; gdy stoi za nimi wymaganie, kryterium nazywa jego skutek (okres, opóźnienie, zachowanie pod obciążeniem).
3. **Technologia jako kontrakt.** Technologia, format, interfejs czy ograniczenie pojawia się, gdy jest wymaganiem: kontraktem zewnętrznym (protokół z innym węzłem, format czytany przez inne narzędzie, wersja platformy, na której ma działać build) albo ograniczeniem narzuconym z zewnątrz (budżet pamięci, wymagana biblioteka). Takie kryterium bywa sprawdzane przeglądem. Test: czy ktoś spoza implementacji zauważyłby albo odrzucił zamianę na inną?
4. **Wyróżniające.** Kryterium dotyczy tego zadania: byłoby fałszywe dla każdego innego zadania i jest fałszywe przed wykonaniem tego. „Build przechodzi”, „testy przechodzą”, „dokumentacja zaktualizowana” opisują każdą zmianę; ogólne kryterium staje się wyróżniające, gdy nazywa konkret („Instrukcja serwisowa opisuje procedurę kalibracji czujnika”).
5. **Konkretne wartości**, gdy są rdzeniem zachowania: okres, próg, wektor testowy, limit.

Marker `TEST:` poprzedza kryterium, które przed zamknięciem MR jest pokryte testem automatycznym uruchamianym lokalnie i w CI. Stawiaj go przy kluczowych zachowaniach domeny: logice, algorytmach, stanach krytycznych. Kryterium sprawdzane ręcznie albo przeglądem zostaje bez markera. Zadanie `feat` lub `fix` bez żadnego `TEST:` zgłoś w notatce jako decyzję do potwierdzenia.

W `fix` co najmniej jedno kryterium opiera się na przypadku, który dziś odtwarza błąd: konkretne wejście lub warunki i poprawny wynik. Jest fałszywe przed poprawką, więc z założenia jest wyróżniające, i zwykle niesie `TEST:` jako test regresji. Gdy materiał nie daje przypadku odtwarzającego, oznacz go jako `?` i zapytaj o niego w notatce.

Przykłady, pary przed → po:

- „Priorytet wątku komunikacji ustawiony w Kconfig” → „Heartbeat wychodzi co 1 s ± 10 ms także przy pełnym obciążeniu łącza”, gdy za priorytetem stoi wymaganie czasowe; usunięte, gdy był tylko podpowiedzią sposobu.
- „Moduł wywołuje `crc32c()` na buforze ramki” → „TEST: Każdy heartbeat niesie poprawne CRC-32C (wektor "123456789" → E3069283)”.
- „Build działa” → usunięte; nie jest wyróżniające.
- „Poprawione zaokrąglanie w liczeniu sumy” → „TEST: Faktura z pozycjami 10,00 i 5,00 i rabatem 15% pokazuje sumę 12,75”.
- „TEST: Koder ramek obsługuje wszystkie wzorce, a nadajnik odrzuca ramkę w trakcie nadawania” → dwa zachowania, każde z własnym odbiorcą, więc dwa wycinki.

## Relacje

Powiązania z innymi zadaniami, wymaganiami, MR-ami czy dokumentami nie są częścią treści: tracker (ClickUp, GitLab, GitHub) trzyma je jako natywne relacje. Skill zwraca je osobno, jako listę relacji do ustawienia: rodzaj relacji (np. blokuje, zależy od, realizuje wymaganie) i cel (ID, link albo nazwa). Linki z oryginału przy poprawianiu zadania też trafiają na tę listę, chyba że są częścią kryterium.

## Projekt regulowany

Przeczytaj [`REGULATED.md`](REGULATED.md), gdy:

- CLAUDE.md projektu deklaruje traceability (SLR, SI, SU) albo własną listę funkcji bezpieczeństwa lub ryzyk,
- użytkownik podał identyfikator SLR, SI, SU lub ryzyka.

## Projekt związany z bezpieczeństwem

Dotyczy projektu, którego CLAUDE.md deklaruje związek z bezpieczeństwem albo traceability (zob. *Konwencje projektu*), oraz sytuacji, gdy użytkownik podał identyfikator ryzyka lub funkcji bezpieczeństwa. W innych projektach pomiń tę część i nie pytaj o bezpieczeństwo.

Treść zadania nie ma osobnej sekcji o bezpieczeństwie. Gdy zadanie dotyka funkcji bezpieczeństwa, środka kontroli ryzyka albo elementu SOUP:

- Wymaganie bezpieczeństwa jest kryterium. Środek kontroli ryzyka dostaje kryterium skuteczności, nie obecności: sytuacja niebezpieczna na wejściu i reakcja na wyjściu („TEST: Po 3 s bez heartbeatu RCU odcina zasilanie silnika”).
- Nowy element SOUP albo zmiana wersji istniejącego to kryterium sprawdzane przeglądem („Biblioteka X 2.1 ma ocenę i wpis na liście SOUP projektu”).
- Identyfikator funkcji bezpieczeństwa lub ryzyka trafia na listę *Relacji*, gdy projekt je prowadzi.

Środka kontroli ryzyka nie dziel między wycinki. Wykrycie i reakcja (np. przejście w stan bezpieczny) idą razem, bo dopiero razem tworzą środek, którego skuteczność da się zweryfikować. Gdy całość nie mieści się w limitach *Rozmiaru zadania*, uprość sam środek (np. najprostsza reakcja), zamiast odcinać reakcję.

Gdy z materiału nie wynika, czy zadanie dotyka bezpieczeństwa, zadaj to pytanie w notatce jako decyzję z rekomendacją.

## Konwencje projektu

CLAUDE.md projektu nadpisuje domyślne ustawienia tego skilla. Może:

- dodać sekcje do treści zadania; wypełniaj je według konwencji, podając tylko znane identyfikatory,
- wyłączyć Conventional Commits albo zmienić format tytułu,
- określić format ID zadania i jego miejsce w tytule,
- zmienić próg rozmiaru zmiany,
- zadeklarować związek projektu z bezpieczeństwem (np. wyrób medyczny), co włącza *Projekt związany z bezpieczeństwem*,
- ustalić język treści; bez takiej konwencji treść jest w języku rozmowy.

## Wynik

W języku rozmowy, w tej kolejności:

1. **Tytuł zadania**: jedna linia z prefiksami, w bloku kodu.
2. **Opis**: blok markdown z nagłówkami `##` w tej kolejności: Cel, Kryteria akceptacji. Nagłówki w języku treści (po angielsku: Goal, Acceptance criteria). Innych sekcji nie dodawaj, chyba że wymaga ich konwencja projektu.
3. **Relacje** (tylko gdy są): lista relacji do ustawienia w trackerze, poza blokiem opisu.
4. **Notatka** (poza blokami, nie do trackera): pytanie kontrolne tytułu; przy poprawianiu istniejącego zadania krótka lista, co się zmieniło i dlaczego, łącznie z tym, co usunięto z oryginału; jedna numerowana lista decyzji do podjęcia, z rekomendacjami, a w niej fakty do uzupełnienia z prefiksem „Fakt:”; wydzielony materiał (tylko przy podziale).
5. **Następne zadanie** (tylko przy wydzielonym materiale): jedno zdanie proponujące kolejną dyskusję, z rekomendacją, od którego elementu wydzielonego materiału zacząć. Po zgodzie użytkownika opisz to zadanie tym samym skillem, od kroku 1, z pozostałym materiałem jako wejściem.

Gdy ten skill wywołał inny skill, zwróć tylko tytuł, opis, relacje, decyzje do podjęcia i wydzielony materiał; o kolejnym zadaniu decyduje wywołujący.
