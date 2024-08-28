    ;rax : syscall number
    ;rdi, rsi, rdx, rcx, r8, r9: arguments go in these registers in that order
    ;syscall : literally call the function
    ;
    ;inc : increment
    ;mov : set/transfer value
    ;add : add
    ;and : perform "and" operation

    ; registers
    ; 64 bit: rax, rbx, rcx, rdx, rsi, rdi, rbp, rsp, r8, r9, ... r15
    ; 32 bit: eax, ebx, ecx, edx, esi, edi, ebp, esp, r8d, r9d, ... r15d
    ; 16 bit: ax, bx, cx, dx, si, di, bp, sp, r8w... r15w
    ; 8 bit: al, bl, cl, dl, sil, dil, bpl, spl

    ; registers cont.
    ; AX (EAX, AX, AL): Primary Accumulator: IO, arithmetic
    ; BX (EBX, BX, BL): Base: index addressing 
    ; CX (ECX, CX, CL): stores loop count, iteration
    ; DX (EDX, DX, DL): also IO and arithmetic
    ; EIP, IP: instruction pointers
    ; ESP, EBP, SP, BP: stack and base pointers
    ; ESI, EDI, SI, DI: index addressing, addition and subtraction sometimes

EXIT equ 60
READ equ 0
WRITE equ 1
STDIN equ 0
STDOUT equ 1

section .bss ; uninitialized variables
    userNum1 resb 1
    userNum2 resb 1
    outp resb 3

section .text
    global _start

_start:
    ; prompt
    mov rax, WRITE
    mov rdi, STDOUT
    mov rsi, msg
    mov rdx, msgLen
    syscall

    ; read/store user input in userNum1
    mov rax, READ
    mov rdi, STDIN
    mov rsi, userNum1
    mov rdx, 2
    syscall

    ; prompt2
    mov rax, WRITE
    mov rdi, STDOUT
    mov rsi, msg2
    mov rdx, msg2Len
    syscall
    
    ; read/store second user input in userNum2
    mov rax, READ
    mov rdi, STDIN
    mov rsi, userNum2
    mov rdx, 2
    syscall

    ; move both numbers in eax and ebx
    mov ax, [userNum1] 
    mov bx, [userNum2]

    ; ASCII to decimal
    sub ax, '0'
    sub bx, '0'

    ; combine eax and ebx to eax
    add ax, bx
    ; decimal to ASCII
    ;add ax, '0'

    ; output variable set to value
    mov [outp], ax

    ; final output
    mov rax, WRITE
    mov rdi, STDOUT
    mov rsi, outp
    mov rdx, 3
    syscall

    ; exit
    mov rax, EXIT
    mov rdi, 0 ; code 0
    syscall

section .data ; constants
    msg db "Enter a number: ", 10
    msgLen equ $ - msg - 1
    msg2 db "Enter another number: ", 10
    msg2Len equ $ - msg2 - 1
