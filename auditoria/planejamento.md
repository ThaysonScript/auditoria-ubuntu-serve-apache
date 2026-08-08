# 1. Planejamento da Auditoria

## 1.1 Identificação

**Projeto:** Auditoria de Segurança de Servidor Web Linux  
**Ativo auditado:** Ubuntu Server com Apache HTTP Server  
**Tipo de auditoria:** Auditoria de segurança técnica em ambiente de laboratório  
**Abordagem:** Verificação baseada em evidências

## 1.2 Objetivo

Verificar a segurança básica de um servidor Apache em Ubuntu Server, identificando possíveis não conformidades relacionadas à exposição de serviços, acesso administrativo via SSH, permissões dos arquivos do site e atualização do servidor Apache.

O objetivo da auditoria é avaliar as configurações observadas em relação aos critérios definidos e identificar riscos que possam comprometer a segurança do servidor.

## 1.3 Escopo

A auditoria está limitada aos seguintes componentes do servidor:

- Sistema operacional Ubuntu Server;
- servidor web Apache HTTP Server;
- serviço SSH utilizado para administração remota;
- diretório `/var/www/html` utilizado para os arquivos do site;
- serviços de rede identificáveis por meio de varredura com Nmap.

Não fazem parte do escopo desta atividade testes de invasão, exploração ativa de vulnerabilidades, análise de código da aplicação, auditoria física ou avaliação completa da infraestrutura de rede.

## 1.4 Critérios de Auditoria

Os resultados serão avaliados com base nos seguintes critérios:

1. **CIS Benchmark para Ubuntu**, utilizado como referência de boas práticas de configuração e hardening do sistema;
2. **Política interna de segurança**, utilizada como referência para os controles de acesso e segurança esperados no ambiente.

Quando um requisito específico não puder ser confirmado apenas pelas evidências coletadas, essa limitação deverá ser registrada no relatório, evitando conclusões sem evidência suficiente.

## 1.5 Metodologia

A auditoria seguirá as seguintes fases:

1. **Planejamento:** definição do escopo, objetivos e critérios;
2. **Coleta de evidências:** execução dos testes técnicos definidos para o estudo de caso;
3. **Análise:** comparação entre a situação observada e os critérios estabelecidos;
4. **Relatório:** documentação dos achados, riscos e recomendações;
5. **Acompanhamento:** nova verificação após as correções para avaliar se os controles foram efetivamente ajustados.

## 1.6 Ferramentas

- Ubuntu Server;
- Apache HTTP Server;
- OpenSSH;
- Nmap;
- ferramentas de linha de comando do Linux;
- scripts `scripts/auditoria_servidor.sh` e `scripts/auditoria_hospedeiro.sh` para apoio à coleta de evidências.

## 1.7 Premissas

A auditoria deve ser executada em ambiente autorizado e controlado. Os resultados registrados no repositório devem representar somente o ambiente de laboratório utilizado na atividade.

Informações sensíveis, credenciais, chaves privadas e outros dados que não sejam necessários para demonstrar os resultados da auditoria não devem ser armazenados no repositório.
