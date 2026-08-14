# 2. Coleta de Evidências

## 2.1 Objetivo da Coleta

A coleta de evidências tem como finalidade registrar de forma objetiva a situação do servidor no momento da auditoria. Cada evidência deverá permitir a comparação entre a configuração observada e os critérios definidos no planejamento.

As evidências devem ser coletadas antes de qualquer alteração de configuração, sempre que possível, para preservar o estado original utilizado na análise.

## 2.2 Identificação do Servidor

Registrar as informações básicas do ambiente auditado:

| Informação | Resultado |
|---|---|
| Sistema operacional | Ubuntu Linux (WSL) |
| Endereço IP | `XXX.XXX.XXX.XXX` (Anonimizado) |
| Hostname | `LAPTOP-TCLE4H9L` |
| Data da coleta | 13/08/2026 |
| Auditor | Pedro Arthur Batista Pinheiro |

> O endereço IP pode ser anonimizado caso o resultado seja publicado em um repositório público.

## 2.3 Evidência E01 — Serviços e Portas Expostas

### Comando

```bash
nmap -sV <IP_SERVIDOR>

## 2.3 Evidência E01 — Serviços e Portas Expostas

### Comando

```bash
nmap -sV <IP_SERVIDOR>
```

### Objetivo

Identificar portas abertas, serviços acessíveis e versões detectadas pelo Nmap.

### Resultado

Starting Nmap 7.98 ( [https://nmap.org](https://nmap.org) ) at 2026-08-13 19:57 -0300
Nmap scan report for localhost (127.0.0.1)
Host is up (0.000038s latency).
Other addresses for localhost (not scanned): ::1
Not shown: 998 closed tcp ports (conn-refused)
PORT   STATE SERVICE VERSION
22/tcp open  ssh     OpenSSH 10.2p1 Ubuntu 2ubuntu3.5 (Ubuntu Linux; protocol 2.0)
80/tcp open  http    Apache httpd 2.4.66 ((Ubuntu))
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Service detection performed. Please report any incorrect results at [https://nmap.org/submit/](https://nmap.org/submit/) .
Nmap done: 1 IP address (1 host up) scanned in 6.41 seconds

### Interpretação

Foram identificados dois serviços em execução:

Porta 22 (SSH): Rodando o serviço OpenSSH versão 10.2p1. Serviço esperado para administração remota.

Porta 80 (HTTP): Rodando o serviço web Apache versão 2.4.66. Serviço esperado para o servidor web.

Os serviços expostos condizem com o escopo do servidor.

## 2.4 Evidência E02 — Configuração de Login Root via SSH

### Comando

sudo grep PermitRootLogin /etc/ssh/sshd_config

### Objetivo

Verificar se o acesso direto da conta `root` via SSH está habilitado.

### Resultado

PermitRootLogin yes
# the setting of "PermitRootLogin prohibit-password".

### Interpretação

PermitRootLogin yes: indica que o login direto do root está habilitado e deve ser tratado como uma não conformidade de alto risco no contexto da auditoria, pois permite acesso administrativo remoto direto.

## 2.5 Evidência E03 — Permissões dos Arquivos Web

### Comando

sudo ls -la /var/www/html

### Objetivo

Verificar proprietário, grupo e permissões dos arquivos utilizados pelo servidor web.

### Resultado

total 20
drwxrwxrwx 2 root root  4096 Aug 13 17:26 .
drwxr-xr-x 3 root root  4096 Aug 13 17:26 ..
-rw-r--r-- 1 root root 10672 Aug 13 17:26 index.html

### Interpretação

As permissões do diretório atual (.) estão definidas como drwxrwxrwx (modo 777). Isso significa que qualquer usuário do sistema, autorizado ou não, possui capacidade total de ler, gravar e executar (modificar) os arquivos do site. Essa configuração é excessiva e representa um risco de segurança.

## 2.6 Evidência E04 — Versão do Apache

### Comando

apache2 -v

### Objetivo

Identificar a versão instalada do Apache HTTP Server e verificar posteriormente se ela está atualizada e se existem vulnerabilidades conhecidas relevantes para a versão encontrada.

### Resultado

Server version: Apache/2.4.66 (Ubuntu)
Server built:   2026-07-06T15:33:20

### Interpretação

A versão encontrada é o Apache/2.4.66. Esta informação deve ser comparada com as bases de vulnerabilidade e os requisitos de atualização adotados para verificar se há vulnerabilidades conhecidas relevantes para esta versão específica no ambiente atual.

## 2.7 Registro das Evidências

| ID | Evidência | Comando | Resultado | Status |
|---|---|---|---|---|
| E01 | Serviços e portas | `nmap -sV` | `Portas 22 e 80 abertas` | `Coletado`|
| E02 | Login root via SSH | `grep PermitRootLogin` | `PermitRootLogin yes` | `Coletado` |
| E03 | Permissões web | `ls -la /var/www/html` | `Permissões 777 no diretório raizr` | `Coletado` |
| E04 | Versão Apache | `apache2 -v` | `Apache/2.4.66` | `Coletado` |

## 2.8 Evidências Visuais

Capturas de tela relevantes podem ser armazenadas no diretório `screenshots/`.

Sugestão de nomenclatura:

```text
screenshots/
├── 01-nmap.png
├── 02-ssh.png
├── 03-permissoes.png
└── 04-apache.png
```

As capturas devem complementar, e não substituir, o registro textual das evidências.
