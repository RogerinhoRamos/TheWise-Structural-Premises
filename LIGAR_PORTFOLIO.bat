@echo off
title TheWise Portfolio Sentinel - Launch Terminal
color 0B
chcp 65001 > nul

echo =======================================================
echo.
echo    ████████╗██╗  ██╗███████╗██╗    ██╗██╗███████╗███████╗
echo    ╚══██╔══╝██║  ██║██╔════╝██║    ██║██║██╔════╝██╔════╝
echo       ██║   ███████║█████╗  ██║ █╗ ██║██║███████╗█████╗  
echo       ██║   ██╔══██║██╔══╝  ██║███╗██║██║╚════██║██╔══╝  
echo       ██║   ██║  ██║███████╗╚███╔███╔╝██║███████║███████╗
echo       ╚═╝   ╚═╝  ╚═╝╚══════╝ ╚══╝╚══╝ ╚═╝╚══════╝╚══════╝
echo.
echo           THEWISE PORTFOLIO SENTINEL (TWS)
echo =======================================================
echo.

:: Verificar se Python está instalado
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERRO] O Python não foi encontrado no sistema. Por favor, instale o Python 3.10+ para rodar o Sentinel.
    pause
    exit
)

:: Verificar se Flask está instalado, senão instala
echo [Sentinel] Verificando dependências locais...
python -c "import flask" >nul 2>&1
if %errorlevel% neq 0 (
    echo [Sentinel] Flask não instalado. Instalando biblioteca leve Flask agora...
    pip install --user flask
)

echo [Sentinel] Inicializando o Servidor de Portfólio Local...
echo [Sentinel] Acesse o link no navegador: http://127.0.0.1:5000
echo.

:: Abrir o navegador após 2 segundos em paralelo
start /b cmd /c "timeout /t 2 >nul && start http://127.0.0.1:5000"

:: Iniciar o servidor python
python portfolio_server.py

pause
