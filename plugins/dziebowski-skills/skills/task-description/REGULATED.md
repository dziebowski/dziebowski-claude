# Projekt regulowany

Rozszerzenie skilla [`task-description`](SKILL.md) o traceability (np. według IEC 62304) i listę funkcji bezpieczeństwa lub ryzyk. Uzupełnia *Relacje* i *Bezpieczeństwo*. Konwencja projektu (identyfikatory, placeholdery, format) nadpisuje ten plik.

## Relacje traceability

Identyfikatory trafiają na listę relacji, nie do treści:

- **SLR** (System Level Requirement): wymaganie systemowe, z którego wynika zadanie. Zawsze obecne.
- **SI** (Software Item): element oprogramowania, gdy zmiana dotyczy całego modułu lub komponentu.
- **SU** (Software Unit): jednostka oprogramowania, gdy zmiana dotyczy wyodrębnionej jednostki wewnątrz modułu. SI i SU razem, gdy zadanie tworzy nową SU w istniejącym SI.
- **Ryzyko lub funkcja bezpieczeństwa**: identyfikator z analizy ryzyka projektu, gdy zadanie ich dotyka.

Źródła identyfikatorów:

- Identyfikator pochodzi od użytkownika, z repozytorium albo z trackera.
- Brakujący identyfikator istniejącego elementu to fakt do uzupełnienia: na liście relacji `?`.
- Element, który zadanie tworzy, dostaje placeholder z konwencji projektu (np. `PRJ-SU-????`); numer nadaje się w trakcie implementacji.

Kilka SU w jednym zadaniu to sygnał, że vertical slice łamie R2 albo R5.

## Weryfikacja

`TEST:` oznacza test automatyczny. Gdy projekt wymaga wskazania innego rodzaju weryfikacji (test integracyjny na sprzęcie, przegląd, analiza), rodzaj stoi w nawiasie na końcu kryterium, np. „(test na sprzęcie)”.

Gdy projekt prowadzi listę funkcji bezpieczeństwa lub ryzyk, porównaj z nią obszar zmiany, zanim uznasz, że zadanie nie dotyka bezpieczeństwa.
