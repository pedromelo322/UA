/usr/bin/time -v xz -9 -c data/model.safetensors > output/model.xz
ls -l output/model.xz
/usr/bin/time -v unxz -c output/model.xz > /dev/null