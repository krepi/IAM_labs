# 📅 Tydzień 1 – Start i środowisko (Azure + PowerShell + GitHub)

## 🎯 Cele tygodnia

- Przygotować pełne środowisko pracy w chmurze (Azure + Cloud Shell)
- Założyć repozytorium GitHub `iam-labs` i skonfigurować je z Cloud Shell
- Poznać podstawy PowerShell i modułu `Az`
- Wykonać pierwszy mini-projekt: **raport użytkowników z Entra ID (Azure AD)**

---

## 🧰 Dzień 0 – Niedziela (Setup Day)

🕒 Czas: 2–3h  
🎯 Cel: skonfigurować środowisko i repozytorium

### Zadania:
1. Załóż konto **[Azure Free](https://azure.microsoft.com/free)**  
2. Zaloguj się do [Azure Portal](https://portal.azure.com)  
3. Uruchom **Cloud Shell (PowerShell)** i zaakceptuj utworzenie Storage Account  
4. Załóż konto **[GitHub](https://github.com)**  
5. Utwórz repozytorium `iam-labs`  
6. Otwórz repozytorium w VS Code web:  
   ```
   https://vscode.dev/github/<TwojLogin>/iam-labs
   ```
7. Utwórz strukturę folderów:
   ```
   iam-labs/
   ├─ 00-Bootstrap/
   ├─ 01-ActiveDirectory/
   ├─ 02-AzureAD/
   ├─ 03-PowerShell/
   ├─ 04-IAM-Projects/
   └─ notes.md
   ```
8. Połącz Cloud Shell z GitHub:
   ```powershell
   git config --global user.name "TwojeImie"
   git config --global user.email "twoj@email.com"
   git clone https://github.com/<TwojLogin>/iam-labs.git
   cd iam-labs
   echo "Hello IAM Cloud World" > test.txt
   git add .
   git commit -m "Initial commit from Cloud Shell"
   git push
   ```

✅ **Efekt:** masz skonfigurowane środowisko i repozytorium z testowym commitem.

---

## 🗓️ Poniedziałek – Wprowadzenie do Azure i PowerShell

🕒 Czas: 1–1.5h  
🎯 Cel: poznać środowisko chmury i pierwsze komendy PowerShell

### Zadania:
1. Przejdź moduł **[Azure Fundamentals – Concepts](https://learn.microsoft.com/en-us/training/modules/intro-to-azure-fundamentals/)**  
2. W Cloud Shell uruchom:
   ```powershell
   Get-AzContext
   Get-AzSubscription
   Get-AzResourceGroup
   ```
3. Utwórz testową Resource Group:
   ```powershell
   New-AzResourceGroup -Name rg-lab -Location "westeurope"
   ```
4. Zanotuj wynik w pliku `notes.md`.

---

## 🗓️ Wtorek – Podstawy PowerShell

🕒 Czas: 1–1.5h  
🎯 Cel: zrozumieć składnię, pipeline i zmienne

### Zadania:
1. Obejrzyj fragment kursu: *PowerShell for Beginners (Udemy / Pluralsight)*  
2. W Cloud Shell przetestuj:
   ```powershell
   Get-Process | Sort-Object CPU -Descending | Select-Object -First 5
   ```
3. Stwórz zmienną i pętlę:
   ```powershell
   $users = "Alice","Bob","Eve"
   foreach ($u in $users) { Write-Host "Tworzę konto: $u" }
   ```
4. Zapisz kod w pliku `03-PowerShell/basics.ps1` i zacommituj.

---

## 🗓️ Środa – Azure AD (Entra ID) podstawy

🕒 Czas: 1–2h  
🎯 Cel: poznać użytkowników i grupy w Entra ID

### Zadania:
1. Przerób moduł: **[Manage users and groups in Microsoft Entra ID](https://learn.microsoft.com/en-us/training/modules/manage-users-and-groups-in-aad/)**  
2. Aktywuj sandbox i wykonaj ćwiczenia z portalu (tworzenie użytkowników i grup)
3. W Cloud Shell:
   ```powershell
   Get-AzADUser
   Get-AzADGroup
   ```
4. Zanotuj swoje obserwacje w `01-ActiveDirectory/notes.md`.

---

## 🗓️ Czwartek – PowerShell + Azure praktyka

🕒 Czas: 1.5–2h  
🎯 Cel: łączenie PowerShell z danymi Azure

### Zadania:
1. Zaloguj się:
   ```powershell
   Connect-AzAccount
   ```
2. Pobierz użytkowników i zapisz raport:
   ```powershell
   Get-AzADUser | Select-Object DisplayName,UserPrincipalName |
   Export-Csv users.csv -NoTypeInformation
   ```
3. Przenieś plik `users.csv` do repozytorium `01-ActiveDirectory/`
4. Commit:
   ```powershell
   git add .
   git commit -m "User report exported from Azure AD"
   git push
   ```

---

## 🗓️ Piątek – Tablice i dane w PowerShell

🕒 Czas: 1–1.5h  
🎯 Cel: nauczyć się przetwarzać dane i tworzyć hashtable

### Zadania:
1. Ćwicz operacje na danych:
   ```powershell
   $users = @(
     @{Name="Alice"; Role="Admin"},
     @{Name="Bob"; Role="User"}
   )
   foreach ($u in $users) {
       Write-Host "$($u.Name) ma rolę $($u.Role)"
   }
   ```
2. Zapisz skrypt jako `03-PowerShell/arrays.ps1`
3. Dodaj opis w `notes.md`: co robi Twój kod i jak można go rozwinąć.

---

## 🗓️ Sobota – Mini-projekt: raport użytkowników

🕒 Czas: 2–3h  
🎯 Cel: połączyć wszystkie umiejętności w prosty skrypt raportujący

### Zadania:
1. Stwórz skrypt `user-report.ps1`:
   ```powershell
   Connect-AzAccount
   Get-AzADUser |
     Select-Object DisplayName,UserPrincipalName,UserType |
     Export-Csv users-report.csv -NoTypeInformation
   Write-Host "Raport zapisany jako users-report.csv"
   ```
2. Uruchom go w Cloud Shell i sprawdź wynik.
3. Dodaj do repo:
   ```powershell
   git add users-report.csv 04-IAM-Projects/user-report.ps1
   git commit -m "User report project – Week 1 completed"
   git push
   ```
4. Opisz projekt w `README.md`:
   ```
   ## Week 1 – User Report Project
   - Export użytkowników z Azure AD (Entra ID)
   - PowerShell: Connect-AzAccount, Get-AzADUser, Export-Csv
   - Cel: pierwszy praktyczny projekt IAM
   ```

---

## 🧘‍♂️ Niedziela (kolejna) – Reset i przygotowanie tygodnia 2

- Usuń zbędne pliki z Cloud Shell (`rm` / `Remove-Item`)
- Przygotuj nowy sandbox na tydzień 2
- Zanotuj w `notes.md`, co działało / co chcesz poprawić

---

## ✅ Checklista tygodnia

- [x] Konto Azure + Cloud Shell działa  
- [x] Repozytorium GitHub połączone z Cloud Shell  
- [x] Poznane komendy `Get-Az*` i `New-Az*`  
- [x] Pierwszy raport użytkowników (`users-report.csv`)  
- [x] Commit i dokumentacja projektu  

---

**Efekt po tygodniu 1:**  
✔️ działające środowisko (Azure + GitHub)  
✔️ podstawy PowerShell i Azure CLI  
✔️ pierwszy mini-projekt IAM
