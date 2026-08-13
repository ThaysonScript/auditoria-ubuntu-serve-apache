# 4. Análise e Tratamento de Riscos

## 4.1 Conceito de Risco

Nesta auditoria, risco é analisado como a possibilidade de uma ameaça explorar uma vulnerabilidade e produzir impacto negativo sobre um ativo.

A avaliação qualitativa utiliza a relação conceitual:

> **Risco = Probabilidade × Impacto**

A classificação deve considerar as características do servidor, a exposição do serviço, a importância do ativo e as evidências coletadas durante a auditoria.

## 4.2 Escala Qualitativa

Para esta atividade será utilizada uma escala simples:

### Probabilidade

| Nível | Descrição |
|---|---|
| Alta | A condição apresenta exposição ou facilidade de exploração significativa. |
| Média | A exploração é possível, mas depende de condições adicionais. |
| Baixa | A exploração depende de condições pouco prováveis ou de controles adicionais serem contornados. |

### Impacto

| Nível | Descrição |
|---|---|
| Alto | Pode comprometer significativamente o servidor, seus dados ou sua operação. |
| Médio | Pode produzir comprometimento relevante, porém limitado em escopo ou impacto. |
| Baixo | Consequência limitada para a segurança ou operação do ambiente. |

## 4.3 Matriz de Risco

| Probabilidade \ Impacto | Baixo | Médio | Alto |
|---|---:|---:|---:|
| **Baixa** | Baixo | Baixo | Médio |
| **Média** | Baixo | Médio | Alto |
| **Alta** | Médio | Alto | Alto |

A matriz deve ser usada como apoio à priorização. A justificativa de cada classificação deve ser registrada junto ao respectivo achado.

## 4.4 Risco A01 — Login Root via SSH

**Ativo:** Ubuntu Server / acesso administrativo  
**Ameaça:** tentativa de acesso não autorizado ao servidor  
**Vulnerabilidade:** login direto do `root` via SSH, caso `PermitRootLogin yes` seja confirmado  
**Probabilidade:** Alta  
**Impacto:** Alto  
**Risco:** Alto

### Justificativa

O estudo de caso classifica essa condição como um risco alto porque a conta diretamente exposta possui o maior nível de privilégio do sistema. A permanência dessa configuração amplia o impacto potencial de um comprometimento da autenticação.

### Tratamento

**Mitigar.**

A ação recomendada é desabilitar o login direto do root via SSH e utilizar uma conta administrativa adequada para acesso remoto.

## 4.5 Risco A02 — Apache Desatualizado/Vulnerável

**Ativo:** Apache HTTP Server / serviço web  
**Ameaça:** exploração de vulnerabilidade conhecida  
**Vulnerabilidade:** versão desatualizada e vulnerável, caso confirmada pela análise da E04  
**Probabilidade:** Média  
**Impacto:** Alto  
**Risco:** Médio, conforme a classificação fornecida no estudo de caso

### Justificativa

O estudo de caso classifica a versão desatualizada do Apache como um achado de risco médio. A classificação final deve ser mantida coerente com a evidência real e com a política de avaliação adotada para o laboratório.

### Tratamento

**Mitigar.**

Atualizar o Apache para uma versão corrigida e suportada e realizar nova verificação após a atualização.

## 4.6 Riscos Relacionados às Permissões

**Ativo:** arquivos do site em `/var/www/html`  
**Ameaça:** alteração não autorizada do conteúdo web  
**Vulnerabilidade:** permissões excessivas, caso identificadas  
**Probabilidade:** `preencher`  
**Impacto:** `preencher`  
**Risco:** `preencher`

A classificação deve ser determinada somente após análise da evidência E03.

## 4.7 Riscos Relacionados aos Serviços Expostos

**Ativo:** superfície de rede do servidor  
**Ameaça:** exploração de serviço desnecessariamente exposto  
**Vulnerabilidade:** serviço não necessário ou inadequadamente protegido, caso identificado na E01  
**Probabilidade:** `preencher`  
**Impacto:** `preencher`  
**Risco:** `preencher`

A simples existência de portas abertas não é suficiente para caracterizar um risco. É necessário verificar se o serviço é necessário e se sua configuração atende aos critérios.

## 4.8 Plano de Tratamento

| ID | Risco | Tratamento | Ação | Prioridade |
|---|---|---|---|---|
| A01 | Login root via SSH | Mitigar | Desabilitar `PermitRootLogin` | Alta |
| A02 | Apache vulnerável | Mitigar | Atualizar Apache | Média |
| A03 | Permissões inadequadas | Mitigar, se confirmado | Ajustar proprietário/grupo/permissões | `preencher` |
| A04 | Serviço indevidamente exposto | Mitigar, se confirmado | Remover ou restringir serviço | `preencher` |

## 4.9 Critério de Aceitação

Os riscos devem ser considerados tratados quando a condição que originou o achado tiver sido corrigida e uma nova coleta de evidências demonstrar que o controle passou a atender ao critério estabelecido.
