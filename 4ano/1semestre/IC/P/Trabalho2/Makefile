# Makefile para o Trabalho Laboratorial 2 de IC

# Compilador C++
CXX = g++

# Flags de Compilação (Otimização O2, Avisos Wall, C++17 Standard)
CXXFLAGS = -O2 -Wall -std=c++17

# Diretórios
SRCDIR = src
BINDIR = bin
IMGDIR = img
OUTDIR = out
WAVOUTDIR = wav_out

# Encontrar flags do OpenCV usando pkg-config
OPENCV_CFLAGS = $(shell pkg-config --cflags opencv4)
OPENCV_LIBS = $(shell pkg-config --libs opencv4)

SNDFILE_LIBS = -lsndfile

# Adicionar flags do OpenCV às flags gerais
CXXFLAGS += $(OPENCV_CFLAGS)
LIBS = $(OPENCV_LIBS)

# Lista de executáveis a serem criados na diretoria bin/
EXECUTABLES = $(BINDIR)/extract_channel \
              $(BINDIR)/image_negative \
              $(BINDIR)/image_mirror \
              $(BINDIR)/image_rotate \
			  $(BINDIR)/image_intensity \
			  $(BINDIR)/test_golomb \
			  $(BINDIR)/audio_encoder \
			  $(BINDIR)/audio_decoder \
			  $(BINDIR)/image_encoder \
			  $(BINDIR)/image_decoder
			  
# Alvo principal: compila todos os executáveis
all: $(EXECUTABLES) | $(OUTDIR) $(WAVOUTDIR)

# Regra para criar a diretoria bin/ se não existir
$(BINDIR):
	@mkdir -p $(BINDIR)

$(OUTDIR):
	@mkdir -p $(OUTDIR)

$(WAVOUTDIR):
	@mkdir -p $(WAVOUTDIR)

# Regra genérica para compilar um .cpp de src/ para um executável em bin/
$(BINDIR)/%: $(SRCDIR)/%.cpp | $(BINDIR)
	$(CXX) $(CXXFLAGS) $< -o $@ $(LIBS)

# Regra específica para compilar o test_golomb, pois ele depende de dois .cpp
$(BINDIR)/test_golomb: $(SRCDIR)/main_test_golomb.cpp $(SRCDIR)/Golomb.cpp $(SRCDIR)/Golomb.h | $(BINDIR)
	$(CXX) $(CXXFLAGS) $(SRCDIR)/main_test_golomb.cpp $(SRCDIR)/Golomb.cpp -o $@ $(LIBS)

# Regras específicas para o codec de áudio
$(BINDIR)/audio_encoder: $(SRCDIR)/audio_encoder.cpp $(SRCDIR)/Golomb.cpp $(SRCDIR)/Golomb.h | $(BINDIR)
	$(CXX) $(CXXFLAGS) $(SRCDIR)/audio_encoder.cpp $(SRCDIR)/Golomb.cpp $(SRCDIR)/utils.cpp -o $@ $(SNDFILE_LIBS)

$(BINDIR)/audio_decoder: $(SRCDIR)/audio_decoder.cpp $(SRCDIR)/Golomb.cpp $(SRCDIR)/Golomb.h $(SRCDIR)/utils.cpp $(SRCDIR)/utils.h | $(BINDIR)
	$(CXX) $(CXXFLAGS) $(SRCDIR)/audio_decoder.cpp $(SRCDIR)/Golomb.cpp $(SRCDIR)/utils.cpp $(SRCDIR)/utils.h -o $@ $(SNDFILE_LIBS)

# Regras específicas para o codec de imagem
$(BINDIR)/image_encoder: $(SRCDIR)/image_encoder.cpp $(SRCDIR)/Golomb.cpp $(SRCDIR)/Golomb.h $(SRCDIR)/utils.cpp $(SRCDIR)/utils.h | $(BINDIR)
	$(CXX) $(CXXFLAGS) $(SRCDIR)/image_encoder.cpp $(SRCDIR)/Golomb.cpp $(SRCDIR)/utils.cpp  $(SRCDIR)/utils.h -o $@ $(LIBS)

$(BINDIR)/image_decoder: $(SRCDIR)/image_decoder.cpp $(SRCDIR)/Golomb.cpp $(SRCDIR)/Golomb.h $(SRCDIR)/utils.cpp $(SRCDIR)/utils.h | $(BINDIR)
	$(CXX) $(CXXFLAGS) $(SRCDIR)/image_decoder.cpp $(SRCDIR)/Golomb.cpp $(SRCDIR)/utils.cpp  $(SRCDIR)/utils.h -o $@ $(LIBS)

# Alvo para limpar os executáveis compilados
clean:
	@echo "Limpando executáveis..."
	@rm -f $(EXECUTABLES)
	@echo "Removendo diretórios de saída..."
	@rm -rf $(OUTDIR) $(WAVOUTDIR)
	@echo "Limpeza concluída."

# Phony targets (alvos que não representam ficheiros)
.PHONY: all clean