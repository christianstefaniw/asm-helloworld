
section .data                     ; begin data section -> static data provided to program
    message db "Hello world", 0xA ; message var with type data byte appended with ASCII newline
    message_len equ $-message     ; message_len var with type of numeric constant storing the length of message var
                                  ; equ is kinda like `#define`

section .text            ; begin text section -> this is where code goes
global _start            ; export the `_start` label, needed by the linker
_start:                  ; begin start section -> this is the entry point of the program
    mov rax, 0x1         ; set the rax register (reg for temp storage) to sys_write system call id
    mov rdi, 0x1         ; set the rdi register (destination for data) to STDOUT
    mov rsi, message     ; set the rsi register (source for data) to our message variable
    mov rdx, message_len ; set te rdx register to the size of the message var
    syscall              ; os will check the values we loaded into the registers rax, rdi, rsi, and rd
    mov rax, 0x3C        ; set the rax register to sys_exit system call id
    mov rdi, 0x0         ; set the rdi register to exit status code 0
    syscall