import os
import yt_dlp
import webbrowser
from urllib.parse import quote

# Nome do ficheiro de entrada e pasta de saída
INPUT_FILE = 'videos.txt'
OUTPUT_FOLDER = 'videos'
HTML_FILE = 'index.html'

def ler_ficheiro(caminho):
    """Lê o ficheiro e organiza os links por tópico."""
    dados = {}
    if not os.path.exists(caminho):
        print(f"Erro: O ficheiro {caminho} não existe.")
        return dados

    with open(caminho, 'r', encoding='utf-8') as f:
        for linha in f:
            linha = linha.strip()
            if not linha or ':' not in linha:
                continue
            
            # Divide apenas no primeiro ':' para separar tópico da URL
            # Exemplo: "2-2.5G: https://youtube..." -> ["2-2.5G", " https://..."]
            partes = linha.split(':', 1)
            topico = partes[0].strip()
            url = partes[1].strip()
            
            if topico not in dados:
                dados[topico] = []
            dados[topico].append(url)
    return dados

def transferir_videos(dados_videos):
    """
    Transfere os vídeos usando yt-dlp (com ffmpeg backend).
    Retorna um dicionário atualizado com o caminho local dos ficheiros.
    """
    dados_locais = {}
    
    # Configurações do yt-dlp
    ydl_opts = {
        'format': 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best', # Prioriza MP4 para compatibilidade web
        'outtmpl': f'{OUTPUT_FOLDER}/%(title)s.%(ext)s', # Pasta/Titulo.extensão
        'noplaylist': True,
        'quiet': False,
        'no_overwrites': True, # Não transfere se já existir
        'ignoreerrors': True,
    }

    with yt_dlp.YoutubeDL(ydl_opts) as ydl:
        for topico, urls in dados_videos.items():
            dados_locais[topico] = []
            print(f"\n--- Processando tópico: {topico} ---")
            
            for url in urls:
                try:
                    # Extrair informações primeiro para obter o nome do ficheiro
                    info = ydl.extract_info(url, download=True) # Download=True transfere imediatamente
                    
                    if info:
                        # O yt-dlp prepara o nome final do arquivo
                        filename = ydl.prepare_filename(info)
                        # Precisamos apenas do nome do arquivo, não do caminho completo relativo, para o HTML
                        basename = os.path.basename(filename)
                        dados_locais[topico].append(basename)
                        print(f"Sucesso: {info.get('title', 'Video')}")
                        
                except Exception as e:
                    print(f"Erro ao transferir {url}: {e}")
                    
    return dados_locais

def gerar_html(dados_locais):
    """Gera uma página HTML simples para navegação."""
    css = """
    <style>
        body { font-family: Arial, sans-serif; margin: 0; padding: 0; display: flex; height: 100vh; }
        nav { width: 250px; background: #333; color: white; padding: 20px; overflow-y: auto; }
        nav a { display: block; color: white; text-decoration: none; padding: 10px; border-bottom: 1px solid #444; }
        nav a:hover { background: #555; }
        main { flex: 1; padding: 20px; overflow-y: auto; background: #f4f4f4; }
        .video-container { background: white; padding: 20px; margin-bottom: 30px; border-radius: 8px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        h1 { border-bottom: 2px solid #333; padding-bottom: 10px; }
        video { width: 100%; max-width: 800px; height: auto; margin-top: 10px; border: 1px solid #ddd; }
        .filename { color: #666; font-size: 0.9em; margin-top: 5px; }
    </style>
    """

    html_content = f"""
    <!DOCTYPE html>
    <html lang="pt">
    <head>
        <meta charset="UTF-8">
        <title>Galeria de Vídeos</title>
        {css}
    </head>
    <body>
        <nav>
            <h3>Tópicos</h3>
    """

    # Gerar Menu Lateral
    for topico in dados_locais.keys():
        html_content += f'<a href="#{topico}">{topico}</a>'

    html_content += """
        </nav>
        <main>
    """

    # Gerar Conteúdo dos Vídeos
    for topico, arquivos in dados_locais.items():
        html_content += f'<div id="{topico}"><h1>{topico}</h1>'
        
        if not arquivos:
            html_content += "<p>Nenhum vídeo disponível.</p>"
        
        for arquivo in arquivos:
            # URL encode para lidar com espaços e caracteres especiais no nome do ficheiro
            caminho_video = f"{OUTPUT_FOLDER}/{quote(arquivo)}"
            
            html_content += f"""
            <div class="video-container">
                <h3>{arquivo}</h3>
                <video controls>
                    <source src="{caminho_video}" type="video/mp4">
                    Seu navegador não suporta a tag de vídeo.
                </video>
                <div class="filename">Ficheiro: {arquivo}</div>
            </div>
            """
        html_content += "</div><hr>"

    html_content += """
        </main>
    </body>
    </html>
    """

    with open(HTML_FILE, 'w', encoding='utf-8') as f:
        f.write(html_content)
    
    return os.path.abspath(HTML_FILE)

def main():
    # 1. Ler o ficheiro
    print("A ler ficheiro videos.txt...")
    videos_map = ler_ficheiro(INPUT_FILE)
    
    if not videos_map:
        print("Nenhum vídeo encontrado para processar.")
        return

    # 2. Transferir vídeos
    print("A iniciar transferências...")
    videos_locais = transferir_videos(videos_map)

    # 3. Gerar Site
    print("A gerar website...")
    caminho_site = gerar_html(videos_locais)

    # 4. Abrir no navegador
    print(f"A abrir {caminho_site}...")
    webbrowser.open(f'file://{caminho_site}')

if __name__ == "__main__":
    main()
