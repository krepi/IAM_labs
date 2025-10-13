# 🧭 IAM Foundations in Azure – 3-Month Learning Plan

## 🎯 Cel ogólny

W 3 miesiące zbudować solidne podstawy w:
- **Azure Entra ID (Azure Active Directory)**
- **Identity and Access Management (IAM)**
- **PowerShell i automatyzacji**
- oraz stworzyć **portfolio GitHub z mini-projektami**

**Efekt końcowy:**
- Gotowość do pracy jako *IAM / Cloud / Security Analyst*
- Przygotowanie pod certyfikat **SC-300**
- Fundament pod *Python for IAM Automation*

---

## 📅 Struktura ogólna

| Miesiąc | Faza | Cel główny | Wynik praktyczny |
|:--|:--|:--|:--|
| **1** | Fundamenty Azure & PowerShell | Poznanie chmury Azure i PowerShell | Raport użytkowników, pierwszy skrypt |
| **2** | IAM & Automatyzacja | Zarządzanie użytkownikami, grupami, rolami, MFA | Skrypt IAM + RBAC Report |
| **3** | Bezpieczeństwo & Portfolio | Conditional Access, dokumentacja, SC-300 | Repo GitHub z projektami IAM |

---

## ⚙️ MIESIĄC 1 – Fundamenty Azure i PowerShell  

**Cel:** poznać środowisko Azure, Entra ID i PowerShell.

### 🔹 Tydzień 1 – Start i środowisko  
- Załóż konto Azure Free + Cloud Shell  
- Załóż konto GitHub i repozytorium `iam-labs`  
- Poznaj podstawowe komendy `Get-Az*`, `New-Az*`  
- **Mini-projekt:** raport użytkowników Azure AD → CSV  

### 🔹 Tydzień 2 – Active Directory / Entra ID Basics  
- AD vs Azure AD (Entra ID)  
- Użytkownicy, grupy, role  
- Tworzenie kont i grup w Azure Portal i PowerShell  
- **Mini-projekt:** Model użytkowników w IAM  

### 🔹 Tydzień 3 – PowerShell Automation  
- Zmienne, tablice, hashtable  
- `foreach`, `if`, `try/catch`  
- `Import/Export-Csv`, `param()`, `Write-Host`  
- **Mini-projekt:** User Provisioning z CSV  

### 🔹 Tydzień 4 – IAM Basics w Azure  
- Role i RBAC: Owner, Contributor, Reader  
- Przypisywanie ról PowerShellem  
- MFA i Conditional Access – przegląd  
- **Mini-projekt:** IAM Report – role i MFA status  

**✅ Efekt po 1. miesiącu:**  
- Znasz PowerShell i Entra ID  
- Masz środowisko Azure + repo GitHub  
- Umiesz tworzyć użytkowników i raporty  

---

## ⚙️ MIESIĄC 2 – IAM Automation i RBAC  

**Cel:** automatyzacja zarządzania użytkownikami, grupami i rolami.

### 🔹 Tydzień 5 – IAM Automation  
- Tworzenie użytkowników i grup PowerShellem  
- Provisioning i deprovisioning  
- **Mini-projekt:** Bootstrap IAM Script v1  

### 🔹 Tydzień 6 – RBAC i Role Management  
- Role w Azure (built-in i custom)  
- `Get-AzRoleDefinition`, `New-AzRoleAssignment`  
- Raportowanie ról i uprawnień  
- **Mini-projekt:** RBAC Report Script  

### 🔹 Tydzień 7 – MFA i Conditional Access  
- MFA, CA, Sign-in risk policies  
- PowerShell i Microsoft Graph (podstawy)  
- **Mini-projekt:** MFA / Conditional Access Report  

### 🔹 Tydzień 8 – Automatyzacja i Workflow  
- Łączenie provisioning + RBAC + MFA raport  
- Planowanie skryptów (Azure Automation / Logic App)  
- **Mini-projekt:** IAM Automation Workflow  

**✅ Efekt po 2. miesiącu:**  
- Masz praktyczny zestaw skryptów PowerShell  
- Umiesz przypisywać role automatycznie  
- Rozumiesz MFA, CA i RBAC  

---

## ⚙️ MIESIĄC 3 – Bezpieczeństwo i Portfolio  

**Cel:** połączyć wszystko w pełny projekt i przygotować się do SC-300.

### 🔹 Tydzień 9 – Azure Security Fundamentals  
- Governance, Compliance, Identity Protection  
- Microsoft Learn – SC-300 review  
- Quizy testowe i notatki  

### 🔹 Tydzień 10 – Advanced PowerShell / Graph API  
- PowerShell Functions, moduły, idempotencja  
- Wprowadzenie do Graph API  
- **Mini-projekt:** Graph IAM Report  

### 🔹 Tydzień 11 – Dokumentacja i GitHub Portfolio  
- README i opis projektów  
- Diagramy workflow (draw.io / Lucidchart)  
- Publikacja 2–3 mini-projektów na GitHub  

### 🔹 Tydzień 12 – Powtórka i certyfikacja  
- Powtórka SC-300 / SC-900  
- Testy praktyczne IAM  
- Plan dalszej ścieżki: Python / Security / DevSecOps  

**✅ Efekt po 3. miesiącach:**  
- Gotowy do pracy w IAM / Cloud Security  
- Portfolio GitHub z mini-projektami  
- Przygotowany do SC-300  
- Fundament pod Python Automation  

---

## 🧩 BONUS – „Dev Refresh” (2h tygodniowo)

Cel: utrzymać kontakt z full-stack i DevOps mindsetem.  
Nie wpływa na plan IAM – traktuj jako rozgrzewkę.

| Tematy | Czas | Cel |
|:--|:--|:--|
| OAuth2 / OIDC | 30–60 min | przypomnienie flow logowania |
| REST API + Postman | 30 min | testowanie zapytań |
| JWT + tokeny | 30 min | analiza autoryzacji w Azure |
| Docker Compose | 30 min | lokalne środowisko API |
| CI/CD basics | 30 min | zrozumienie pipeline’ów DevOps |

---

## 📦 MINI-PROJEKTY (Portfolio GitHub)

1. **User Report Script** – eksport użytkowników z Entra ID  
2. **User Provisioning Script (CSV)** – automatyczne tworzenie kont  
3. **RBAC Report** – role i uprawnienia w Azure  
4. **IAM Bootstrap Script** – pełny provisioning + grupy + role  
5. **MFA Report** – lista kont z MFA i CA status  
6. **Graph API Report (Python lub PowerShell)** – dane z Microsoft Graph  

---

## 🧭 Co dalej (po 3 miesiącach)

Po ukończeniu planu:
- Rozszerz ścieżkę o **Python for IAM Automation**  
- Rozważ **Azure Security Engineer (AZ-500)** lub **SC-300**  
- Kierunki rozwoju:  
  - IAM Engineer  
  - Cloud Security Engineer  
  - DevSecOps / Automation  

---

## 🧠 Podsumowanie

**Faza 1:** Azure & PowerShell Fundamentals  
**Faza 2:** IAM Automation (Entra ID, RBAC, MFA)  
**Faza 3:** Security & Portfolio  

**Dodatkowo:** 2h tygodniowo Dev Refresh (OAuth2, API, Docker)

  