FROM ubuntu
COPY 1.sh .
COPY 1.txt /home/1.txt
COPY 2.txt /home/2.txt
RUN chmod ugo+x 1.sh
CMD ./1.sh
