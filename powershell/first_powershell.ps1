
$Loginy = "m.kowalski", "j.nowak", "adm", "k.bob", "service_account_iam"

Write-Host "--- LOGIN LENGTH CHECKING ... ---" -ForegroundColor Cyan


foreach ($Login in $Loginy) {

   if ( $Login.Length -lt 8 ) {
       
        Write-Host "ALERT: Login '$Login' is to short!" -ForegroundColor Red
    }
}

$users = @("Alpha", "Bravo", "Charlie", "Delta")
foreach ($user in $users) {
    Write-Host "[IAM LOGIN]'$user'"
}$UserList = @(
    [PSCustomObject]@{Name="Marcin K."; AccountEnabled=$true; Dept="AML"},
    [PSCustomObject]@{Name="Roman N."; AccountEnabled=$false; Dept="IT"},
    [PSCustomObject]@{Name="Konrad B."; AccountEnabled=$false; Dept="Sales"}
)

foreach ($User in $UserList) {
    if ($User.AccountEnabled -eq $false) {
        Write-Host "ALERT: User account $($User.Name) from department $($User.Dept) is suspensed!" -ForegroundColor Red
    }
}