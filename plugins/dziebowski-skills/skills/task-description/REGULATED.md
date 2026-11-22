# Projekt regulowany

Część skilla [`task-description`](SKILL.md) dla projektów wymagających traceability (np. według IEC 62304) albo prowadzących własną listę funkcji bezpieczeństwa i ryzyk. Rozszerza sekcje *Powiązania* i *Bezpieczeństwo*; konwencja projektu (identyfikatory, placeholdery, format) nadpisuje ten plik.

## Powiązania

Jedna linia w opisie:

`SLR: <id> · SI: <id> · SU: <id>`

- **SLR** (System Level Requirement): wymaganie systemowe, z którego wynika zadanie. Zawsze obecne.
- **SI** (Software Item): element oprogramowania, gdy zmiana dotyczy całego modułu lub komponentu.
- **SU** (Software Unit): jednostka oprogramowania, gdy zmiana dotyczy wyodrębnionej jednostki wewnątrz modułu.
- SI i SU razem, gdy zadanie tworzy nową SU w istniejącym SI.

Identyfikatory:

- Wpisuj tylko identyfikatory podane przez użytkownika albo odczytane z repozytorium lub trackera.
- Brakujący identyfikator istniejącego elementu zapisz jako `?` i zapytaj o niego w notatce. Taka luka w traceability zostaje widoczna w treści, dopóki ktoś jej nie zamknie.
- Element, który zadanie dopiero tworzy, dostaje placeholder z konwencji projektu (np. `PRJ-SU-????`). Numer nadaje się w trakcie implementacji, według zasad projektu.

Kilka SU w jednym zadaniu to sygnał rozmiaru, jak kilka domen: sprawdź, czy zadanie niesie jeden wycinek.

## Bezpieczeństwo

Sekcja nazywa to, czego zadanie dotyka, i wymaganą weryfikację:

- **Funkcja bezpieczeństwa** lub **środek kontroli ryzyka**: nazwa i identyfikator z analizy ryzyka projektu (gdy projekt ją prowadzi) oraz wpływ zmiany (nowy środek, zmiana istniejącego, zmiana jego otoczenia).
- **Element SOUP**: nowa biblioteka zewnętrzna albo zmiana wersji istniejącej. Nazwa, wersja, powód wyboru. Nowy element SOUP wymaga oceny i wpisu na listę SOUP projektu, zanim trafi do kodu.
- **Weryfikacja**: rodzaj (test jednostkowy, test integracyjny na sprzęcie, przegląd, analiza) i co dokładnie ma potwierdzić. Środek kontroli ryzyka dostaje weryfikację skuteczności, nie tylko obecności.

Gdy projekt prowadzi listę funkcji bezpieczeństwa lub ryzyk, porównaj z nią obszar zmiany, zanim uznasz, że zadanie nie dotyka bezpieczeństwa.
