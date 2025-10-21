#!/bin/bash

# ============================================================================
# COMANDOS PARA PUBLICAR NO GITHUB
# Execute este script OU copie os comandos abaixo linha por linha
# ============================================================================

echo "Publicando projeto BRF no GitHub..."
echo ""

# PASSO 1: Criar repositório no GitHub primeiro
echo "PASSO 1: Crie o repositório no GitHub:"
echo "  1. Acesse: https://github.com/new"
echo "  2. Nome: brf-factory-optimization"
echo "  3. Public"
echo "  4. NÃO marque 'Initialize with README'"
echo "  5. Clique 'Create repository'"
echo ""

read -p "Já criou o repositório no GitHub? (s/n) " -n 1 -r
echo ""

if [[ ! $REPLY =~ ^[Ss]$ ]]
then
    echo "Crie o repositório primeiro e execute este script novamente."
    exit 1
fi

# PASSO 2: Obter seu username do GitHub
echo ""
echo "PASSO 2: Qual seu username do GitHub?"
read -p "Username: " GITHUB_USER

if [ -z "$GITHUB_USER" ]
then
    echo "Username não pode ser vazio!"
    exit 1
fi

# PASSO 3: Adicionar remote e fazer push
echo ""
echo "PASSO 3: Conectando ao GitHub e publicando..."
echo ""

cd /Users/denyssantos/Desktop/BRF_case

# Adicionar remote
git remote add origin "https://github.com/${GITHUB_USER}/brf-factory-optimization.git"

# Verificar
echo "Remote adicionado:"
git remote -v
echo ""

# Push
echo "Fazendo push para o GitHub (vai pedir suas credenciais)..."
git push -u origin main

echo ""
echo "============================================================================"
echo "PRONTO! Projeto publicado com sucesso!"
echo ""
echo "Acesse: https://github.com/${GITHUB_USER}/brf-factory-optimization"
echo "============================================================================"

