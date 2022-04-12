.data                   


mass:                   
	.byte 45, 3, 44, 123, 90, 1, 253, 1, 189, 65
mass_end:               
print_format:           
    .string "Sum = %d\n"

.text                   

.global main            
.type main, @function   


main:                       
    movl $mass, %eax       
    xorl %ecx, %ecx      
    xorl %esi, %esi        
    xorl %ebx, %ebx

start:                      
    movb (%eax), %bl         

    movl %ecx, %edx         
    and $1, %edx          
                             
                             
                              
                               
                           
    cmpl $1, %edx          
    jne chet              

nechet:                    
    or $0x10, %bl           
    jmp check_end_mass      

chet:                      
    and $0xDF, %bl          

check_end_mass:             
    movb %bl, (%eax)        
    addl %ebx, %esi         
    inc %eax                
                               
    inc %ecx                

    cmpl $mass_end, %eax    
                               
    jne start               


                            
    pushl %esi              
    pushl $print_format     
    call printf             
    addl $8, %esp           

    movl $1, %eax               
    int $0x80               

