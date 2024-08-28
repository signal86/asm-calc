nasm -f elf64 -o build.o main.s
ld -o build build.o
