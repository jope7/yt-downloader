# 📥 yt-downloader

Um script de automação (`.bat`) simples e eficiente para Windows que facilita o uso do [yt-dlp](https://github.com/yt-dlp/yt-dlp) para baixar vídeos e músicas do YouTube.

O objetivo deste projeto é oferecer uma interface de menu rápida para baixar conteúdo na melhor qualidade possível, sem a necessidade de digitar comandos longos e complexos no terminal toda vez.

## ✨ Funcionalidades

* **Menu Interativo:** Seleção simples de opções numeradas (1-4).
* **Máxima Qualidade:** Configurado para baixar sempre a melhor qualidade de áudio (320kbps/VBR 0) e vídeo disponível.
* **Suporte a Playlists:** Baixa playlists inteiras e organiza os arquivos em pastas com o nome da playlist.
* **Organização Automática:** Cria e gerencia a estrutura de pastas automaticamente em `Documentos`:
    * `Documents\yt-dlp\mp3` (Para áudios individuais)
    * `Documents\yt-dlp\mp4` (Para vídeos individuais)
    * `Documents\yt-dlp\Nome_Da_Playlist` (Para playlists)
* **Loop de Download:** Permite baixar múltiplos arquivos em sequência sem precisar reiniciar o script.
* **Portátil:** Usa a variável `%USERPROFILE%`, funcionando em qualquer computador Windows sem necessidade de configuração de caminhos.

## 🚀 Como Usar

### Pré-requisitos

Para que o script funcione corretamente, você precisa de duas ferramentas gratuitas no seu computador (essa versão já vem com eles inclusos):

1.  **[yt-dlp](https://github.com/yt-dlp/yt-dlp/releases):** O executável principal.
2.  **[FFmpeg](https://ffmpeg.org/download.html):** Necessário para converter áudios para MP3 e juntar faixas de vídeo/áudio.

### Execução

1.  Execute o arquivo `.bat` (duplo clique).

## 📋 Opções do Menu

O script oferece 4 modos principais:

1.  **Baixar MP3 (Single):** Extrai o áudio, converte para MP3, insere capa/metadados e salva na pasta `mp3`.
2.  **Baixar MP4 (Single):** Baixa o vídeo na melhor resolução e salva na pasta `mp4`.
3.  **Baixar Playlist MP3:** Baixa todos os vídeos de uma playlist como áudio, numerando as faixas.
4.  **Baixar Playlist MP4:** Baixa todos os vídeos de uma playlist mantendo a ordem.

## 🛠️ Estrutura de Pastas Gerada

O script criará automaticamente a seguinte estrutura nos seus Documentos:

```text
C:\Users\SeuUsuario\Documents\yt-dlp\
│
├── mp3\            # Músicas avulsas
├── mp4\            # Vídeos avulsos
└── NomeDaPlaylist\ # Pastas automáticas para playlists
