; Interpret as 64 bits code
[bits 64]

; nu uitati sa scrieti in feedback ca voiati
; assembly pe 64 de biti

section .text
global map
global reduce
map:
    ; look at these fancy registers
    push rbp
    mov rbp, rsp

    ; sa-nceapa turneu'

    ; save callee-saved registers
    push r12
    push r13
    push rbx

    ; r12 = destination_array
    mov r12, rdi
    ; r13 = source_array
    mov r13, rsi
    ; rbx = array_size
    mov rbx, rdx
    ; r8 = f (function pointer)
    mov r8, rcx

    ; r9 = i (loop index) initially 0
    xor r9, r9

loop_start_1:
    cmp r9, rbx
    ; if i >= array_size, exit loop
    jge loop_end_1

    ; rax = source_array[i]
    mov rax, [r13 + r9 * 8]

    ; set up argument for f
    mov rdi, rax
    ; call the function f
    call r8

    ; destination_array[i] = result of f(source_array[i])
    mov [r12 + r9 * 8], rax

    ; i++
    inc r9
    jmp loop_start_1

loop_end_1:
    pop rbx
    pop r13
    pop r12

    leave
    ret



; int reduce(int *dst, int *src, int n, int acc_init, int(*f)(int, int));
; int f(int acc, int curr_elem);
reduce:
    ; look at these fancy registers
    push rbp
    mov rbp, rsp

    ; sa-nceapa festivalu'

    ; save callee-saved registers
    push r12
    push r13
    push rbx
    push r14
    push r15

    ; r12 = destination_array
    mov r12, rdi
    ; r13 = source_array
    mov r13, rsi
    ; rbx = array_size
    mov rbx, rdx
    ; r14 = accumulator_initial_value
    mov r14, rcx
    ; r15 = f (function pointer)
    mov r15, r8

    ; rdi = accumulator_initial_value
    mov rdi, r14

    ; r9 = i (loop index) initially 0
    xor r9, r9

loop_start_2:
    cmp r9, rbx
    ; if i >= array_size, exit loop
    jge loop_end_2

    ; rsi = source_array[i]
    mov rsi, [r13 + r9 * 8]

    ; set up first argument for f (accumulator)
    mov rdx, rdi
    ; set up second argument for f (current_elem)
    mov rcx, rsi
    ; call the function f
    call r15

    ; update accumulator with the result of f
    mov rdi, rax

    ; i++
    inc r9
    jmp loop_start_2

loop_end_2:
    ; store final accumulator value to 'rax'
    mov rax, rdi

    ; restore callee-saved registers
    pop r15
    pop r14
    pop rbx
    pop r13
    pop r12

    leave
    ret
