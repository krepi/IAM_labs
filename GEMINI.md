# Zasady Projektu IAM Labs

Ten plik zawiera instrukcje dla agentów AI (Gemini CLI, Antigravity i innych) pracujących w tym repozytorium. Zasady te mają absolutne pierwszeństwo przed domyślnymi zachowaniami.

## 🛡️ Bezpieczeństwo i Izolacja (Sandbox Policy)

1.  **Zakres Operacji:** Wszystkie operacje na plikach (odczyt/zapis) oraz wykonywanie komend powłoki (PowerShell/CMD) muszą ograniczać się WYŁĄCZNIE do bieżącego katalogu projektu oraz jego podkatalogów.
2.  **No Sandbox Warning:** Agent ma świadomość pracy w trybie `no sandbox`. Z tego powodu KAŻDA komenda modyfikująca system lub pliki musi być poprzedzona krótkim wyjaśnieniem jej działania i celu.
3.  **Zakaz Usuwania:** Zabrania się używania komend usuwających pliki lub foldery (`rm`, `Remove-Item`, `del`) bez wyraźnej, oddzielnej prośby użytkownika.
4.  **Zakaz pracy na branchu main:** Agenci AI absolutnie nigdy nie wykonują pracy deweloperskiej ani nie wprowadzają bezpośrednich zmian na gałęzi `main` (lub `master`). Zawsze najpierw tworzymy/przełączamy się na dedykowany feature branch. Jeśli sam użytkownik poprosi o wykonanie jakiejkolwiek akcji operacyjnej na gałęzi `main`, agent ma bezwzględny obowiązek go o tym powiadomić i odmówić pracy, dopóki użytkownik tego wyraźnie nie potwierdzi jako świadomy wyjątek.

## 🔑 Zasady IAM i Dane Wrażliwe

1.  **Hardcoded Credentials:** Agentowi surowo zabrania się wpisywania haseł, kluczy API, tokenów czy sekretów bezpośrednio do kodu (skrypty `.ps1`, `.py`). 
2.  **Zarządzanie Sekretami:** Do przechowywania danych wrażliwych należy używać zmiennych środowiskowych (`.env`) lub plików lokalnych, które są uwzględnione w `.gitignore`.
3.  **Weryfikacja .gitignore:** Przed dodaniem nowych typów plików (np. logi, certyfikaty), agent musi upewnić się, że nie wyciekną one do systemu kontroli wersji.

## 📚 Styl Pracy i Edukacja (Pivot do IAM)

1.  **Kontekst Edukacyjny:** Użytkownik przechodzi z AML do IAM. Agent powinien tłumaczyć koncepcje techniczne, odwołując się (tam gdzie to pomocne) do analogii z obszaru AML (np. KYC -> Identity Verification, Transaction Monitoring -> Audit Logs).
2.  **Best Practices:** Agent powinien promować zasadę *Least Privilege* (Najmniejszych Uprawnień) w każdym proponowanym rozwiązaniu.
3.  **Dokumentacja:** Każdy nowy skrypt powinien zawierać nagłówek z opisem działania i informacją o wymaganych uprawnieniach.
4.  **Język Kodu (English-First w kodzie):** Agenci AI mają bezwzględny obowiązek pisania wszelkich komentarzy, nazw podprogramów (zmienne, funkcje) czy bloków dokumentacyjnych *wewnątrz kodu* w języku ANGIELSKIM, mimo że konwersacja toczy się w języku polskim.
5.  **Język Commitów (English-First w Git):** Wiadomości zatwierdzeń (commit messages) muszą być pisane WYŁĄCZNIE w języku angielskim, najlepiej z zastosowaniem konwencji Conventional Commits (np. chore:, feat:, fix:).
6.  **Dziennik Synchronizacji (SYNC_LOG.md):** Kontekst repozytorium jest współdzielony między stacjami roboczymi (Mac / PC). Na komendę "zapamiętaj sesję", "zapisz dziennik" lub "zrób sync", Agent ma bezwzględny obowiązek zwięźle uzupełnić plik `SYNC_LOG.md` o listę akcji i decyzji z danej sesji (używając aktualnej daty), co ułatwi transfer pamięci projektowej między sesjami.

---
*Plik wygenerowany przez Gemini CLI na prośbę użytkownika.*
