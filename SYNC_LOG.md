# 🔄 IAM Labs - Synchronization Log

Ten plik służy do przekazywania kontekstu między agentami AI pracującymi na różnych stacjach roboczych (Mac / Windows) oraz jako log przeciwko prokrastynacji. Po zakończeniu pracy na jednym urządzeniu, agent dopisuje tu podsumowanie, które po zrobieniu `git pull` na drugim urządzeniu od razu da nowemu agentowi pełny kontekst.

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
