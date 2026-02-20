set terminal pngcairo size 1280,720 enhanced font 'Arial,12'

# Primeiro histograma: MSB
set output 'histogram_msb.png'
set title "Histogram of MSB Frequencies"
set xlabel "Byte"
set ylabel "Frequency"
set grid
set xtics rotate by -45
set xtics 10 # Define rótulos no eixo X a cada 10 bytes
set datafile separator ","
plot "output/hist_msb.csv" every ::1 using 1:2 with linespoints title "MSB Histogram"

# Segundo histograma: LSB
set output 'histogram_lsb.png'
set title "Histogram of LSB Frequencies"
plot "output/hist_lsb.csv" every ::1 using 1:2 with linespoints title "LSB Histogram"