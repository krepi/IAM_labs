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
- Wygenerowanie poświadczeń (App Registration) w portalu Azure Entra ID.
- Uruchomienie środowiska wirtualnego `python3 -m venv .venv` i test połączenia skryptu `azure_auth_test.py`.
