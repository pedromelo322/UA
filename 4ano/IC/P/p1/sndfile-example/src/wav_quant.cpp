// Basic structure following the pattern of other programs
#include <iostream>
#include <vector>
#include <cmath>
#include <sndfile.hh>

using namespace std;

constexpr size_t FRAMES_BUFFER_SIZE = 65536; // Buffer for reading frames




int main(int argc, char *argv[]) {
    // Parse command line arguments (input file, output file, quantization bits)
    // Open input WAV file
    // Validate it's PCM_16 format
    // Read samples
    // Apply quantization: sample_quantized = round(sample / step_size) * step_size
    // Write quantized samples to output WAV file


    if (argc < 4){
        cerr << "Usage: " << argv[0] << "<input file> <output file> <quantization bits>\n";
        return 1;
    }


    int quantization_bits = stoi(argv[3]);
    int quantization_levels = 1 << quantization_bits;
    double step_size = 65536.0 / quantization_levels;

    SndfileHandle sndFile{argv[1]};
    if(sndFile.error()){
        cerr << "Error: Invalid Input File\n";
        return 1;
    }

    if((sndFile.format() & SF_FORMAT_TYPEMASK) != SF_FORMAT_WAV){
        cerr << "Error: File is not in WAV Format\n";
        return 1;
    }

    if((sndFile.format() & SF_FORMAT_SUBMASK) != SF_FORMAT_PCM_16){
        cerr << "Error: File is not in PCM_16 Format\n";
        return 1;
    }


    SndfileHandle sndFileOut(argv[2], SFM_WRITE, sndFile.format(), sndFile.channels(),sndFile.samplerate());

    if(sndFileOut.error()){
        cerr << "Error: Cannot create output file\n";
        return 1;
    }

    size_t nFrames;
    vector<short> samples(FRAMES_BUFFER_SIZE * sndFile.channels());

    while((nFrames = sndFile.readf(samples.data(), FRAMES_BUFFER_SIZE))){
        samples.resize(nFrames * sndFile.channels());
        for (auto& s: samples)
        {
            long long shifted = static_cast<long long>(s) + 32768;
            long long quantized_level = round(static_cast<double>(shifted) / step_size) * step_size;
            
            // Atribuição com validação para evitar overflow/underflow
            s = min(static_cast<long long>(32767), max(static_cast<long long>(-32768), quantized_level - 32768));
        }

        sndFileOut.writef(samples.data(), nFrames);
    }



    return 0;
    

}







