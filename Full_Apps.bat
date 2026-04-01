@echo off
:: ###########################################################
:: Nome: Automação Post-Install Windows
:: Descrição: Office Offline + Ninite + Privacy
:: ###########################################################

@echo off
:: Força o script a rodar na pasta onde esta localizado
cd /d "%~dp0"

:: Verifica privilégios de administrador
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [ERRO] Por favor, execute como Administrador!
    pause
    exit
)

echo CRIANDO PONTO DE RESTAURACAO DE SEGURANÇA...
:: Habilita a restauraçao no disco C: (Caso esteja desativada)
powershell.exe -ExecutionPolicy Bypass -Command "Enable-ComputerRestore -Drive 'C:\'"

:: Cria o Ponto de Restauracao
powershell.exe -ExecutionPolicy Bypass -Command "Checkpoint-Computer -Description 'Antes_Suporte_TI' -RestorePointType 'MODIFY_SETTINGS'"

echo.
echo [SUCESSO] Ponto de Seguranca Criado! Prosseguindo com as Configuracoes...
echo.

:: SAI da pasta Scripts e entra na pasta Instaladores
cd..\02_Instaladores\Apps

title Suporte TI - Instalador Tudo-em-Um
color 0B
echo =======================================================
echo    INICIANDO AUTOMACAO (OFFICE + NINITE + PRIVACIDADE)
echo =======================================================
echo Caminho atual: %cd%
echo.

:: 1. INSTALACAO DO OFFICE (Entrando na subpasta)
echo [1/3] Instalando Office 365(apenas Word, Excel e PowerPoint)...
if exist Install_Office.xml (
    setup.exe /configure Install_Office.xml
    cd ..
    echo [OK] Office finalizado.
) else (
    echo [!] Erro: Arquivos do Office nao encontrados
)
echo.

:: 2. INSTALACAO NINITE
echo [2/3] Instalando apps basicos via Ninite...
if exist "Ninite.exe" (
    start /wait Ninite.exe
    echo [OK] Ninite finalizado.
) else (
    echo [!] Erro: Ninite.exe nao encontrado
)
echo.

:: 3. DESABILITAR TELEMETRIA
echo [3/3] Desabilitando Telemetria e Coleta de Dados...
sc stop DiagTrack >nul 2>&1
sc config DiagTrack start= disabled >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f >nul
echo [OK] Telemetria desabilitada.
echo.

echo =======================================================
echo    PROCESSO CONCLUIDO COM SUCESSO!
echo =======================================================
pause
