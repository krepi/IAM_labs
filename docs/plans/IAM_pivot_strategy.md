# Strategia Pivotu: AML -> IAM / SecOps

## 1. Profil i Szanse na Sukces

**Ocena szans na pivot: BARDZO WYSOKIE (9/10)**. Praca na czas nieokreślony w docelowej strukturze docenienia cyberbezpieczeństwa (globalny bank) ściąga z nas presję absolutnego roku. Naszym asymetrycznym atutem staje się **awans wewnętrzny (Internal Mobility)**, a jedynym wyzwaniem pozostaje budowanie mikronawyków zaraz po narodzinach dziecka.

Masz niezwykle unikalny i pożądany profil na rynku Cybersecurity, znacznie silniejszy niż typowy absolwent bez doświadczenia. Branża IT Security to w 50% procesy i procedury, a w 50% technologia. Twoje atuty:

*   **Marynarka Wojenna (17 lat):** "Security mindset" masz we krwi. Praca z procedurami, hierarchią dostępu i rygorem operacyjnym to fundament SecOps. Pracodawcy (zwłaszcza w korporacjach i sektorze bankowym) ogromnie cenią dyscyplinę, analityczne myślenie i odporność na stres u byłych wojskowych.
*   **Logistyka (4 lata):** Zarządzanie i optymalizacja procesów. Automatyzacja JS w pakiecie Google dowodzi, że potrafisz zidentyfikować problem biznesowy i samodzielnie rozwiązać go kodem. 
*   **AML (1 rok):** To bezpośredni wstęp do obszarów Identity & Access Management (IAM) oraz Security Operations (SecOps). 
    *   *Analiza Ryzyka AML* idealnie przekłada się na *Risk-based Authentication* i reguły walidacji (np. Azure Conditional Access).
    *   *KYC (Know Your Customer)* to nic innego jak procesy *Identity Verification* w IAM.
    *   *Transaction Monitoring* to bliźniak *SIEM / Audit Logs Monitoring* w SecOps. Obserwujesz wzorce, mapujesz anomalię, wyłapujesz incydenty.
*   **Wykształcenie i Technologia:** Inżynier IT (mocny fundament akademicki) + znajomość języków (JS, TS, SQL, Python) + certyfikaty (AZ-900, końcówka ISC2 CC, w planach: SC-900, SC-300) + własny tenant na Azure. Posiadasz gotowy zestaw narzędzi technicznych Inżyniera Chmurowego / Specjalisty IAM.

**Główne ryzyko / Wyzwanie:** Noworodek za miesiąc. Pierwsze 3-6 miesięcy to często skrajne zmęczenie, nieprzespane noce i nieprzewidywalność. Twój plan nauki i współpracy musi przestawić się na tryb **Micro-Learningu** i **Micro-Tasków** (sesje od 15 do 30 minut).

---

## 2. Jak najwięcej wyciągnąć z naszej współpracy?

Jako agent IAM Labs, mogę być Twoim wsparciem na kilku płaszczyznach: jako Twój programista-wykonawca, jako audytor (Reviewer) oraz jako Mentor-Senior:

1.  **Rozwój przez Analogię (Zgodnie z zasadami projektu):** Będę aktywnie tłumaczył zagadnienia IAM i SecOps odnosząc się do Twojego doświadczenia z obszaru AML. Gdy zapytasz np. o "Entra ID Identity Protection" czy anomaliach w "Microsoft Sentinel", opowiem Ci o nich w kontekście systemu wczesnego ostrzegania (Transaction Monitoring), w którym szukamy brudnych pieniędzy - z tym że my tu będziemy szukać skradzionych sesji lub nieautoryzowanych logowań.
2.  **Architektura i Hands-On:** Masz tenanta Azure i to jest Twoje największe laboratorium. Będziemy w nim wspólnie budować rzeczywiste scenariusze do Twojego Portfolio: konfiguracje kontroli dostępu (Role-Based Access Control), automatyzację nadawania / odbierania uprawnień przez skrypty PowerShell i Python z restrykcyjnym naciskiem na zasadę *Least Privilege*.
3.  **Projektowanie Asynchroniczne (Dla młodego taty):** Gdy będziesz miał czas, wejdziesz i rzucisz mi jedno zdanie z zadaniem, np.: *"Napisz mi skrypt PowerShell, który połączy się z MS Graph API i wyciągnie wszystkich userów z wygasłym hasłem, i zabezpiecz tajemnice (sekrety) do połączenia"*. Odejdź do dziecka, pomóż partnerce. Po powrocie będziesz w repozytorium miał elegancki skrypt, instrukcję uruchomienia i wyjaśnienie. Oszczędzamy Twój czas.
4.  **Code Review zamiast gotowców (Jeśli wolisz pisać kod samodzielnie):** Napisz fragment skryptu w Pythonie / JS sam. Poproś mnie o weryfikację. Zaopiniuję go i dam wskazówki jako "Security Engineer", wyłapując słabe punkty.

---

## 3. Strategia na nadchodzący rok (Roadmapa Baby-Friendly)

### Miesiąc 1 (Maj 2026): Konsolidacja i Zmiana Priorytetów
*   **Cel:** Ustrukturyzowanie repozytorium `IAM_labs` z podziałem na administrację i tożsamość. Zamknięcie etapu nauki do ISC2 CC.
*   **Działania:** Repozytorium uporządkowane modułowo (`az-104-administration`, `sc-300-identity`). Materiał do ISC2 CC został przerobiony. Posiadasz voucher na egzamin ważny do 15.10.2026 – podejście opcjonalne (zrobisz certyfikat, jeśli nadarzy się dobra okazja, ale bez presji). Główny cel to SC-300.

### Miesiące 2-4 (Czerwiec - Sierpień 2026): Fundamenty AZ-104 (Micro-Learning)
*   **Cel:** Zbudowanie solidnych podstaw z zakresu administracji chmurą Azure (infrastruktura, sieci, storage, compute), które są niezbędne przed wejściem w IAM. Utrzymanie systematyczności w trudnym okresie (Micro-Learning).
*   **Działania:** Praktyczne wdrażanie infrastruktury (Infrastructure as Code) przy użyciu skryptów PowerShell. Zrozumienie mechanizmów działania usług Azure "od kuchni", by w przyszłości lepiej je zabezpieczać. Opanowanie materiału AZ-104 bez parcia na sam certyfikat – liczy się tylko solidna wiedza inżynierska.

### Miesiące 5-6 (Wrzesień - Październik 2026): Główne Uderzenie w SC-300
*   **Cel:** Skupienie się w 100% na wymaganiach certyfikacji SC-300 (Identity and Access Administrator), wykorzystując jako fundament zrealizowaną wiedzę z AZ-104.
*   **Działania:** Zaawansowane ćwiczenia z Microsoft Entra ID, Privilege Identity Management (PIM), Conditional Access, App Registrations. Opcjonalne podejście do egzaminu ISC2 CC przed wygaśnięciem vouchera (15.10).

### Miesiąc 7 (Listopad 2026): Certyfikacja SC-300
*   **Cel:** Zdanie egzaminu **SC-300** do końca listopada 2026.
*   **Działania:** Ostatnie powtórki, testy próbne i utrwalenie wiedzy. Podejście do egzaminu.

### Miesiąc 8+ (Od Grudnia 2026): Przygotowania do Zmiany Roli i Skalowanie Umiejętności
*   **Cel:** Otwarcie się na rynek pracy (poszukiwania zewnętrzne) lub intensyfikacja starań o przesunięcie wewnątrz firmy (Internal Mobility). Zbudowanie potężnego portfolio.
*   **Działania:** 
    *   **Zaawansowane Laby:** Tworzenie "porządnych labów" – kompleksowych środowisk (np. end-to-end identity provisioning and monitoring), które można pokazać na GitHubie potencjalnym pracodawcom.
    *   **Networking i Rekrutacja:** Nawiązywanie kontaktów z inżynierami IAM/SecOps, rozsyłanie CV i symulowanie technicznych procesów rekrutacyjnych. Twoim atutem będzie background AML połączony z wiedzą chmurową i certyfikatem SC-300.
    *   **Nowe Horyzonty:** Zdobywanie kolejnych certyfikatów (np. dobicie AZ-104 lub wejście w Security SC-200/SC-100) oraz nauka nowych skilli i technologii, które będą pożądane w ofertach pracy.

---

Gotowi do lotu?
