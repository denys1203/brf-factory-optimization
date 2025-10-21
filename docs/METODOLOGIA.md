# 📐 Metodologia Detalhada

## Visão Geral da Abordagem

Este documento detalha a metodologia matemática e algorítmica utilizada na otimização de operações industriais.

---

## 1. Modelagem de Capacidade

### 1.1 Capacidade Nominal

A capacidade nominal considera diferentes produtividades em dias úteis e sábados:

$$
\text{Cap}_{\text{nominal},f} = \left(\text{Cap}_{\text{seg-sex},f} \times 22\right) + \left(\text{Cap}_{\text{sáb},f} \times 4\right)
$$

**Onde:**
- \(f\) = fábrica (A, B ou C)
- 22 = dias úteis (segunda a sexta) por mês
- 4 = sábados por mês

**Exemplo (Fábrica A):**
$$
\text{Cap}_{\text{nominal},A} = (120 \times 22) + (100 \times 4) = 2.640 + 400 = 3.040 \text{ t/mês}
$$

---

### 1.2 Capacidade Útil (Ajustada por Eficiência)

Incorpora a eficiência operacional real da planta:

$$
\text{Cap}_{\text{útil},f} = \text{Cap}_{\text{nominal},f} \times \eta_f
$$

**Onde:**
- \(\eta_f\) = eficiência operacional da fábrica \(f\)

**Exemplo (Fábrica A):**
$$
\text{Cap}_{\text{útil},A} = 3.040 \times 0{,}80 = 2.432 \text{ t/mês}
$$

---

### 1.3 Capacidade Entregável (Ajustada por Descarte)

Remove produtos fora do padrão (waste/scrap):

$$
\text{Cap}_{\text{entregável},f} = \text{Cap}_{\text{útil},f} \times (1 - d_f)
$$

**Onde:**
- \(d_f\) = taxa de descarte da fábrica \(f\)

**Exemplo (Fábrica A):**
$$
\text{Cap}_{\text{entregável},A} = 2.432 \times (1 - 0{,}02) = 2.432 \times 0{,}98 = 2.383{,}4 \text{ t/mês}
$$

**Resumo para todas as fábricas:**

| Fábrica | Cap. Nominal | Eficiência | Cap. Útil | Descarte | **Cap. Entregável** |
|---------|--------------|------------|-----------|----------|---------------------|
| A | 3.040 | 80% | 2.432 | 2% | **2.383,4** |
| B | 2.820 | 82% | 2.312,4 | 3% | **2.179,4** |
| C | 2.400 | 90% | 2.160 | 4% | **2.073,6** |

---

## 2. Economia Unitária (Unit Economics)

### 2.1 Receita Líquida por Tonelada

Receita após impostos:

$$
R_{p,f} = P_p \times (1 - \text{ICMS}_f)
$$

**Onde:**
- \(P_p\) = preço de venda do produto \(p\)
- \(\text{ICMS}_f\) = alíquota de ICMS da fábrica \(f\)

**Exemplo (Produto 1, Fábrica A):**
$$
R_{1,A} = 1.200 \times (1 - 0{,}18) = 1.200 \times 0{,}82 = 984 \text{ R\$/t}
$$

---

### 2.2 Custo Variável Ajustado

Para entregar 1 tonelada, é necessário produzir mais devido ao descarte:

$$
\text{CV}_{\text{ajustado},p,f} = \frac{\text{CV}_{p,f}}{1 - d_f}
$$

**Exemplo (Produto 1, Fábrica A):**
$$
\text{CV}_{\text{ajustado},1,A} = \frac{180}{1 - 0{,}02} = \frac{180}{0{,}98} = 183{,}67 \text{ R\$/t}
$$

**Interpretação:** Para entregar 1t do Produto 1, a Fábrica A precisa produzir ~1,02t (devido ao 2% de descarte), custando R\$ 183,67.

---

### 2.3 Contribuição Unitária

Margem por tonelada entregue:

$$
\text{Contrib}_{p,f} = R_{p,f} - \text{Frete}_p - \text{CV}_{\text{ajustado},p,f}
$$

**Exemplo (Produto 1, Fábrica A):**
$$
\text{Contrib}_{1,A} = 984 - 30 - 183{,}67 = 770{,}33 \text{ R\$/t}
$$

**Matriz de Contribuição Completa (R\$/t):**

| Produto | Frete | Fábrica A | Fábrica B | Fábrica C |
|---------|-------|-----------|-----------|-----------|
| 1 | 30 | 770,33 | 729,90 | 680,00 |
| 2 | 50 | 812,33 | 771,90 | 722,00 |
| 3 | 30 | 894,33 | 853,90 | 804,00 |
| 4 | 30 | 976,33 | 935,90 | 886,00 |
| 5 | 50 | 1.058,33 | 1.017,90 | 968,00 |

**Observações:**
- Produto 5 tem maior contribuição (preço alto)
- Fábrica A é a mais competitiva em todos os produtos (menor CV + ICMS intermediário)
- Fábrica C é a menos competitiva (maior CV + descarte)

---

## 3. Problema de Alocação Ótima

### 3.1 Formulação Matemática

**Variáveis de decisão:**
$$
x_{p,f} = \text{toneladas do produto } p \text{ produzidas na fábrica } f
$$

**Função objetivo:**
$$
\max_{x \geq 0} \quad Z = \sum_{p=1}^{5} \sum_{f \in \{A,B,C\}} \text{Contrib}_{p,f} \cdot x_{p,f}
$$

**Restrições:**

1. **Atendimento de demanda** (cada produto):
$$
\sum_{f \in \{A,B,C\}} x_{p,f} = D_p \quad \forall p \in \{1,2,3,4,5\}
$$

2. **Capacidade produtiva** (cada fábrica):
$$
\sum_{p=1}^{5} x_{p,f} \leq \text{Cap}_{\text{entregável},f} \quad \forall f \in \{A,B,C\}
$$

3. **Não-negatividade**:
$$
x_{p,f} \geq 0 \quad \forall p,f
$$

---

### 3.2 Algoritmo de Solução (Greedy Heuristic)

**Passo 1:** Criar lista de arcos \((p, f)\) ordenada por contribuição decrescente.

**Passo 2:** Para cada arco \((p, f)\) na ordem:
1. Calcular quantidade possível:
   $$
   q = \min\left(D_p^{\text{restante}}, \text{Cap}_f^{\text{restante}}\right)
   $$
2. Alocar \(x_{p,f} = q\)
3. Atualizar:
   - \(D_p^{\text{restante}} \leftarrow D_p^{\text{restante}} - q\)
   - \(\text{Cap}_f^{\text{restante}} \leftarrow \text{Cap}_f^{\text{restante}} - q\)

**Passo 3:** Verificar se toda demanda foi atendida:
$$
\sum_f x_{p,f} = D_p \quad \forall p
$$

**Complexidade:** \(O(P \times F \log(P \times F))\) onde \(P=5\) produtos e \(F=3\) fábricas.

---

## 4. Métricas Financeiras

### 4.1 Lucro Operacional Mensal

Por fábrica:
$$
L_f = \underbrace{\sum_p x_{p,f} \cdot P_p}_{\text{Receita}} - \underbrace{\sum_p x_{p,f} \cdot P_p \cdot \text{ICMS}_f}_{\text{Impostos}} - \underbrace{\sum_p x_{p,f} \cdot \text{Frete}_p}_{\text{Logística}} - \underbrace{\sum_p x_{p,f} \cdot \text{CV}_{\text{ajustado},p,f}}_{\text{Custo Variável}} - \underbrace{CF_f}_{\text{Custo Fixo}}
$$

Total:
$$
L_{\text{total}} = \sum_{f \in \{A,B,C\}} L_f
$$

---

### 4.2 Ganho Incremental (Δ)

Compara cenário com baseline "sem expansão":

$$
\Delta = \left(L_{\text{cenário}} - \text{Folha}_{\text{extra}} + \sum_{f \in \text{fechadas}} CF_f\right) - L_{\text{baseline}}
$$

**Componentes:**
- \(L_{\text{cenário}}\): lucro após alocação ótima no cenário
- \(\text{Folha}_{\text{extra}}\): custo mensal de novas contratações (se houver expansão)
- \(\sum CF_f\): economia de fixos das fábricas fechadas
- \(L_{\text{baseline}}\): lucro sem expansão/fechamento

---

### 4.3 Payback Simples

Tempo para recuperar investimento:

$$
\text{Payback (meses)} = \frac{\text{CAPEX}}{\Delta}
$$

**Condições:**
- Válido apenas se \(\Delta > 0\)
- Não considera valor do dinheiro no tempo
- Métrica conservadora (payback real pode ser menor com VPL)

---

### 4.4 ROI Mensal

Retorno sobre investimento mensal:

$$
\text{ROI}_{\text{mensal}} = \frac{\Delta}{\text{CAPEX}} \times 100\%
$$

**Exemplo:**
- CAPEX = R\$ 8.000.000
- Δ = R\$ 688.470/mês
- ROI mensal = \(\frac{688.470}{8.000.000} \times 100\% = 8{,}6\%\) ao mês

---

## 5. Projeção de Demanda

### 5.1 Crescimento Composto

$$
D_{t+n} = D_t \times (1 + g)^n
$$

**Onde:**
- \(D_t\): demanda no tempo \(t\)
- \(g\): taxa de crescimento anual (10% = 0,10)
- \(n\): número de anos (5)

**Cálculo:**
$$
D_{\text{ano 5}} = D_{\text{atual}} \times (1{,}10)^5 = D_{\text{atual}} \times 1{,}61051 \approx D_{\text{atual}} \times 1{,}61
$$

**Exemplo:**
- Demanda atual total: 4.370 t/mês
- Demanda ano 5: \(4.370 \times 1{,}61 = 7.035{,}7 \approx 7.036\) t/mês

---

## 6. Análise Combinatória de Cenários

### 6.1 Power Set (Conjunto Potência)

Para \(n\) fábricas, existem \(2^n\) subconjuntos possíveis.

**Expansão:** \(2^3 = 8\) opções
- Ø (nenhuma)
- {A}, {B}, {C}
- {A,B}, {A,C}, {B,C}
- {A,B,C}

**Fechamento:** Para cada cenário de expansão \(E\), fechar pode ser qualquer subconjunto disjunto de \(E\).

**Combinações totais:** ~32 (muitas inviáveis)

---

### 6.2 Filtro de Viabilidade

Critério de admissibilidade:

$$
\text{Cap}_{\text{total}} \geq D_{\text{futura}} \quad \text{E} \quad \text{Demanda atendida} = 100\%
$$

**Cenários admissíveis identificados:** 8

---

### 6.3 Critério de Seleção Multi-Objetivo

Ordenação lexicográfica:

1. **Maximizar** \(\Delta\) (ganho incremental)
2. **Minimizar** Payback (tempo de retorno)
3. **Minimizar** CAPEX (investimento total)

$$
\text{key} = \left(-\Delta, \text{Payback}, \text{CAPEX}\right)
$$

Ordenação crescente de `key` seleciona o melhor cenário.

---

## 7. Limitações e Simplificações

### Assumidas no Modelo
1. Preços de venda constantes (sem inflação)
2. Custos constantes (sem reajuste)
3. Crescimento uniforme de demanda (10% a.a. para todos os produtos)
4. Capacidade expandida disponível imediatamente (sem construção)
5. Sem custos de transição (rescisões, desligamento)

### Não Consideradas (mas Relevantes em Caso Real)
1. **TMA (Taxa Mínima de Atratividade):** VPL, TIR
2. **Risco:** Volatilidade de demanda, cenários pessimista/otimista
3. **Impostos adicionais:** PIS, COFINS, IR
4. **Custos logísticos:** Transferência entre fábricas
5. **Flexibilidade operacional:** Opções reais (postergar, expandir gradualmente)
6. **Impacto social:** Demissões, economia regional

---

## 8. Validação do Modelo

### 8.1 Testes de Sanidade

1. **Balanço de massa:**
   $$
   \sum_f x_{p,f} = D_p \quad \forall p
   $$

2. **Respeito a capacidades:**
   $$
   \sum_p x_{p,f} \leq \text{Cap}_f \quad \forall f
   $$

3. **Monotonia:** Contribuição decrescente → alocação decrescente

---

### 8.2 Análise de Sensibilidade (Sugerida)

Testar variações de:
- Demanda: ±10%
- Custos variáveis: ±5%
- Preços de venda: ±5%
- Taxa de crescimento: 5%, 10%, 15%

---

## 9. Referências Técnicas

1. **Programação Linear:**
   - Dantzig, G. B. (1963). *Linear Programming and Extensions*
   
2. **Otimização Combinatória:**
   - Papadimitriou, C. H., & Steiglitz, K. (1998). *Combinatorial Optimization*

3. **Análise de Investimentos:**
   - Brealey, R. A., et al. (2020). *Principles of Corporate Finance*

4. **Operations Research:**
   - Hillier, F. S., & Lieberman, G. J. (2013). *Introduction to Operations Research*

---

<p align="center">
  <i>Metodologia desenvolvida para otimização de operações industriais</i>
</p>

