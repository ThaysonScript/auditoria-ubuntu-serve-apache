# 2. Coleta de Evidências

## 2.1 Objetivo da Coleta

A coleta de evidências tem como finalidade registrar de forma objetiva a situação do servidor no momento da auditoria. Cada evidência deverá permitir a comparação entre a configuração observada e os critérios definidos no planejamento.

As evidências devem ser coletadas antes de qualquer alteração de configuração, sempre que possível, para preservar o estado original utilizado na análise.

## 2.2 Identificação do Servidor

Registrar as informações básicas do ambiente auditado:

| Informação | Resultado |
|---|---|
| Sistema operacional | `preencher` |
| Endereço IP | `preencher` |
| Hostname | `preencher` |
| Data da coleta | `preencher` |
| Auditor | `preencher` |

> O endereço IP pode ser anonimizado caso o resultado seja publicado em um repositório público.

## 2.3 Evidência E01 — Serviços e Portas Expostas

### Comando

```bash
nmap -sV <IP_SERVIDOR>
```

### Objetivo

Identificar portas abertas, serviços acessíveis e versões detectadas pelo Nmap.

### Resultado

Registrar aqui o resultado obtido:

```text
COLE A SAÍDA DO NMAP AQUI
```

### Interpretação

Registrar quais serviços foram identificados e verificar se cada serviço exposto é esperado dentro do escopo do servidor.

A presença de uma porta aberta não deve ser classificada automaticamente como vulnerabilidade. O resultado deve ser analisado considerando a necessidade do serviço e os critérios de segurança definidos.

## 2.4 Evidência E02 — Configuração de Login Root via SSH

### Comando

```bash
sudo grep PermitRootLogin /etc/ssh/sshd_config
```

### Objetivo

Verificar se o acesso direto da conta `root` via SSH está habilitado.

### Resultado

Registrar aqui o resultado obtido:

```text
COLE A SAÍDA DO COMANDO AQUI
```

### Interpretação

- `PermitRootLogin yes`: indica que o login direto do root está habilitado e deve ser tratado como possível não conformidade de alto risco no contexto do estudo de caso;
- `PermitRootLogin no`: indica que o login direto do root está desabilitado;
- ausência da diretiva ou configuração diferente: deve ser analisada considerando a configuração efetiva do OpenSSH e o critério adotado.

## 2.5 Evidência E03 — Permissões dos Arquivos Web

### Comando

```bash
sudo ls -la /var/www/html
```

### Objetivo

Verificar proprietário, grupo e permissões dos arquivos utilizados pelo servidor web.

### Resultado

Registrar aqui o resultado obtido:

```text
COLE A SAÍDA DO COMANDO AQUI
```

### Interpretação

Avaliar se as permissões permitem somente as operações necessárias e se usuários não autorizados possuem capacidade indevida de modificar os arquivos do site.

Não classificar uma permissão como vulnerável apenas pela aparência do modo numérico ou simbólico. A análise deve considerar proprietário, grupo, finalidade do arquivo e necessidade operacional.

## 2.6 Evidência E04 — Versão do Apache

### Comando

```bash
apache2 -v
```

### Objetivo

Identificar a versão instalada do Apache HTTP Server e verificar posteriormente se ela está atualizada e se existem vulnerabilidades conhecidas relevantes para a versão encontrada.

### Resultado

Registrar aqui o resultado obtido:

```text
COLE A SAÍDA DO COMANDO AQUI
```

### Interpretação

A versão encontrada deve ser comparada com o estado de atualização esperado para o ambiente. Caso seja identificada uma vulnerabilidade conhecida, registrar a referência correspondente e explicar sua relação com a versão observada.

O identificador `CVE-2023-XXXX` apresentado no estudo de caso é apenas um exemplo ilustrativo e não deve ser tratado como uma CVE real sem verificação.

## 2.7 Registro das Evidências

| ID | Evidência | Comando | Resultado | Status |
|---|---|---|---|---|
| E01 | Serviços e portas | `nmap -sV` | `preencher` | `preencher` |
| E02 | Login root via SSH | `grep PermitRootLogin` | `preencher` | `preencher` |
| E03 | Permissões web | `ls -la /var/www/html` | `preencher` | `preencher` |
| E04 | Versão Apache | `apache2 -v` | `preencher` | `preencher` |

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
