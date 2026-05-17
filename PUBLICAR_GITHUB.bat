@echo off
setlocal
title PUBLICADOR GITHUB - THEWISE STRUCTURAL PREMISES

echo ======================================================
echo    PUBLICADOR AUTOMATICO - THEWISE STRUCTURAL PREMISES
echo ======================================================
echo.

:: Verifica se o git esta instalado
git --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERRO] Git nao encontrado. Por favor, instale o Git.
    pause
    exit /b
)

:: Adiciona todos os arquivos
echo [1/3] Preparando arquivos...
git add .

:: Pede o comentario do usuario
echo.
set /p msg="Descreva sua atualizacao (ex: Ajuste no Dashboard): "

if "%msg%"=="" (
    set msg="Atualizacao Geral - %date% %time%"
)

:: Faz o commit
echo.
echo [2/3] Salvando versao local...
git commit -m "%msg%"

:: Tenta fazer o push
echo.
echo [3/3] Enviando para o GitHub...
git push origin main

if %errorlevel% neq 0 (
    echo.
    echo [!] Ocorreu um problema no envio. 
    echo [!] Se for a primeira vez, verifique se voce criou o repositorio no GitHub
    echo [!] e rodou o comando: git remote add origin URL_DO_SEU_REPO
) else (
    echo.
    echo ======================================================
    echo     SUCESSO! PROJETO ATUALIZADO NO GITHUB.
    echo ======================================================
)

echo.
pause
