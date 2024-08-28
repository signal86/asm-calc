global _start

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

section .bss ; uninitialized variables


section .text

_start:
    mov eax, 1 ; SYSWRITE
    mov edi, 1 ; STDOUT
    mov esi, msg
    mov edx, msglen
    syscall

    mov ax, 60 ; SYSEXIT
    mov di, 0 ; code 0
    syscall

section .data ; constants
    msg: db "Hello, world!", 10
    msglen: equ $ - msg
