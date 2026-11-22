---
name: task-title
description: Write or refine the title of a development task, issue or PR so it names a verifiable outcome and reads correctly unchanged in trackers, changelogs and commit subjects. Use when the user asks to name, title or rename a task, issue or PR; when you are about to create or rename one yourself in any tracker (ClickUp, GitHub, GitLab, ...); or when another skill needs a task title.
---

# Tytuł zadania

Tytuł zadania to **rdzeń**: jedna zwykła linia nazywająca **wynik**, który przynosi zmiana, bez prefiksów. Wynik jest **sprawdzalny**: po wydaniu każdy, kto czyta tylko tytuł, może sprawdzić, czy praca robi to, co obiecała. Ten sam rdzeń służy bez zmian jako nazwa zadania w trackerze, tytuł issue lub PR, wpis w changelogu i temat commita. Konwencje projektu dodają wokół niego tylko prefiksy (typ, ID, scope).

## Kroki

1. **Zbierz.** Zbierz surowy tytuł i wszystko, co opisuje zadanie: tekst użytkownika, a gdy dostajesz link lub ID i dostępne jest narzędzie trackera, samo zadanie. Przeczytaj konwencje projektu (CLAUDE.md, AGENTS.md, instrukcje projektu): format tytułu, prefiksy, język, nadpisania formy. Konwencje nadpisują domyślne ustawienia tego skilla. Gdy pracujesz w repozytorium, a wynik nie jest jasny z tekstu, wyślij subagenta, by znalazł obszar zmiany i słownictwo domeny produktu (glosariusz, etykiety UI, dokumentację). Gotowe, gdy wiesz, co się zmienia i dla kogo.
2. **Zdiagnozuj.** Nazwij **typ** (feature, fix, engineering) i **wynik**: co zyskuje użytkownik lub inżynier; w fixie problem, który przestaje występować. Fakty sprawdzaj sam; użytkownikowi zadawaj tylko decyzje, np. jaka jest korzyść albo która część jest ważna. Nie pytaj o nic, gdy oba są jasne. Potem sformułuj **pytanie kontrolne**: pytanie tak/nie o wydany produkt, na które odpowiada wynik („Czy faktury eksportują się do CSV?”, "Does the CI build finish under 5 minutes?"). Gdy takiego pytania nie ma, wynik jest wciąż mglisty: znajdź obserwowalny stan końcowy albo zapytaj użytkownika, jak wygląda „gotowe”. Gotowe, gdy typ, jeden wynik i jego pytanie kontrolne są nazwane.
3. **Sprawdź rozmiar.** Zadanie niosące kilka niezależnych wyników powinno zostać podzielone. Sygnały: „i” łączące dwa rezultaty, niezależne zmiany w kilku modułach lub warstwach, części mające wartość same w sobie, więcej niż jeden PR pracy. Zaproponuj podział jako listę podzadań, każde z rdzeniem tytułu i jednym zdaniem, i zapytaj, czy zatytułować całe zadanie, czy wybraną część. Tworzenie podzadań zostaw użytkownikowi. Pomiń ten krok, gdy ten skill wywołał inny skill: zakres zadania należy do wywołującego.
4. **Napisz** rdzeń według *Formy* i *Zasad*, potem sprawdź kandydata każdą zasadą.
5. **Dostarcz** (zob. *Wynik*). Do trackera zapisuj dopiero po akceptacji użytkownika, zmieniając wyłącznie tytuł.

## Forma

Forma jest **ponadczasowa**: poprawna przed rozpoczęciem pracy (lista zadań) i po wydaniu (changelog).

**Polski**: rzeczownik odczasownikowy plus konkretny wynik. Wybierz najkrótszy rzeczownik, który niesie znaczenie: „Obsługa X” zamiast „Dodanie obsługi X”, „Eksport” zamiast „Dodanie możliwości eksportu”.
- feature: „Eksport faktur do CSV”, „Obsługa logowania przez Google”
- engineering: „Skrócenie czasu buildu CI dzięki cache zależności”
- fix: **stan docelowy**, co teraz działa poprawnie: „Poprawne naliczanie sum na fakturach z rabatem”. Gdy stan docelowy nie ma krótkiej nazwy, nazwij usunięty objaw: „Wyeliminowanie zawyżania sum na fakturach z rabatem”.

Tryb rozkazujący („Dodaj”) czyta się w changelogu jak polecenie, a czas przeszły („Dodano”) na liście zadań twierdzi, że praca jest skończona; rzeczownik odczasownikowy pasuje do obu.

Rzeczownik odczasownikowy musi nazywać **rezultat lub możliwość**, nigdy otwarty proces. Wybieraj rzeczowniki od czasowników dokonanych, które nazywają osiągnięty rezultat („skrócenie”, „wyeliminowanie”), albo rzeczowniki możliwości („obsługa”, „eksport”, „wyszukiwanie po X”). Rzeczowniki procesu bez stanu końcowego („optymalizacja”, „usprawnienie”, „poprawa”, „refaktoryzacja”, „skracanie”) same w sobie są niesprawdzalne: „Usprawnienie wyszukiwania” nie ma sprawdzenia, „Wyszukiwanie faktur po NIP” ma. Używaj ich tylko z dołączonym mierzalnym końcem: „Skrócenie ładowania listy zamówień do 1 s”.

**Angielski**: tryb rozkazujący, konwencja gita i changelogów, w której czyta się jak nazwa zmiany.
- feature: "Add CSV export for invoices"
- engineering: "Cut CI build time by caching dependencies"
- fix: "Fix" plus obserwowalny objaw: "Fix inflated totals on discounted invoices"

**Inne języki**: forma, której używa profesjonalne pisanie o oprogramowaniu w danym języku, o ile pozostaje ponadczasowa.

**Zadania inżynierskie** (refaktoryzacja, CI, zależności, dokumentacja) nazywają korzyść dla inżynierów, nigdy czynność: „Skrócenie czasu buildu CI…”, podczas gdy „Refaktor pipeline'u” nazywa tylko pracę. Gdy nie da się nazwać korzyści, zapytaj: cel zadania jest niejasny.

**Fixy** nazywają rozwiązany problem tak, jak widzi go użytkownik. Zmiana w kodzie należy do opisu: „Poprawne naliczanie sum na fakturach z rabatem”, podczas gdy „Zmiana zaokrąglania w calcTotal” nazywa tylko zmianę.

## Zasady

- Najwyżej ~72 znaki.
- Zwykły tekst: bez kropki na końcu, markdownu i emoji.
- Słownictwo domeny produktu, czyli słowa, których używają jego użytkownicy i zespół. Nazwy plików, klas i funkcji zostają w opisie. W zadaniach inżynierskich techniczne terminy zespołu (narzędzia, komponenty takie jak `node_modules` czy cache CI) są tym słownictwem i mogą zostać w tytule.
- Konkretne słowa nazywające to, co się zmienia. Szeroki czasownik („usprawnienie”, „aktualizacja”, "improve", "update") zostaje tylko z dołączonym konkretnym „co”.
- Samodzielny: zrozumiały sam w sobie, bez innych zadań czy wcześniejszych dyskusji („część 2”, „jak ustalono” to łamią).
- Jeden wynik.
- Sprawdzalny: tytuł zamienia się w pytanie kontrolne bez dodawania informacji. Nazwij miarę (czas, zakres, przypadek), gdy jest sednem zadania i się mieści; dokładne progi, które się nie mieszczą, przypadki brzegowe i pełne kryteria akceptacji należą do opisu.
- Język: język zadania wejściowego, chyba że konwencje ustalają inny.

## Wynik

Odpowiedz w języku rozmowy:

- rekomendowany rdzeń tytułu, pogrubiony,
- typ: feature / fix / engineering,
- pytanie kontrolne, by użytkownik mógł potwierdzić, że tytuł jest sprawdzalny,
- pełny tytuł z prefiksami, tylko gdy konwencje je definiują,
- 1–2 alternatywy, tylko gdy istnieje naprawdę inne ujęcie,
- jedno zdanie wyjaśniające wybór.

Gdy ten skill wywołał inny skill, zwróć tylko rdzeń tytułu, typ i pytanie kontrolne.
