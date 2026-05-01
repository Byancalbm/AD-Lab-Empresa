$usuarios = Import-Csv "..\data\onboarding1.csv" -Delimiter ";"

foreach ($u in $usuarios) {

    $nome = $u.Nome
    $sobrenome = $u.Sobrenome

    $sam = ($nome.Substring(0,1) + $sobrenome).ToLower()

    $ouPath = "OU=Usuarios,OU=$($u.Departamento),OU=EMPRESA,DC=empresa,DC=local"

    New-ADUser `
        -Name "$nome $sobrenome" `
        -GivenName $nome `
        -Surname $sobrenome `
        -SamAccountName $sam `
        -UserPrincipalName "$sam@empresa.local" `
        -Path $ouPath `
        -AccountPassword (ConvertTo-SecureString "Senha@123" -AsPlainText -Force) `
        -Enabled $true
}