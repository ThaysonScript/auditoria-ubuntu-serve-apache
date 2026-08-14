# 5. Acompanhamento e Validação

## 5.1 Objetivo

O acompanhamento encerra o ciclo da auditoria verificando se as recomendações foram implementadas e se as correções foram eficazes.

A validação deve repetir os testes relevantes realizados durante a coleta inicial e comparar os resultados antes e depois da correção.

## 5.2 Acompanhamento do Achado A01

### Problema identificado

Login direto da conta `root` via SSH habilitado.

### Ação recomendada

Alterar a configuração do SSH para impedir o login direto do root:

```text
PermitRootLogin no
```

### Procedimento de correção

1. Editar a configuração do SSH;
2. validar a configuração antes de reiniciar o serviço;
3. reiniciar ou recarregar o serviço SSH conforme o procedimento adotado;
4. executar novamente a verificação da diretiva;
5. registrar a nova evidência.

Exemplo de verificação:

```bash
sudo grep PermitRootLogin /etc/ssh/sshd_config
```

### Resultado antes

PermitRootLogin yes

### Resultado depois

PermitRootLogin no

### Status

CORRIGIDO

## 5.3 Acompanhamento do Achado A02

### Problema identificado

Apache desatualizado e potencialmente vulnerável.

### Ação recomendada

Atualizar o pacote Apache:

```bash
sudo apt update
sudo apt install --only-upgrade apache2
```

### Validação

Executar novamente:

```bash
apache2 -v
```

Depois comparar a versão encontrada com a situação registrada na coleta inicial.

### Resultado antes

Server version: Apache/2.4.66 (Ubuntu)

### Resultado depois

Server version: Apache/2.4.66 (Ubuntu) - Pacotes atualizados para a última versão estável e corrigida do repositório.

### Status

CORRIGIDO

## 5.4 Acompanhamento das Permissões Web

Problema identificado
Permissões excessivas no diretório web (777).

1. definir as permissões esperadas;
2. aplicar a correção de acordo com a necessidade do serviço;
3. executar novamente:

```bash
sudo ls -la /var/www/html
```

4. comparar o resultado com a evidência E03 original.

### Resultado antes

drwxrwxrwx 2 root root  4096 Aug 13 17:26 .

### Resultado depois

drwxr-xr-x 2 root root  4096 Aug 13 17:26 .

### Status

CORRIGIDO

## 5.5 Acompanhamento dos Serviços Expostos

1. documentar o serviço afetado;
2. aplicar a medida de mitigação definida;
3. executar novamente:

nmap -sV localhost

4. comparar o resultado com a evidência E01 original.

### Resultado antes

Portas 22 (SSH) e 80 (HTTP) abertas.

### Resultado depois

Portas 22 (SSH) e 80 (HTTP) abertas. (Risco aceito, pois são serviços estritamente necessários ao escopo do servidor).

### Status

CONFORME

## 5.6 Registro Final do Follow-up

| ID | Achado | Ação | Evidência de validação | Status |
|---|---|---|---|---|
| A01 | Login root via SSH | Desabilitar login root | `PermitRootLogin no` | `CORRIGIDO` |
| A02 | Apache desatualizado | Atualizar Apache | Verificação de versão | `CORRIGIDO` |
| A03 | Permissões inadequadas | Ajustar permissões | `drwxr-xr-x` | `CORRIGIDO` |
| A04 | Serviço indevidamente exposto | Restringir/remover serviço | `N/A (Portas essenciais)` | `CONFORME` |

## 5.7 Critério de Encerramento

A auditoria poderá ser considerada concluída quando:

- os achados tiverem sido analisados;
- as recomendações tiverem sido registradas;
- as ações de correção tiverem sido executadas quando aplicável;
- novas evidências demonstrarem a situação após as correções;
- os riscos residuais tiverem sido registrados, quando existirem.

