Import-Module ActiveDirectory

$dominio = "DC=empresa,DC=local"

New-ADOrganizationalUnit -Name "EMPRESA" -Path $dominio -ErrorAction SilentlyContinue

$base = "OU=EMPRESA,$dominio"

$departamentos = @("Administrativo","TI","RH","Financeiro")

foreach ($dep in $departamentos) {

    New-ADOrganizationalUnit -Name $dep -Path $base -ErrorAction SilentlyContinue
    New-ADOrganizationalUnit -Name "Usuarios" -Path "OU=$dep,$base" -ErrorAction SilentlyContinue
    New-ADOrganizationalUnit -Name "Computadores" -Path "OU=$dep,$base" -ErrorAction SilentlyContinue
    New-ADOrganizationalUnit -Name "Grupos" -Path "OU=$dep,$base" -ErrorAction SilentlyContinue
}

New-ADOrganizationalUnit -Name "Infraestrutura" -Path $base -ErrorAction SilentlyContinue
New-ADOrganizationalUnit -Name "Servidores" -Path "OU=Infraestrutura,$base" -ErrorAction SilentlyContinue