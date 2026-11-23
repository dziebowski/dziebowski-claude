# Projekt regulowany

Część skilla [`task-description`](SKILL.md) dla projektów wymagających traceability (np. według IEC 62304) albo prowadzących własną listę funkcji bezpieczeństwa i ryzyk. Rozszerza *Relacje* i *Projekt związany z bezpieczeństwem*; konwencja projektu (identyfikatory, placeholdery, format) nadpisuje ten plik.

## Relacje traceability

Identyfikatory nie trafiają do treści zadania; idą na listę *Relacji*, do ustawienia w trackerze:

- **SLR** (System Level Requirement): wymaganie systemowe, z którego wynika zadanie. Zawsze obecne.
- **SI** (Software Item): element oprogramowania, gdy zmiana dotyczy całego modułu lub komponentu.
- **SU** (Software Unit): jednostka oprogramowania, gdy zmiana dotyczy wyodrębnionej jednostki wewnątrz modułu.
- SI i SU razem, gdy zadanie tworzy nową SU w istniejącym SI.
- **Ryzyko lub funkcja bezpieczeństwa**: identyfikator z analizy ryzyka projektu, gdy zadanie dotyka funkcji bezpieczeństwa albo środka kontroli ryzyka.

Identyfikatory:

- Wpisuj tylko identyfikatory podane przez użytkownika albo odczytane z repozytorium lub trackera.
- Brakujący identyfikator istniejącego elementu zapisz na liście jako `?` i zapytaj o niego w notatce z prefiksem „Fakt:”. Lukę w traceability zgłaszasz, nie zgadujesz.
- Element, który zadanie dopiero tworzy, dostaje placeholder z konwencji projektu (np. `PRJ-SU-????`). Numer nadaje się w trakcie implementacji, według zasad projektu.

Kilka SU w jednym zadaniu to sygnał rozmiaru, jak kilka domen: sprawdź, czy zadanie niesie jeden wycinek.

## Weryfikacja

Rodzaj weryfikacji wynika z kryterium: `TEST:` oznacza test automatyczny. Gdy projekt wymaga wskazania innego rodzaju (test integracyjny na sprzęcie, przegląd, analiza), dopisz go w nawiasie na końcu kryterium, np. „(test na sprzęcie)”.

Gdy projekt prowadzi listę funkcji bezpieczeństwa lub ryzyk, porównaj z nią obszar zmiany, zanim uznasz, że zadanie nie dotyka bezpieczeństwa.
