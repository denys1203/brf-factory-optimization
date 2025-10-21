# 📋 Descrição Detalhada do Case - BRF

## Contexto do Desafio

Você é o **especialista de otimização** de uma empresa que possui três fábricas (Fábrica A, Fábrica B e Fábrica C). Todas produzem cinco tipos de salsichas (Produto 1, Produto 2, Produto 3, Produto 4, Produto 5).

## Objetivo

Analisar os dados financeiros e de produção para determinar:
1. **Qual fábrica é mais competitiva**
2. **Em qual(is) unidade(s) investir** para aumentar a capacidade mensal em 60%
3. **Qual(is) deveria(m) ter sua operação encerrada**

A resposta deve ser **embasada financeiramente** e apresentar **direcional estratégico** como responsável pelo projeto.

---

## 📊 Dados Fornecidos

### 1. Capacidade de Produção Nominal

#### Segunda a Sexta-feira
- **Fábrica A:** 120 toneladas/dia
- **Fábrica B:** 110 toneladas/dia
- **Fábrica C:** 100 toneladas/dia

#### Sábados
- **Fábrica A:** 100 toneladas/dia
- **Fábrica B:** 80 toneladas/dia
- **Fábrica C:** 50 toneladas/dia

---

### 2. Eficiência de Produção
- **Fábrica A:** 80%
- **Fábrica B:** 82%
- **Fábrica C:** 90%

---

### 3. Distribuição de Demanda Mensal Atual
- **Produto 1:** 1.450 toneladas
- **Produto 2:** 1.200 toneladas
- **Produto 3:** 800 toneladas
- **Produto 4:** 660 toneladas
- **Produto 5:** 260 toneladas

**Total:** 4.370 toneladas/mês

---

### 4. Custo Fixo Mensal
- **Fábrica A:** R$ 600.000
- **Fábrica B:** R$ 550.000
- **Fábrica C:** R$ 500.000

---

### 5. Custo Variável por Tonelada Produzida

| Produto | Fábrica A | Fábrica B | Fábrica C |
|---------|-----------|-----------|-----------|
| Produto 1 | R$ 180 | R$ 190 | R$ 200 |
| Produto 2 | R$ 200 | R$ 210 | R$ 220 |
| Produto 3 | R$ 220 | R$ 230 | R$ 240 |
| Produto 4 | R$ 240 | R$ 250 | R$ 260 |
| Produto 5 | R$ 260 | R$ 270 | R$ 280 |

---

### 6. Preço de Venda por Tonelada
- **Produto 1:** R$ 1.200
- **Produto 2:** R$ 1.300
- **Produto 3:** R$ 1.400
- **Produto 4:** R$ 1.500
- **Produto 5:** R$ 1.600

---

### 7. Custo de Frete
- **Exportação (Produtos 2 e 5):** R$ 50 por tonelada
- **Mercado Interno (Produtos 1, 3 e 4):** R$ 30 por tonelada

---

### 8. Imposto ICMS (sobre preço de venda)
- **Fábrica A:** 18%
- **Fábrica B:** 15%
- **Fábrica C:** 16,5%

---

### 9. Percentual de Produção Fora do Padrão (descarte)
Em relação à capacidade produtiva:
- **Fábrica A:** 2%
- **Fábrica B:** 3%
- **Fábrica C:** 4%

---

### 10. Previsão de Demanda
A empresa prevê que a demanda **crescerá 10% ao ano** nos próximos 5 anos.

$$
\text{Demanda}_{ano\ 5} = \text{Demanda}_{atual} \times (1,10)^5 \approx \text{Demanda}_{atual} \times 1,61
$$

---

### 11. Investimento para Aumentar Capacidade em 60%

| Fábrica | CAPEX | Novas Contratações | Salário Médio Mensal |
|---------|-------|-------------------|---------------------|
| **A** | R$ 5.000.000 | 10 pessoas | R$ 5.000 |
| **B** | R$ 3.000.000 | 22 pessoas | R$ 5.500 |
| **C** | R$ 2.500.000 | 28 pessoas | R$ 5.500 |

**Folha mensal adicional:**
- **Fábrica A:** R$ 50.000/mês
- **Fábrica B:** R$ 121.000/mês
- **Fábrica C:** R$ 154.000/mês

---

## 🎯 Critérios de Sucesso

A solução deve:

1. ✅ **Atender 100% da demanda projetada** para 5 anos
2. ✅ **Maximizar o retorno financeiro** (lucro operacional)
3. ✅ **Minimizar o payback** do investimento
4. ✅ Apresentar **justificativa técnica e financeira** robusta
5. ✅ Considerar **trade-offs** entre CAPEX, custos operacionais e receita

---

## 📐 Variáveis de Decisão

### Decisões Binárias
- **Expandir:** Qual(is) fábrica(s) recebe(m) investimento de +60% capacidade?
- **Fechar:** Qual(is) fábrica(s) tem(têm) operação encerrada?

### Restrições
1. Fábrica expandida ≠ fábrica fechada (disjuntas)
2. Capacidade total ≥ demanda futura
3. Alocação de produção deve respeitar capacidades físicas

---

## 💼 Entregáveis Esperados

1. **Análise da situação atual** (baseline)
   - Capacidade entregável por fábrica
   - P&L atual por unidade
   - Identificação de gargalos

2. **Projeção futura** (5 anos)
   - Demanda projetada
   - Gap de capacidade
   - Necessidade de investimento

3. **Análise de cenários**
   - Cenários de expansão individual
   - Cenários combinados (expandir + fechar)
   - Ranking por payback e lucro incremental

4. **Recomendação estratégica**
   - Cenário escolhido
   - Justificativa financeira (ROI, payback, Δ lucro)
   - Análise de riscos
   - Plano de implementação

---

## 🔍 Complexidade do Problema

### Dimensões do Problema
- **3 fábricas** × **5 produtos** = 15 combinações de produção
- **2³ = 8** opções de expansão (incluindo nenhuma)
- **2³ = 8** opções de fechamento (incluindo nenhuma)
- **~64 combinações teóricas** (muitas inviáveis)

### Desafios
1. **Multi-objetivo:** Maximizar lucro vs. minimizar payback
2. **Restrições de capacidade:** Não linear (eficiência × descarte)
3. **Economia de escopo:** Custos fixos diluídos
4. **Tributação diferenciada:** ICMS varia por fábrica (localização)
5. **Custos de transição:** Não explícitos no case

---

## 📈 Abordagem de Solução

### Fase 1: Modelagem
- Calcular capacidade entregável real
- Construir matriz de contribuição unitária
- Desenvolver modelo de alocação ótima

### Fase 2: Otimização
- Implementar algoritmo de alocação (programação linear)
- Simular todos os cenários admissíveis
- Filtrar por viabilidade (100% demanda)

### Fase 3: Análise
- Calcular métricas financeiras (Δ lucro, payback)
- Ranquear cenários
- Selecionar solução ótima

### Fase 4: Recomendação
- Documentar escolha
- Apresentar trade-offs
- Sugerir próximos passos

---

## 🎓 Conceitos-Chave Aplicados

1. **Pesquisa Operacional**
   - Programação Linear
   - Problema de Transporte
   - Otimização Combinatória

2. **Análise Financeira**
   - Margem de Contribuição
   - Payback
   - ROI (Return on Investment)
   - Análise de Break-even

3. **Gestão Industrial**
   - OEE (Overall Equipment Effectiveness)
   - Capacidade Nominal vs. Efetiva
   - Economia de Escala vs. Escopo

4. **Modelagem de Custos**
   - Custos Fixos vs. Variáveis
   - Custo de Oportunidade
   - Unit Economics

---

## 📌 Observações Importantes

1. **Simplificações assumidas:**
   - Demanda cresce uniformemente para todos os produtos
   - Preços de venda constantes (sem inflação)
   - Capacidade expandida está disponível imediatamente
   - Sem custos de transição explícitos

2. **Fatores não considerados (mas relevantes em caso real):**
   - Valor do dinheiro no tempo (TMA, VPL, TIR)
   - Risco de demanda (volatilidade)
   - Impacto social do fechamento
   - Custos logísticos inter-fábricas
   - Flexibilidade operacional (opções reais)

---

## 📚 Referências Conceituais

- Hillier, F. S., & Lieberman, G. J. (2013). *Introduction to Operations Research*
- Horngren, C. T., et al. (2015). *Cost Accounting: A Managerial Emphasis*
- Ross, S. A., et al. (2019). *Corporate Finance*

---

<p align="center">
  <i>Este documento descreve o case original fornecido pela BRF S.A.</i>
</p>

