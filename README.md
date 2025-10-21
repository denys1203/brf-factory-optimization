# Otimização de Operações Industriais - BRF

[![Python](https://img.shields.io/badge/Python-3.8%2B-blue)](https://www.python.org/)
[![Jupyter](https://img.shields.io/badge/Jupyter-Notebook-orange)](https://jupyter.org/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Optimization](https://img.shields.io/badge/Optimization-Linear_Programming-red)](https://github.com)

## Visão Geral

Projeto de **otimização de operações industriais** desenvolvido para análise competitiva de fábricas de produção. O objetivo é determinar a melhor estratégia de investimento e alocação de recursos considerando crescimento de demanda, eficiência operacional e retorno financeiro.

### Problema de Negócio

Uma empresa opera **3 fábricas** produzindo **5 tipos de produtos**, com diferentes:
- Capacidades produtivas
- Custos operacionais (fixos e variáveis)
- Eficiências de produção
- Estruturas tributárias (ICMS)

**Desafio:** Determinar qual(is) fábrica(s) expandir em 60% de capacidade e qual(is) encerrar, considerando:
- Atender 100% da demanda projetada para 5 anos
- Maximizar retorno financeiro
- Minimizar payback do investimento

---

## Metodologia

### 1. **Modelagem de Capacidade**
Cálculo da capacidade entregável considerando:
- Eficiência operacional
- Taxa de descarte (produtos fora do padrão)
- Dias úteis vs. sábados

$$
\text{Cap}_{\text{entregável}} = \left[\left(\text{Cap}_{\text{seg-sex}} \times 22\right) + \left(\text{Cap}_{\text{sáb}} \times 4\right)\right] \times \text{Eficiência} \times (1 - \text{Descarte})
$$

### 2. **Contribuição Unitária**
Análise de *unit economics* por fábrica e produto:

$$
\text{Contrib}_{p,f} = \text{Preço}_p \times (1-\text{ICMS}_f) - \text{Frete}_p - \frac{\text{CV}_{p,f}}{1-\text{Descarte}_f}
$$

### 3. **Otimização de Alocação**
Problema de programação linear (heurística greedy):

$$
\max \sum_{p,f} \text{Contrib}_{p,f} \times x_{p,f}
$$

Sujeito a:
$$
\sum_f x_{p,f} = \text{Demanda}_p \quad \forall p \qquad \sum_p x_{p,f} \leq \text{Cap}_f \quad \forall f
$$

### 4. **Análise de Cenários**
Enumeração exaustiva de todas as combinações de:
- Expansão (+60% de capacidade)
- Fechamento de unidades
- Filtro: apenas cenários que atendem 100% da demanda

### 5. **Métricas Financeiras**

**Ganho Incremental Mensal (Δ):**
$$
\Delta = (\text{Lucro}_{\text{cenário}} - \text{FolhaExtra} + \text{FixosFechados}) - \text{Lucro}_{\text{baseline}}
$$

**Payback:**
$$
\text{Payback (meses)} = \frac{\text{CAPEX}}{\Delta}
$$

---

## Principais Resultados

### Solução Ótima

| Métrica | Valor |
|---------|-------|
| **Estratégia** | Expandir Fábricas A + B / Fechar Fábrica C |
| **Ganho Mensal (Δ)** | R$ 688.470 |
| **CAPEX** | R$ 8.000.000 |
| **Payback** | **11,6 meses** |
| **Demanda Atendida** | 100% (7.036 t/mês) |

### Comparativo de Cenários

**Insight-chave:** A solução ótima combina:
- Expansão nas fábricas com melhor unit economics (A e B têm custos variáveis menores e ICMS mais competitivo)
- Economia de R$ 500k/mês em custos fixos com fechamento da Fábrica C
- ROI de 8,6% ao mês (payback de 11,6 meses)

---

## Como Executar

### Pré-requisitos
```bash
python >= 3.8
```

### Instalação
```bash
# Clone o repositório
git clone https://github.com/seu-usuario/brf-optimization.git
cd brf-optimization

# Crie um ambiente virtual
python -m venv venv
source venv/bin/activate  # No Windows: venv\Scripts\activate

# Instale as dependências
pip install -r requirements.txt
```

### Execução
```bash
# Inicie o Jupyter Notebook
jupyter notebook

# Abra: notebooks/otimizacao_BRF_Denys.ipynb
```

---

## Estrutura do Projeto

```
brf-optimization/
│
├── notebooks/
│   └── otimizacao_BRF_Denys.ipynb    # Notebook principal com análise completa
│
├── data/                              # (Dados embutidos no notebook)
│
├── outputs/                           # Relatórios HTML e gráficos
│
├── docs/                              # Documentação adicional
│   └── case_description.md
│
├── requirements.txt                   # Dependências Python
├── .gitignore
└── README.md
```

---

## Tecnologias Utilizadas

- **Python 3.x** - Linguagem principal
- **Pandas** - Manipulação e análise de dados
- **NumPy** - Computação numérica
- **Matplotlib** - Visualizações
- **Jupyter Notebook** - Ambiente de desenvolvimento interativo
- **Programação Linear** - Otimização (heurística greedy)

---

## Detalhamento Técnico

### Passo 1: Análise da Situação Atual
- Cálculo de capacidade entregável comparável
- Matriz de contribuição unitária (15 combinações produto × fábrica)
- Alocação ótima da demanda atual
- P&L mensal por fábrica

### Passo 2: Projeção Futura (5 anos)
- Crescimento de demanda: +10% a.a. → **+61% acumulado**
- Teste individual de expansões (+60% de capacidade)
- Cálculo de payback e ganho incremental

### Passo 3: Otimização Combinatória
- **Power set**: 2³ × 2² = 32 combinações teóricas
- Filtro de viabilidade: atendimento de 100% da demanda
- **8 cenários admissíveis** identificados
- Critérios de seleção: (1) max Δ, (2) min payback, (3) min CAPEX

---

## Análise de Sensibilidade

### Cenários Admissíveis (100% Demanda Atendida)

| # | Expandir | Fechar | Δ Mensal | Payback | CAPEX |
|---|----------|--------|----------|---------|-------|
| 1 | A, B | C | R$ 688k | 11,6 m | R$ 8M |
| 2 | A, C | B | R$ 648k | 11,6 m | R$ 7,5M |
| 3 | A, B | - | R$ 138k | 58,0 m | R$ 8M |
| 4 | B, C | A | R$ 98k | 56,1 m | R$ 5,5M |
| ... | ... | ... | ... | ... | ... |

> **Observação:** Todos os cenários que incluem fechamento de fábrica mostram **payback significativamente melhor** devido à economia de custos fixos.

---

## Insights e Recomendações

### Recomendação Estratégica
**Expandir Fábricas A e B (+60%) e encerrar operação da Fábrica C**

**Justificativa:**
1. **Retorno rápido**: Payback de apenas 11,6 meses
2. **Maior ganho operacional**: R$ 688k/mês adicional
3. **Eficiência tributária**: Redução de ICMS (A=18%, B=15% vs C=16,5%)
4. **Custos variáveis**: A e B têm CV ~R$ 20/t menores que C por produto
5. **Economia de fixos**: R$ 500k/mês eliminados com fechamento de C

### Análise de Risco
- **Capacidade instalada pós-expansão**: 7.300 t/mês
- **Demanda ano 5**: 7.036 t/mês
- **Margem de segurança**: 3,8% (folga para volatilidade)

### Próximos Passos Sugeridos
1. Análise de VPL/TIR considerando valor do dinheiro no tempo
2. Estudo de sensibilidade para variações de demanda (±10%)
3. Avaliação de custos de transição (rescisões, logística)
4. Análise de impacto social/regional do fechamento

---

## Referências e Contexto

Este projeto foi desenvolvido como parte de um processo seletivo para **Especialista em Otimização (OTM)** na BRF S.A., uma das maiores empresas de alimentos do mundo.

### Conceitos Aplicados
- Pesquisa Operacional
- Programação Linear
- Análise de Investimentos (Payback, ROI)
- Unit Economics
- Gestão de Operações Industriais

---

## Autor

**Denys Santos**

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue)](https://linkedin.com/in/seu-perfil)
[![GitHub](https://img.shields.io/badge/GitHub-Follow-black)](https://github.com/seu-usuario)
[![Email](https://img.shields.io/badge/Email-Contact-red)](mailto:seu-email@example.com)

---

## Licença

Este projeto está sob a licença MIT - veja o arquivo [LICENSE](LICENSE) para detalhes.

---

## Agradecimentos

- BRF S.A. pela oportunidade e pelo case desafiador
- Comunidade Python/Data Science pelas ferramentas open-source

---

<p align="center">
  <i>Desenvolvido para otimização de operações industriais</i>
</p>

