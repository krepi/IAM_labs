# Zasady Projektu Java Developer (Road to Enterprise Backend)

Ten plik zawiera instrukcje dla agentów AI (Antigravity i innych) pracujących w tym repozytorium. Zasady te mają absolutne pierwszeństwo przed domyślnymi zachowaniami.

---

## 🎯 Kontekst Strategiczny i Profil Użytkownika

1.  **Horyzont Czasowy:** Dwuletni plan nauki (cel końcowy: połowa 2028). Priorytetem jest brak presji czasowej, balans z życiem rodzinnym oraz dokładne, solidne budowanie fundamentów bez dróg na skróty.
2.  **Profil:** 46 lat, stabilna pozycja w banku, emerytura wojskowa. Doświadczenie menedżerskie, nastawienie na automatyzację i usprawnianie procesów. 
3.  **Umiejętności Techniczne (Punkt Startowy):** Zrozumienie OOP, algorytmów, baz danych (SQL), Docker, JavaScript/TypeScript, React, Laravel. Luka do uzupełnienia to ekosystem enterprise: **Java Core -> Spring Boot**.
4.  **Cel Zawodowy:** Przejście do wewnętrznego zespołu deweloperskiego w banku (backend enterprise) z unikalnym wyróżnikiem w postaci znajomości chmury (Azure/AZ-104) i bezpieczeństwa (IAM/SC-300).

---

## 🛡️ Bezpieczeństwo i Izolacja (Sandbox Policy)

1.  **Zakres Operacji:** Wszystkie operacje na plikach oraz wykonywanie komend powłoki muszą ograniczać się WYŁĄCZNIE do bieżącego katalogu projektu oraz jego podkatalogów.
2.  **No Sandbox Warning:** Agent ma świadomość pracy w trybie `no sandbox` (poza piaskownicą). Każda komenda modyfikująca system operacyjny musi być poprzedzona wyjaśnieniem.
3.  **Zarządzanie Sekretami:** Surowy zakaz wpisywania haseł, kluczy API, tokenów czy sekretów bezpośrednio do kodu. Używamy zmiennych środowiskowych (`.env`) lub plików lokalnych ujętych w `.gitignore`.

---

## ⚙️ Workflow Deweloperski i Git

1.  **Zakaz pracy na branchu main:** Agenci AI nigdy nie wprowadzają bezpośrednich zmian na gałęzi `main`. Zawsze pracujemy na dedykowanym branchu feature (np. `feat/java-core`, `feat/dishdock-migration`).
2.  **Zasada Kumulacji Commitów:** Aby uniknąć zaśmiecania historii repozytorium drobnymi zmianami, **ZABRANIA SIĘ** wykonywania komend `git commit` i `git push` po każdej drobnej edycji. Synchronizacja z GitHubem następuje na wyraźne polecenie użytkownika lub jako jeden zbiorczy commit na koniec sesji roboczej.
3.  **Język Kodu (English-First w kodzie):** Wszelkie komentarze, nazwy zmiennych, metod, klas oraz dokumentacja techniczna wewnątrz kodu muszą być pisane **w języku angielskim**, mimo że konwersacja toczy się w języku polskim.
4.  **Język Commitów (English-First w Git):** Wiadomości zatwierdzeń (commit messages) must be written exclusively in English, following the *Conventional Commits* convention (e.g., `feat:`, `fix:`, `refactor:`, `docs:`).

---

## 📚 Strategia Nauki i Projekty

Nauka opiera się na pisaniu kodu i praktycznym rozwiązywaniu problemów ("ręce w kodzie"), unikając samej suchej teorii.

### Krok 1: Java Core -> Spring Boot (Zajavka)
*   Szybkie odświeżenie znanych pojęć (OOP, struktury danych) w tempie 1.5x.
*   Głębokie wejście w zaawansowane mechanizmy Javy (Stream API, współbieżność, typy generyczne).

### Krok 2: Projekt Migracji - DishDock (Laravel -> Spring Boot)
Zamiast sztucznych tutoriali, przepisujemy istniejący projekt:
*   **Backend:** Spring Boot (REST API, Spring Data JPA, Hibernate, PostgreSQL).
*   **Wdrożenie i Narzędzia:** Flyway (migracje baz danych), Docker Compose, JUnit/Mockito (testy).
*   **Security:** Spring Security (uwierzytelnianie, JWT/OAuth2).
*   **Frontend:** React (integracja z nowym API).

### Krok 3: Aplikacja Rodzinna (System Punktowy dla Dzieci)
*   Zarządzanie użytkownikami, rolami, zadaniami i nagrodami.
*   System powiadomień i proste mikro-serwisy.

---

## 📝 Dzienniki i Notatki

W repozytorium prowadzimy dwa kluczowe pliki dokumentacji:
1.  **`SYNC_LOG.md`:** Służy do przekazywania kontekstu między agentami na różnych maszynach (Mac / Windows). Wpisy dodawane są na samej górze (kolejność odwrotnie chronologiczna) z nagłówkiem wskazującym stację, np. `## [YYYY-MM-DD] - PC Session: [Tytuł]` lub `## [YYYY-MM-DD] - Mac Session: [Tytuł]`.
2.  **`JAVA_STUDY_JOURNAL.md`:** Dziennik pojęć technicznych, w którym agent po każdej sesji dopisuje nowe pojęcia, wzorce projektowe i dobre praktyki w języku angielskim wraz z krótkim wyjaśnieniem.
