# 🔄 IAM Labs - Synchronization Log

Ten plik służy do przekazywania kontekstu między agentami AI pracującymi na różnych stacjach roboczych (Mac / Windows) oraz jako log przeciwko prokrastynacji. Po zakończeniu pracy na jednym urządzeniu, agent dopisuje tu podsumowanie, które po zrobieniu `git pull` na drugim urządzeniu od razu da nowemu agentowi pełny kontekst.





---



---

## [2026-05-14] - PC Session: Portal Walkthrough & Lab Hygiene
**Wykonane zadania:**
1. **Synchronizacja Git:** Wykonano `git pull` i zaktualizowano lokalne repozytorium.
2. **Lab 01 (Manual):** Pomyślnie przeprowadzono manualny deployment infrastruktury przez Azure Portal (VNet, Subnets, NSG, VM).
3. **Dokumentacja:** Stworzono `MANUAL_PORTAL.md` z analizą architektury i bezpieczeństwa (Zero Trust, Least Privilege).
4. **Cloud Hygiene:** Całkowicie wyczyszczono grupę zasobów `rg-iam-labs` po zakończeniu sesji, przygotowując grunt pod jutrzejszą automatyzację.
5. **Edukacja:** Zaktualizowano `IAM_STUDY_JOURNAL.md` o 4 nowe pojęcia z zakresu sieci i bezpieczeństwa.

**Status:** Lab 01 foundation understood. Ready for CLI automation tomorrow.




---

## [2026-05-16] - Mac Session: Modular IaC & Template Architecture
**Wykonane zadania:**
1. **Infrastruktura jako Kod (Modułowość):** Wprowadzono architekturę opartą na szablonach (templates), aby zapewnić spójność środowisk w różnych laboratoriach.
2. **Nowy katalog `templates/`:** Stworzono moduły `networking/base-vnet-nsg.ps1` oraz `compute/base-vm-jumpbox.ps1`.
3. **Refaktoryzacja:** Zaktualizowano Lab 02, aby korzystał z centralnych szablonów zamiast lokalnych skryptów wdrożeniowych.
4. **Strategia:** Potwierdzono wykorzystanie wspólnej bazy sieciowej dla ścieżek AZ-104 i SC-300.

**Status:** Architektura gotowa na szybkie wdrażanie kolejnych laboratoriów.

---

## [2026-05-15] - Evening Session: Infrastructure Verification & Cleanup (Lab 02)
**Wykonane zadania:**
1. **Weryfikacja Azure:** Potwierdzono pomyślne manualne wdrożenie infrastruktury (VNet, Subnets, NSG, VM).
2. **Audyt Compliance:** Uruchomiono `verify_infrastructure.ps1` – wszystkie testy (IP lockdown, porty, asocjacje) zakończone statusem **[PASS]**.
3. **Automatyzacja Cleanup:** Stworzono i przetestowano `cleanup_infrastructure.ps1`.
4. **Status:** Lab 02 w pełni zakończony. Grupa `rg-iam-labs` jest czysta.

---

## [2026-05-15] - Mac Session: Strategic Reorganization & AZ-104 Pivot
**Wykonane zadania:**
1. **Reorganizacja Labów:** Przebudowano strukturę folderu `labs/`, aby oddzielić fundamenty administracyjne od zaawansowanego IAM:
   - Nowy dział: `labs/az-104-administration/` (przeniesiono networking i basic management).
   - Nowy dział: `labs/sc-300-identity/` (przeniesiono identity provisioning).
2. **Aktualizacja Dokumentacji:** Odświeżono główny `README.md` oraz README Lab 02. Dodano nowe pliki "Landing Page" (README) wewnątrz `labs/az-104-administration/` oraz `labs/sc-300-identity/` dla lepszego zarysu ścieżek edukacyjnych.
3. **Automatyzacja (IaC):** Stworzono skrypt `deploy_infrastructure.ps1` w Lab 02, który automatyzuje wczorajsze manualne kroki z portalu (VNet, Subnets, NSG Lockdown, VM).
4. **Synchronizacja:** Wykonano `git pull` na początku sesji (pobrano wpis z PC o Manual Deployment).

**Decyzja strategiczna:** Budowa solidnych fundamentów z zakresu AZ-104 (sieci, compute, storage) przed pogłębianiem specjalizacji SC-300, aby uniknąć pracy "po omacku" w chmurze.

**Status:** Struktura gotowa na nowe laboratoria administracyjne.

---

## [2026-05-14] - Mac Session: Resource Audit & IAM Roadmap
**Wykonane zadania:**
1. **Audyt Azure:** Potwierdzono stan "Clean Slate" – grupa `rg-iam-labs` istnieje, ale jest pusta.
2. **Aktualizacja Cheatsheet:** Rozbudowano `azure_cli_cheatsheet.md` o sekcje:
   - IAM & Access Control (Least Privilege, Delegacja uprawnień, ABAC).
   - Infrastructure Deployment (VNet, NSG, VM).
3. **Planowanie ścieżki (Learning Path):**
   - **Dziś:** Manualny deployment przez Azure Portal (zrozumienie zależności).
   - **Jutro:** Automatyzacja za pomocą Azure CLI + PowerShell (skryptowanie `az` commands).
   - **Kolejne kroki:** Automatyzacja przez Python SDK.

**Kluczowe tematy IAM do przetestowania:**
- Izolacja użytkownika `Lab-Admin` do poziomu Resource Group.
- Nadawanie granularnego dostępu do pojedynczej maszyny wirtualnej (Scope: Resource ID).
- Użycie roli `User Access Administrator` do delegowania uprawnień bez nadawania `Ownera`.

**Status:** Repozytorium zsynchronizowane, plan na najbliższe dni ustalony.

---

## [2026-05-13] - PC Session: Repository Sync & Cloud Hygiene
**Wykonane zadania:**
1. **Synchronizacja Git:** Wykonano `git pull` na gałęzi `first_month`.
2. **Optymalizacja SSH:** Skonfigurowano plik `$HOME\.ssh\config` dla wygodnego dostępu.
3. **Cloud Hygiene (Total Reset):** Usunięto wszystkie zasoby w grupie `RG-IAM-LABS` (VM, VNet, Dyski, IP, Klucze), aby przygotować grunt pod czysty lab jutro.
4. **Weryfikacja .gitignore:** Potwierdzono poprawne ignorowanie plików `.pem`.
5. **SYNC_LOG:** Zaktualizowano dziennik na stacji Windows.

**Plany na następną sesję:**
- Re-deployment infrastruktury sieciowej z poprawnym nazewnictwem (np. `vnet-iam-labs`).
- Konfiguracja nowej maszyny w nowej, czystej sieci.


---

## [2026-05-13] - Mac Session: Structure Reorganization & Networking Initialization
**Wykonane zadania:**
1. **Reorganizacja struktury:** Przeprowadzono gruntowne porządki w repozytorium dla lepszej spójności:
   - Skonsolidowano wszystkie laby w folderze `labs/` z podziałem na domeny (`azure-platform`, `identity`, `networking`).
   - Przeniesiono materiały do nauki i brudnopisy do folderu `study/` (podział na `python` i `powershell`).
   - Przeniesiono dokumentację planistyczną do `docs/plans/`.
   - Ujednolicono nazewnictwo folderów na format `labXX-nazwa`.
2. **Inicjalizacja Labu Sieciowego:** Stworzono `labs/networking/lab01-network-security` z dokumentacją README.
3. **Synchronizacja:** Zaktualizowano log i wypchnięto zreorganizowaną strukturę na GitHub.

---

## [2026-05-08] - Session Resume: Return after parental leave
**Wykonane zadania:**
1. **Wznowienie prac:** Powrót do projektu po przerwie związanej z narodzinami dziecka. Rozpoznanie aktualnego stanu repozytorium.
2. **Synchronizacja:** Zaktualizowano log po dłuższej nieobecności.

---

## [2026-04-22] - Mac Session: Identity Manager Refactoring & Lab Creation
**Wykonane zadania:**
1. **Refaktoryzacja Tożsamości:** Poprawiono logikę `generate_id` (wielkie litery, dopełnianie znakami 'X', standardowy format `.zfill(5)`).
2. **Architektura Laboratoriów:** Dotychczasowy kod z brudnopisu przekształcono w samodzielny moduł: `python/labs/lab01_identity_provisioning/identity_manager.py`.
3. **Dokumentacja IAM:** Uzupełniono `IAM_STUDY_JOURNAL.md` o wpis dotyczący Data Normalization i Data Cleansing.
4. **Czysty Start:** Przygotowano od nowa bezpieczny i pusty plik `python/study/playground.py` pod kolejne testy.

---

## [2026-04-20] - PC Session: ID Generation & Repository Push
**Wykonane zadania:**
1. **Synchronizacja Git:** Wykonano `git pull` na gałęzi `first_month`.
2. **Code Review:** Przeanalizowano nową funkcjonalność `generate_id` w `playground.py`. Doceniono logikę inkrementacji sufiksów i dynamicznej generacji e-maili.
3. **Edukacja:** Uzupełniono `IAM_STUDY_JOURNAL.md` o pojęcia: Identity Provisioning oraz Collision Handling.
4. **Strategia:** Przygotowano sugestie na jutro (refaktoryzacja importów, poprawa odporności na krótkie nazwiska).
5. **Git Push:** Wypchnięto lokalne zmiany (w tym kod użytkownika) na GitHub do gałęzi `first_month`.

---

## [2026-04-19] - Session Wrap-up: Optimization & Documentation
**Wykonane zadania:**
1. **Optymalizacja Playground:** Wdrożono wyrażenia regularne (Regex) do walidacji haseł, co zwiększyło precyzję i czytelność kodu.
2. **Dokumentacja (English focus):** Dodano profesjonalne Docstrings i komentarze w języku angielskim (zgodnie z zasadami projektu).
3. **Refaktoryzacja:** Poprawiono strukturę klas zgodnie z zasadą SRP i wyczyszczono zbędne linie (PEP 8).
4. **Synchronizacja:** Zapisano zmiany i przygotowano do wypchnięcia na GitHub jako podsumowanie etapu.

---

## [2026-04-14] - Official Project Milestone: Merge to MAIN
**Wykonane zadania:**
1. **Dekompozycja Klas:** Wydzielono klasę `Authenticator` z `User`, realizując zasadę SRP (Single Responsibility Principle).
2. **Dependency Injection:** Zastosowano wstrzykiwanie zależności (Method Injection) w metodzie `access_level`.
3. **Optymalizacja:** Usunięto zbędne powiązania między klasami (Decoupling).
4. **Edukacja:** Zaktualizowano `IAM_STUDY_JOURNAL.md` o pojęcia Decoupling i Dependency Injection.
5. **Milestone:** Oficjalny merge gałęzi `first_month` do `main` (za potwierdzoną zgodą użytkownika).
6. **Zielone Kwadraciki:** Wypchnięto skumulowane zmiany na serwer, oficjalnie aktualizując historię projektu.

---
 Linda

## [2026-04-13] - Mac Session: Refactoring & Security Patch
**Wykonane zadania:**
1. **Refaktoryzacja Playground:** Zastąpiono rekurencję w `password_creator` pętlą `while True`. 
2. **Poprawka Bezpieczeństwa:** Usunięto zwracanie hasła w tekście jawnym (plaintext) w metodzie `access_level`.
3. **Edukacja IAM:** Dodano do `IAM_STUDY_JOURNAL.md` pojęcia: Security Remediation oraz Loop Control.
4. **Synchronizacja:** Zapisano zmiany i przygotowano do pusha na GitHub.

---

## [2026-04-12] - Mac Session: Playground & Access Control Review
**Wykonane zadania:**
1. **Analiza Playground:** Przegląd `python/study/playground.py` pod kątem logiki ABAC i bezpieczeństwa haseł.
2. **Edukacja IAM:** Zaktualizowano `IAM_STUDY_JOURNAL.md` o pojęcia ABAC, SRP (Single Responsibility) oraz ryzyko wycieku danych (Plaintext Leak).
3. **Synchronizacja:** Finalny commit i push sesji na GitHub.
4. **Plan na jutro/pojutrze:**
   - Przejście z rekurencji na pętlę `while` w `password_creator`.
   - Usunięcie wyświetlania hasła w `access_level`.
   - Refaktoryzacja i podział klasy (poczytanie o SRP i dekompozycji w Pythonie).

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

### 2026-04-19
- Discussion on automation of daily GitHub activity reminders.
- Explored options: GitHub Actions (recommended), n8n, and local scripts.
- Key IAM concepts discussed: Secrets Management (GitHub Secrets), Service Accounts, M2M Authentication, and limiting the Blast Radius by using isolated accounts.
- Updated IAM_STUDY_JOURNAL.md with- [x] Network topology planning.
- [ ] Azure Virtual Network (VNet) configuration.
- [ ] Virtual Machine deployment (Ubuntu Server).
- [ ] Secure SSH access configuration (Identity Keys).
