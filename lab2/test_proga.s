.data 

print:
    .string "Hello world in my first program ^_^ \n"
    .set len_print, . - print - 1


.text

.global main
.type main, @function


main:
    
    movl $4, %eax
    
    movl $1, %ebx
    
    movl $print, %ecx
        movl $len_print, %edx

        int $0x80


    movl $1, %eax
    movl $0, %ebx
    int $0x80
