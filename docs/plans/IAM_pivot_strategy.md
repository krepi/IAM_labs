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

### Miesiąc 1: Przed "Godziną Zero" (Konsolidacja)
*   **Cel:** Dopięcie certyfikatu ISC2 CC oraz ewentualne szybkie wejście w SC-900. Oprócz tego: ustrukturyzowanie repozytorium `IAM_labs`.
*   **Działania:** Zdaj ISC2 CC. Doprowadź obecne skrypty do porządku, niech korzystają ze zmiennych środowiskowych `.env`. Zarejestruj się i rozpocznij ścieżkę Azure na platformie TryHackMe. Uporządkuj CV, uwydatniając analogie między AML, Marynarką Wojenną a cyberbezpieczeństwem.

### Miesiące 2-4: Tryb Przetrwania (Micro-Learning)
*   **Cel:** Utrzymanie łączności z tematyką IT ze zminimalizowaną presją. Żadnych wielkich projektów budujących, tylko konsumpcja wiedzy.
*   **Działania:** Kontynuacja ścieżki TryHackMe Azure oraz powolne czytanie materiałów do certyfikatu SC-300 (Identity and Access Administrator). Proś mnie na czacie o szybkie wyjaśnienie zawiłości (np. różnica między Security Principal a Service Principal w Entra ID).

### Miesiące 5-8: Budowa Portfolio w środowisku ("Złoty Środek")
*   **Cel:** Rozbudowa katalogów koncepcyjnych w `IAM_labs` uderzająca w konkretne problemy zabezpieczeń chmury.
*   **Działania:** 
    *   Wykonywanie odpytań (Get) i postów API (Post/Patch) do Microsoft Graph API.
    *   Automatyzacja procesów JML (Joiner, Mover, Leaver) - automatyczne kreowanie i gaszenie tożsamości.
*   **Współpraca ze mną:** Zbudujemy integrację, która przykładowo: wykryje utworzenie nowego konta podejrzanego usera, uruchomi alert i "zablokuje" go via skrypt na Azure (zgodnie z obietnicą braku destruktowych akcji tu lokalnie bez pytania).

### Miesiące 9+: Start po wewnętrzny awans (Internal Mobility)
*   **Cel:** Rekrutacja wewnętrzna do działów Cyber/IAM/SecOps w Twoim banku oraz (opcjonalnie) otworzenie się na rynek zewnętrzny, gdy praca z dzieckiem wejdzie w stabilną rutynę.
*   **Działania:** Nawiązywanie kontaktów (networking) wewnątrz banku z ludźmi z IAM/SecOps. Dla działu bezpieczeństwa Twój wewnętrzny background z AML i wyrobione bezpieczeństwo korporacyjne robią z Ciebie gotowego do szybkiego włączenia "zaufanego człowieka". Sprzedawaj na rozmowach historię, w której znajomość reguł Compliance zamienia się na techniczny rygor kontroli dostępów (SC-300).
*   **Współpraca ze mną:** Będziemy symulować procesy rekrutacyjne, będę pytał Cię w trybie złośliwego rekrutera o aspekty SC-300 (zarządzanie tożsamością, audyty) oraz techniczne praktyki Security w chmurze Azure.

---

Gotowi do lotu?
