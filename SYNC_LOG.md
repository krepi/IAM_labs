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
