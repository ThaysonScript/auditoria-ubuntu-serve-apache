# 3. Análise dos Achados

## 3.1 Método de Análise

A análise consiste em comparar cada evidência coletada com o critério de auditoria correspondente. A diferença entre a situação observada e a situação esperada constitui o *gap* que poderá originar um achado de auditoria.

Cada achado deve ser estruturado a partir de:

- **Condição:** o que foi observado;
- **Critério:** como deveria estar;
- **Causa:** por que a condição ocorreu, quando for possível determinar;
- **Consequência/Risco:** o que pode ocorrer caso a condição permaneça.

A classificação deve ser baseada nas evidências disponíveis e não em suposições.

## 3.2 Achado A01 — Login Root via SSH

### Condição

A configuração observada na evidência E02 deve ser registrada aqui.

**Resultado observado:**

PermitRootLogin yes

### Critério

O acesso administrativo direto da conta `root` via SSH deve ser restringido de acordo com as práticas de hardening e com a política de segurança adotada.

### Causa

Caso `PermitRootLogin yes` seja confirmado, a causa provável é uma configuração inadequada ou não endurecida do serviço SSH.

### Consequência

A conta de maior privilégio do sistema fica diretamente exposta a tentativas de autenticação remota. Uma comprometimento dessa conta pode proporcionar privilégios administrativos completos no servidor.

### Classificação

**Alto**, quando a condição `PermitRootLogin yes` for efetivamente confirmada, conforme o cenário apresentado no estudo de caso.

### Recomendação

Desabilitar o login direto do root via SSH e utilizar uma conta administrativa apropriada, com elevação de privilégios quando necessário.

Exemplo de configuração:

```text
PermitRootLogin no
```

Após a alteração, o serviço deve ser validado e a configuração deve ser novamente verificada.

## 3.3 Achado A02 — Apache Desatualizado ou Vulnerável

### Condição

Resultado observado

Server version: Apache/2.4.66 (Ubuntu)

### Critério

O servidor deve manter seus componentes de software atualizados de acordo com a política de segurança e os requisitos de hardening adotados.

### Causa

Caso uma versão desatualizada seja confirmada, a causa pode estar relacionada à ausência ou atraso no processo de atualização do pacote Apache.

### Consequência

A utilização de uma versão vulnerável pode permitir que vulnerabilidades conhecidas sejam exploradas contra o servidor web, dependendo das condições específicas da vulnerabilidade.

### Classificação

**Médio**, conforme a classificação apresentada no estudo de caso, caso seja confirmada a condição de versão desatualizada e vulnerável.

### Recomendação

Atualizar o Apache para uma versão suportada e corrigida, seguindo o processo de atualização definido para o ambiente.

Exemplo:

```bash
sudo apt update
sudo apt install --only-upgrade apache2
```

Após a atualização, executar novamente:

```bash
apache2 -v
```

## 3.4 Análise das Permissões do Site

### Evidência

E03 — permissões de `/var/www/html`.

### Condição

Registrar o resultado real:

drwxrwxrwx 2 root root  4096 Aug 13 17:26 .

### Critério

Os arquivos do site devem possuir permissões compatíveis com sua finalidade, evitando que usuários ou grupos não autorizados possam modificar conteúdo ou configurações do servidor web.

### Resultado da análise

NÃO CONFORME (Permissões 777 concedem acesso total a qualquer usuário).

### Observação

Este item só deve gerar um achado caso a evidência demonstre uma configuração inadequada em relação ao critério adotado.

## 3.5 Análise dos Serviços Expostos

### Evidência

E01 — resultado do Nmap.

### Condição

Registrar as portas e serviços identificados:

22/tcp open  ssh
80/tcp open  http

### Critério

Os serviços expostos devem ser necessários ao funcionamento do servidor e estar adequadamente configurados.

### Resultado da análise

CONFORME (Apenas serviços essenciais para o propósito do servidor — web e administração — estão expostos).

### Observação

Uma porta aberta não constitui, isoladamente, uma vulnerabilidade. O achado deve ser formulado somente quando houver evidência de exposição indevida ou configuração insegura.

## 3.6 Consolidado dos Achados

| ID | Achado | Evidência | Severidade | Status |
|---|---|---|---|---|
| A01 | Login root via SSH | E02 | Alto, se confirmado | `Confirmado` |
| A02 | Apache desatualizado/vulnerável | E04 | Médio, se confirmado | `Confirmado` |
| A03 | Permissões inadequadas | E03 | `Alto` | `Confirmado` |
| A04 | Serviço indevidamente exposto | E01 | `N/A` | `Conforme(Sem achado)` |

> Os achados A03 e A04 são condicionais. Devem permanecer como não conformidades somente se as evidências coletadas demonstrarem a existência do problema.
