# 🔄 IAM Labs - Synchronization Log

Ten plik służy do przekazywania kontekstu między agentami AI pracującymi na różnych stacjach roboczych (Mac / Windows) oraz jako log przeciwko prokrastynacji. Po zakończeniu pracy na jednym urządzeniu, agent dopisuje tu podsumowanie, które po zrobieniu `git pull` na drugim urządzeniu od razu da nowemu agentowi pełny kontekst.



---

## [2026-04-12] - Mac Session: Playground & Access Control Review
**Wykonane zadania:**
1. **Analiza Playground:** Przegląd `python/study/playground.py` pod kątem logiki ABAC i bezpieczeństwa haseł.
2. **Edukacja IAM:** Zaktualizowano `IAM_STUDY_JOURNAL.md` o pojęcia ABAC oraz ryzyko wycieku danych wrażliwych (Plaintext Leak).
3. **Synchronizacja:** Finalny commit i push sesji na GitHub.
4. **Wnioski:** Zidentyfikowano krytyczny błąd bezpieczeństwa (drukujący hasło w konsoli) do poprawy jutro.

---

## [2026-04-11] - Mac Session: Password Validation & Environment Config
**Wykonane zadania:**
1. **Rozszerzenie Playground:** Dodano metody `password_creator` oraz `acces_level` do klasy `User` w `python/study/playground.py`.
2. **Logika Bezpieczeństwa:** Zaimplementowano podstawową walidację długości i zgodności haseł (Basic Password Validation).
3. **Konfiguracja:** Zaktualizowano `.env.example` o brakującą zmienną `AZURE_SUBSCRIPTION_ID`.
4. **Dokumentacja:** Uzupełniono `IAM_STUDY_JOURNAL.md` o pojęcia walidacji haseł i logiki dostępu.

---

## [2026-04-09] - Mac Session: Sync & Educational Playground
**Wykonane zadania:**
1. **Synchronizacja:** Pobrano zmiany z ostatniego tygodnia (Lab 1 Completion, Cryptography Module).
2. **Edukacja:** Stworzono plik `python/study/playground.py` demonstrujący użycie klas i logiki warunkowej do generowania adresów e-mail.
3. **Środowisko:** Zweryfikowano poprawność działania runtime'u Python 3.11 na macOS.

---

## [2026-04-08] - PC Session: Journal Reorganization & Chronology Policy
**Wykonane zadania:**
1. **Reorganizacja Dziennika:** Zmieniono strukturę `IAM_STUDY_JOURNAL.md` na format chronologiczny (najnowsze na górze).
2. **Polityka Chronologii:** Ustalono nową zasadę dodawania wpisów edukacyjnych pod nagłówkiem głównym.
3. **Branching:** Kontynuacja pracy na gałęzi `first_month` (zgodnie z życzeniem użytkownika).

---

## [2026-04-07] - PC Session: Secure Password Character Diversity
**Wykonane zadania:**
1. **Refaktoryzacja Generatora:** Zmodyfikowano `generate_secure_password` w `python/study/password_mini_generator.py`, aby gwarantował obecność co najmniej jednej małej i wielkiej litery, cyfry oraz symbolu.
2. **Kryptografia:** Wdrożono bezpieczne mieszanie znaków (Cryptographic Shuffle) przy użyciu `secrets.SystemRandom().shuffle()`.
3. **Modułowość:** Przeniesiono logikę interaktywną starego generatora do bloku `if __name__ == "__main__"`, co umożliwiło importowanie pliku jako modułu.
4. **Weryfikacja:** Stworzono skrypt `python/study/test_password_generator.py`, który przeprowadził 1000 testów, potwierdzając 100% skuteczność nowej logiki.
5. **Dokumentacja:** Zaktualizowano `IAM_STUDY_JOURNAL.md` o pojęcia: Character Diversity i Layering (analogia AML dla Shuffling).
6. **Zarządzanie Zadaniami:** Wykonano plan implementacji i listę zadań.

---

## [2026-04-03] - PC Session: Password Security & Entropy Analysis
**Wykonane zadania:**
1. **Analiza Kodu:** Przegląd skryptu `password_mini_generator.py` pod kątem bezpieczeństwa IAM.
2. **Edukacja IAM:** Wprowadzono pojęcia CSPRNG vs PRNG oraz pojęcie entropii hasła (Entropy).
3. **Refaktoryzacja Wiedzy:** Zaktualizowano `IAM_STUDY_JOURNAL.md` o analogie AML dla Brute-force (Structuring/Smurfing).
4. **Synchronizacja:** Zapisano dziennik sesji przed zakończeniem prac nad generatorem.

---

## [2026-04-02] - PC Session: Cryptography Basics (Caesar Cipher)
**Wykonane zadania:**
1. **Nauka Podstaw:** Rozpoczęto moduł kryptografii w `python/study/`.
2. **Implementacja:** Stworzono skrypt `caesar_cipher.py` oraz `art.py` do demonstracji mechanizmu przesunięcia (Shift Cipher).
3. **Porządki:** Poprawiono rozszerzenie pliku `caesar_cipher.ps` na `.py`.
4. **Dokumentacja:** Zsynchronizowano dziennik nauki `IAM_STUDY_JOURNAL.md` o pojęcia z zakresu szyfrowania Symetrycznego.
5. **Git:** Wypchnięto zmiany na gałąź `first_month`.

---

## [2026-04-01] - PC Session: Lab 1 Completion & Audit Refactoring
**Wykonane zadania:**
1. **Środowisko:** Rozwiązano problem z instalacją bibliotek przez `py -m pip`.
2. **Refaktoryzacja `audit_file.py`:** Wprowadzono inteligentny fallback do logów aktywności subskrypcji przy braku Log Analytics Workspace.
3. **Optymalizacja Kodu:** Poprawiono ostrzeżenia `DeprecationWarning` (użycie `timezone.utc`) i dodano info o opóźnieniu logów Azure.
4. **Weryfikacja:** Potwierdzono poprawne działanie Smoke Testu i audytu ruchów SPN.
5. **Reorganizacja Projektu:**
   - Przeniesiono gotowe skrypty do `labs/lab1/`.
   - Stworzono `python/study/` jako poligon do nauki.
   - Dodano profesjonalny `README.md` wewnątrz Lab 1.
6. **Edukacja:** Rozbudowano `IAM_STUDY_JOURNAL.md` o pojęcia Control Plane vs Data Plane oraz "Silent 403".

**Status:** Lab 1 oficjalnie zakończony.

---

## [2026-03-31] - IAM Smoke Test: Access & Isolation Verified
**Wykonane zadania:**
1. **Wdrożenie Smoke Testu:** Stworzono skrypt `python/smoke_test.py` testujący granice uprawnień bota.
2. **Weryfikacja Izolacji:** Potwierdzono, że bot otrzymuje błąd 403 (Forbidden) przy próbie dostępu do `NetworkWatcherRG`.
3. **Weryfikacja Operacyjna:** Bot pomyślnie zaktualizował tagi na zasobie `vm-az900-lab-vnet` wewnątrz swojej grupy.
4. **Potwierdzenie Least Privilege:** System uprawnień Azure poprawnie izoluje tożsamość bota zgodnie z zasadami SecOps.

---

## [2026-03-31] - Mac Session: First Operational Action (Resource Enumeration)
**Wykonane zadania:**
1. **Rozszerzenie Środowiska:** Dodano bibliotekę `azure-mgmt-resource` do projektu.
2. **Uzupełnienie Konfiguracji:** Dodano `AZURE_SUBSCRIPTION_ID` do pliku `.env`.
3. **Wdrożenie Skryptu Bota:** Stworzono skrypt `python/list_resources.py`, który potrafi pobrać listę zasobów używając tożsamości SPN.

---

## [2026-03-31] - Mac Environment: Verification & Azure CLI Setup
**Wykonane zadania:**
1. **Instalacja Narzędzi:** Pomyślnie zainstalowano Azure CLI na macOS za pomocą Homebrew. 
2. **Konfiguracja Tożsamości:** Uzupełniono plik `.env` o dane SPN.

---

## [2026-03-31] - PC Environment Sync & Verification
**Wykonane zadania:**
1. **Synchronizacja Git:** Pobrano najnowsze zmiany z bocznej gałęzi.
2. **Środowisko Python (PC):** Utworzono lokalny folder `.venv` i zainstalowano biblioteki.

---

## [2026-03-30] - PC Session: Implementing Least Privilege (RBAC & SPN)
**Wykonane zadania:**
1. **Model Uwierzytelniania:** Wyjaśniono różnice między logowaniem interaktywnym a SPN.
2. **Service Principal (SPN):** Utworzono tożsamość bota.
3. **RBAC Scoping:** Przypisano uprawnienia tylko do `RG-IAM-LABS`.

---

## [2026-03-29] - PC Environment Setup & Educational Pivot
**Wykonane zadania:**
1. **Naprawa Python:** Naprawiono moduł `pip`.
2. **IAM Study Journal:** Stworzono pierwszy dziennik nomenklatury.

---

## [2026-03-28] - Mac Environment Setup & Pivot Strategy
**Wykonane zadania:**
1. **Strategia Pivotu:** Opracowano dokument `plans/IAM_pivot_strategy.md`.
2. **Security-First:** Utworzono `.env.example` i zabezpieczono `.gitignore`.
3. **Zasady Współpracy:** Stworzono `GEMINI.md`.
