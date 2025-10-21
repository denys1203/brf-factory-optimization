#!/bin/bash

# Script de Setup - Otimização BRF
# Autor: Denys Santos

echo "🏭 Otimização de Operações Industriais - BRF"
echo "=============================================="
echo ""

# Verificar versão do Python
echo "Verificando versão do Python..."
python_version=$(python3 --version 2>&1 | awk '{print $2}')
echo "✅ Python $python_version detectado"
echo ""

# Criar ambiente virtual
echo "Criando ambiente virtual..."
python3 -m venv venv
echo "✅ Ambiente virtual criado"
echo ""

# Ativar ambiente virtual
echo "Ativando ambiente virtual..."
source venv/bin/activate
echo "✅ Ambiente ativado"
echo ""

# Atualizar pip
echo "Atualizando pip..."
pip install --upgrade pip --quiet
echo "✅ pip atualizado"
echo ""

# Instalar dependências
echo "Instalando dependências..."
pip install -r requirements.txt --quiet
echo "✅ Dependências instaladas:"
pip list | grep -E "pandas|numpy|matplotlib|jupyter"
echo ""

# Mensagem final
echo "=============================================="
echo "✨ Setup concluído com sucesso!"
echo ""
echo "Para começar:"
echo "  1. source venv/bin/activate"
echo "  2. jupyter notebook"
echo "  3. Abra: notebooks/otimizacao_BRF_Denys.ipynb"
echo ""
echo "Ou execute diretamente:"
echo "  ./run.sh"
echo "=============================================="

