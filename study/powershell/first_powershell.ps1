
$Logins = "m.kowalski", "j.nowak", "adm", "k.bob", "service_account_iam"

Write-Host "--- LOGIN LENGTH CHECKING ... ---" -ForegroundColor Cyan


foreach ($Login in $Logins) {

   if ( $Login.Length -lt 8 ) {

        Write-Host "ALERT: Login '$Login' is too short!" -ForegroundColor Red
    }
}

$users = @("Alpha", "Bravo", "Charlie", "Delta")
foreach ($user in $users) {
    Write-Host "[IAM LOGIN]'$user'"
}

$UserList = @(
    [PSCustomObject]@{Name="Martin K."; AccountEnabled=$true; Dept="AML"},
    [PSCustomObject]@{Name="Robert J."; AccountEnabled=$false; Dept="IT"},
    [PSCustomObject]@{Name="Conrad B."; AccountEnabled=$false; Dept="Sales"}
)

foreach ($User in $UserList) {
    if ($User.AccountEnabled -eq $false) {
        Write-Host "ALERT: User account $($User.Name) from department $($User.Dept) is suspended!" -ForegroundColor Red
    }
}