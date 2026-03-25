# 1. Tworzymy listę loginów (Tablica)
$Loginy = "m.kowalski", "j.nowak", "adm", "k.bob", "service_account_iam"

Write-Host "--- LOGIN LENGTH CHECKING ... ---" -ForegroundColor Cyan

# 2. Pętla przechodząca przez każdy login
foreach ($Login in $Loginy) {

   
    
    if ( $Login.Length -lt 8 ) {
       
        Write-Host "ALERT: Login '$Login' is to short!" -ForegroundColor Red
    }
}

