FROM ubuntu

COPY ./mul.s .
COPY ./main_prog.cpp .

RUN apt update && apt install -y g++ gcc-multilib

RUN g++ main_prog.cpp -c -o main_prog.o
RUN as mul.s -o mul.o
RUN g++ -no-pie main_prog.o mul.o -o main

CMD ./main


