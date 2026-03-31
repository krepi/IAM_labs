# 🔄 IAM Labs - Synchronization Log

Ten plik służy do przekazywania kontekstu między agentami AI pracującymi na różnych stacjach roboczych (Mac / Windows) oraz jako log przeciwko prokrastynacji. Po zakończeniu pracy na jednym urządzeniu, agent dopisuje tu podsumowanie, które po zrobieniu `git pull` na drugim urządzeniu od razu da nowemu agentowi pełny kontekst.

---

## [2026-03-28] - Mac Environment Setup & Pivot Strategy

**Wykonane zadania:**
1. **Strategia Pivotu:** Opracowano dokument `plans/IAM_pivot_strategy.md` precyzujący przejście z roli AML Analyst (Citi) & 17 lat Navy ➡️ do Cloud Security / IAM.
2. **Portfolio (README.md):** Zbudowano profesjonalny profil repozytorium (technologie, struktura, tło analityczne zgodne z najlepszymi praktykami SecOps).
3. **Konfiguracja Środowiska (Security-First):** Utworzono szablon `.env.example`, odizolowano prawdziwy plik `.env` za pomocą zaktualizowanego `.gitignore`.
4. **Zasady Współpracy (GEMINI.md):** Zastrzeżono używanie anglojęzycznych commitów (Conventional Commits), narzucono wymóg pisania kodu/komentarzy w języku angielskim i wprowadzono zakaz bezpośredniej pracy agentów na branchu `main`.
5. **Pierwszy Kod (Python):** Przygotowano szkielet startowy `python/azure_auth_test.py` oraz `python/requirements.txt` służący do weryfikacji połączenia uwierzytelniania w Azure (MSAL / Azure Identity) na podstawie zmiennych z pliku `.env`.
6. **Audyt Marki Osobistej:** Przeanalizowano obecny i zaproponowano nowy profil LinkedIn pod kątem wejścia w rynek IAM, zrywając łatkę "Aspirującego Juniora" na rzecz "Eksperta procesowego AML/Ops".

**Następne kroki (Dla agenta na dowolnej maszynie):**
- Uruchomienie środowiska wirtualnego: `py -m venv .venv` i aktywacja.
- Instalacja bibliotek: `pip install -r python/requirements.txt`.
- Logowanie do Azure: `az login` (akcja interaktywna użytkownika).
- Test uwierzytelniania skryptem `python/azure_auth_test.py`.

---

## [2026-03-29] - PC Environment Setup & Educational Pivot

**Wykonane zadania:**
1. **Naprawa środowiska Python:** Naprawiono brak modułu `pip` w wersji 3.14 za pomocą `ensurepip`.
2. **Weryfikacja Azure CLI:** Potwierdzono poprawne działanie `az` po restarcie systemu.
3. **IAM Study Journal:** Stworzono plik `IAM_STUDY_JOURNAL.md` (English-only) do śledzenia nomenklatury.
4. **Aktualizacja Zasad (GEMINI.md):** Sformalizowano rolę Agenta jako mentora.
5. **Bezpieczeństwo (Branch Policy):** Przygotowano synchronizację z gałęzią `main` (świadomy wyjątek).

---

## [2026-03-30] - PC Session: Implementing Least Privilege (RBAC & SPN)

**Wykonane zadania:**
1. **Model Uwierzytelniania:** Wyjaśniono różnice między logowaniem interaktywnym (MFA) a nieinteraktywnym (Service Principal).
2. **Service Principal (SPN):** Utworzono tożsamość `SPN-IAM-LABS-BOT`.
3. **RBAC Scoping:** Przypisano uprawnienia `Contributor` ograniczone do grupy zasobów `RG-IAM-LABS` (zamiast całej subskrypcji) - wdrożenie zasady **Least Privilege**.
4. **Automatyzacja:** Skonfigurowano plik `.env` i pomyślnie zweryfikowano uwierzytelnianie skryptem `python/azure_auth_test.py` bez udziału przeglądarki.
5. **Dziennik Nauki:** Rozbudowano `IAM_STUDY_JOURNAL.md` o pojęcia AuthN vs AuthZ oraz SPN.

**Następne kroki:**
- Testy operacyjne: Wykonanie pierwszej akcji (np. listowanie zasobów) używając wyłącznie uprawnień SPN.
- Eksploracja: Sprawdzenie, czy SPN może uzyskać dostęp do zasobów poza grupą `RG-IAM-LABS` (w celu potwierdzenia izolacji).

---

## [2026-03-31] - Mac Environment: Verification & Azure CLI Setup
**Wykonane zadania:**
1. **Instalacja Narzędzi:** Pomyślnie zainstalowano Azure CLI na macOS za pomocą Homebrew. 
2. **Konfiguracja Tożsamości:** Uzupełniono plik `.env` o AZURE_TENANT_ID, AZURE_CLIENT_ID oraz AZURE_CLIENT_SECRET (unikalny dla Maca).
3. **Pomyślny Test Uwierzytelniania:** Skrypt `python/azure_auth_test.py` poprawnie pobrał token dla bota (SPN-IAM-LABS-BOT) w trybie nieinteraktywnym.
4. **Weryfikacja RBAC:** Potwierdzono logiem z CLI, że bot posiada rolę Contributor ograniczoną do Resource Group: RG-IAM-LABS.

**Następne kroki:**
- Eksploracja zasobów: Użycie bota do wykonania pierwszej akcji na zasobach (np. pobranie metadanych maszyny wirtualnej).
- Separacja sekretów: Pamiętać o wygenerowaniu osobnego sekretu dla PC (Windows) dla zachowania pełnego audytu.

---

## [2026-03-31] - Mac Session: First Operational Action (Resource Enumeration)
**Wykonane zadania:**
1. **Rozszerzenie Środowiska:** Dodano bibliotekę `azure-mgmt-resource` do projektu.
2. **Uzupełnienie Konfiguracji:** Dodano `AZURE_SUBSCRIPTION_ID` do pliku `.env`.
3. **Wdrożenie Skryptu Bota:** Stworzono skrypt `python/list_resources.py`, który potrafi pobrać listę zasobów (Nazwa, Typ, Lokacja) używając tożsamości SPN.
4. **Weryfikacja Operacyjna:** Pomyślnie pobrano dane o 6 zasobach z grupy `RG-IAM-LABS`.

**Następne kroki:**
- Test Izolacji (Least Privilege): Spróbować wylistować zasoby z innej grupy, aby potwierdzić, że bot NIE ma do nich dostępu (Security Audit).
- Eksploracja Metadanych: Wyciągnięcie bardziej szczegółowych informacji o maszynie wirtualnej (np. adresy IP, status zasilania).

---

## [2026-03-31] - IAM Smoke Test: Access & Isolation Verified
**Wykonane zadania:**
1. **Wdrożenie Smoke Testu:** Stworzono skrypt `python/smoke_test.py` testujący granice uprawnień bota.
2. **Weryfikacja Izolacji:** Potwierdzono, że bot otrzymuje błąd 403 (Forbidden) przy próbie dostępu do `NetworkWatcherRG`.
3. **Weryfikacja Operacyjna:** Bot pomyślnie zaktualizował tagi na zasobie `vm-az900-lab-vnet` wewnątrz swojej grupy.
4. **Potwierdzenie Least Privilege:** System uprawnień Azure poprawnie izoluje tożsamość bota zgodnie z zasadami SecOps.

**Następne kroki:**
- Monitoring: Sprawdzenie logów aktywności (Activity Logs) w portalu Azure, aby zobaczyć ślad pozostawiony przez bota (Audit Trail).
- Automatyzacja Audytu: Rozbudowa skryptów o funkcje sprawdzające, czy inne zasoby mają poprawne tagi.
