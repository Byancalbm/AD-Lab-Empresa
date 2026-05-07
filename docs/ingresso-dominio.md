# Ingresso de Máquinas no Domínio

## Objetivo

Adicionar estações Windows ao domínio `empresa.local` para gerenciamento centralizado via Active Directory.

---

## Configuração de Rede

### Domain Controller

```id="0imv0j"
IP: 192.168.7.2
DNS: 192.168.7.2
```

### Cliente

```id="v0we6h"
IP: 192.168.166.129
DNS: 192.168.166.2
```

---

## Ingresso no domínio

A estação `PC-TI-01` foi adicionada ao domínio:

```id="e2t5tq"
empresa.local
```

---

## Organização da estrutura

O computador foi movido para a OU:

```id="lgcajq"
OU=Computadores, OU=TI,OU=EMPRESA,DC=empresa,DC=local
```

---

## Comando utilizado

```powershell id="1r65nq"
Move-ADObject `
-Identity "CN=PC-TI-01,CN=Computers,DC=empresa,DC=local" `
-TargetPath "OU=Computadores,OU=TI,OU=Empresa, DC=empresa,DC=local"
```

---

## Troubleshooting realizado

Durante o processo foi identificado bloqueio por proteção contra exclusão acidental no objeto do Active Directory.

A correção foi realizada através da remoção da opção:

```id="9o1btr"
Protect object from accidental deletion
```

---

## Resultado

* Estação ingressada com sucesso
* Organização lógica por departamento
* Estrutura pronta para aplicação de GPO
