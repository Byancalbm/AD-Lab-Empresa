Import-Module ActiveDirectory

$dominio = "DC=empresa,DC=local"
$departamentos = @("TI","RH","Financeiro","Administrativo")

foreach ($dep in $departamentos) {

    $grupo = "GRP_${dep}_USUARIOS"
    $path = "OU=Grupos,OU=$dep,$dominio"

    New-ADGroup `
        -Name $grupo `
        -GroupScope Global `
        -Path $path `
        -ErrorAction SilentlyContinue

    Write-Host "Grupo criado: $grupo"
}