#!/bin/bash

# Script de Execução Rápida - Otimização BRF
# Autor: Denys Santos

echo "🚀 Iniciando Jupyter Notebook..."
echo ""

# Verificar se ambiente virtual existe
if [ ! -d "venv" ]; then
    echo "❌ Ambiente virtual não encontrado!"
    echo "Execute primeiro: ./setup.sh"
    exit 1
fi

# Ativar ambiente virtual
source venv/bin/activate

# Verificar se dependências estão instaladas
if ! python -c "import pandas" 2>/dev/null; then
    echo "❌ Dependências não instaladas!"
    echo "Execute: pip install -r requirements.txt"
    exit 1
fi

# Abrir Jupyter Notebook
echo "✅ Abrindo Jupyter Notebook..."
echo ""
echo "Notebook principal: notebooks/otimizacao_BRF_Denys.ipynb"
echo ""
echo "Pressione Ctrl+C para encerrar"
echo ""

jupyter notebook notebooks/otimizacao_BRF_Denys.ipynb

