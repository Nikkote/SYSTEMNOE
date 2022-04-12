FROM ubuntu
RUN apt-get update
RUN apt install gcc gdb gcc-multilib nano -y
COPY asm.s .
RUN gcc -m32 asm.s -o asm
CMD ./asm
