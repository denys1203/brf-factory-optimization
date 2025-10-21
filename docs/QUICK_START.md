# 🚀 Quick Start Guide

## Início Rápido em 3 Minutos

### Opção 1: Executar no Google Colab (Mais Rápido)

[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/seu-usuario/brf-optimization/blob/main/notebooks/otimizacao_BRF_Denys.ipynb)

1. Clique no badge acima
2. Execute todas as células (Runtime → Run all)
3. Veja os resultados!

---

### Opção 2: Executar Localmente

#### Passo 1: Clone o repositório
```bash
git clone https://github.com/seu-usuario/brf-optimization.git
cd brf-optimization
```

#### Passo 2: Crie ambiente virtual
```bash
# Python 3.8+
python -m venv venv

# Ative o ambiente
# Linux/Mac:
source venv/bin/activate

# Windows:
venv\Scripts\activate
```

#### Passo 3: Instale dependências
```bash
pip install -r requirements.txt
```

#### Passo 4: Inicie o Jupyter
```bash
jupyter notebook
```

#### Passo 5: Abra o notebook
Navegue até: `notebooks/otimizacao_BRF_Denys.ipynb`

---

## 📂 Estrutura de Arquivos

```
brf-optimization/
│
├── notebooks/
│   └── otimizacao_BRF_Denys.ipynb    # 👈 COMECE AQUI
│
├── docs/
│   ├── case_description.md           # Descrição do desafio
│   ├── METODOLOGIA.md                # Detalhes matemáticos
│   ├── RESULTADOS.md                 # Análises completas
│   └── QUICK_START.md                # Este arquivo
│
├── requirements.txt                  # Dependências
└── README.md                         # Visão geral
```

---

## 🔍 O Que Você Vai Encontrar

### No Notebook Principal

**Passo 1:** Análise da Situação Atual
- ✅ Capacidade entregável por fábrica
- ✅ Contribuição unitária (unit economics)
- ✅ Alocação ótima de produção
- ✅ P&L mensal por unidade

**Passo 2:** Projeção Futura (5 anos)
- ✅ Demanda projetada (+61%)
- ✅ Gap de capacidade
- ✅ Cenários de expansão individual

**Passo 3:** Otimização Combinatória
- ✅ Todas as combinações de expandir/fechar
- ✅ Filtro de viabilidade (100% demanda)
- ✅ Ranking por payback e ganho incremental
- ✅ **Solução ótima identificada**

**Visualizações:**
- 📊 Tabelas HTML estilizadas
- 📈 Gráfico de dispersão (payback × Δ lucro)
- 📑 Relatórios exportáveis

---

## ⚡ Dicas Rápidas

### Para Visualizar Apenas os Resultados
1. Abra o notebook
2. Vá direto para a **última célula** (gráfico)
3. Veja o cenário ótimo destacado com ⭐

### Para Entender a Metodologia
1. Leia: `docs/METODOLOGIA.md`
2. Veja as equações matemáticas
3. Entenda o algoritmo de alocação

### Para Ver Análises Detalhadas
1. Leia: `docs/RESULTADOS.md`
2. Tabelas comparativas completas
3. Justificativas financeiras

---

## 🎯 Principais Resultados (Spoiler)

| Métrica | Valor |
|---------|-------|
| **Estratégia Ótima** | Expandir A+B / Fechar C |
| **Ganho Mensal** | R$ 688.470 |
| **CAPEX** | R$ 8.000.000 |
| **Payback** | 11,6 meses |
| **ROI Mensal** | 8,6% |

---

## 🐛 Problemas Comuns

### Erro: "ModuleNotFoundError: No module named 'pandas'"
**Solução:**
```bash
pip install -r requirements.txt
```

### Erro: "Jupyter command not found"
**Solução:**
```bash
pip install jupyter
```

### Tabelas HTML não aparecem
**Solução:**
- Use Jupyter Notebook (não JupyterLab ou VS Code)
- Ou exporte para HTML: `File → Download as → HTML`

---

## 📞 Suporte

- 📧 **Email:** seu-email@example.com
- 💼 **LinkedIn:** [Seu Perfil](https://linkedin.com/in/seu-perfil)
- 🐛 **Issues:** [GitHub Issues](https://github.com/seu-usuario/brf-optimization/issues)

---

## 📚 Próximos Passos

Depois de executar o notebook:

1. ✅ **Entenda a metodologia:** Leia `METODOLOGIA.md`
2. ✅ **Veja análises detalhadas:** Leia `RESULTADOS.md`
3. ✅ **Customize:** Teste outros parâmetros (custos, demanda, etc.)
4. ✅ **Expanda:** Adicione análise de VPL/TIR
5. ✅ **Compartilhe:** Dê uma estrela ⭐ no GitHub!

---

<p align="center">
  <i>Dúvidas? Abra uma issue no GitHub ou entre em contato!</i>
</p>

