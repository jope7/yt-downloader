@echo off
title YT-DLP Menu Loop

REM Define o caminho usando a variavel de ambiente do Windows
set "BASE_PATH=%USERPROFILE%\Documents\yt-dlp"

REM -----------------------------------------------------------
REM VERIFICANDO E CRIANDO PASTAS
REM -----------------------------------------------------------
if not exist "%BASE_PATH%" (
    echo Criando pasta raiz em Documentos...
    mkdir "%BASE_PATH%"
)

if not exist "%BASE_PATH%\mp3" (
    echo Criando pasta mp3...
    mkdir "%BASE_PATH%\mp3"
)

if not exist "%BASE_PATH%\mp4" (
    echo Criando pasta mp4...
    mkdir "%BASE_PATH%\mp4"
)
REM -----------------------------------------------------------

REM Verifica se o yt-dlp existe antes de comecar
if not exist "yt-dlp.exe" (
    echo.
    echo ERRO CRITICO: O arquivo "yt-dlp.exe" nao foi encontrado nesta pasta!
    echo Por favor, coloque este script na mesma pasta do executavel.
    pause
    exit
)

:menu
cls
echo ==========================================
echo      ESCOLHA UMA OPCAO DE DOWNLOAD
echo ==========================================
echo.
echo 1. Baixar MP3 (Single)
echo 2. Baixar MP4 (Single)
echo 3. Baixar Playlist MP3
echo 4. Baixar Playlist MP4
echo.
echo ==========================================
echo Destino Base: %BASE_PATH%
echo ==========================================

set "url="
set "opt="
set /p url="Cole o Link aqui: "
set /p opt="Digite o numero da opcao (1-4): "

echo.
echo Iniciando download...
echo.

REM Opcao 1: MP3 Single
if "%opt%"=="1" (
    .\yt-dlp.exe -x --audio-format mp3 --audio-quality 0 -P "%BASE_PATH%\mp3" -o "%%(title)s.%%(ext)s" "%url%"
    goto continuar
)

REM Opcao 2: MP4 Single
if "%opt%"=="2" (
    .\yt-dlp.exe -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" --merge-output-format mp4 -P "%BASE_PATH%\mp4" -o "%%(title)s.%%(ext)s" "%url%"
    goto continuar
)

REM Opcao 3: Playlist MP3
if "%opt%"=="3" (
    .\yt-dlp.exe -x --audio-format mp3 --audio-quality 0 -o "%BASE_PATH%\%%(playlist)s\%%(playlist_index)s - %%(title)s.%%(ext)s" --yes-playlist "%url%"
    goto continuar
)

REM Opcao 4: Playlist MP4
if "%opt%"=="4" (
    .\yt-dlp.exe -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" --merge-output-format mp4 -o "%BASE_PATH%\%%(playlist)s\%%(playlist_index)s - %%(title)s.%%(ext)s" --yes-playlist "%url%"
    goto continuar
)

:continuar
echo.
echo ==========================================
echo Download finalizado.
echo.
set /p resp="Deseja baixar outro arquivo? (S/N): "

if /i "%resp%"=="s" goto menu
if /i "%resp%"=="S" goto menu

exit