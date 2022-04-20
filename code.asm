section .data
msg1: db "enter 5 numbers :" , 10
msg1_len equ $ - msg1:

msg2: db "these are the 5 numbers :" , 10
msg2_len equ $ - msg2:


section .bss
array resb 200
counter resb 2

section .text
global _start
       _start:

;display call for msg1
mov rax, 0
mov rdi, 0
mov rsi, msg1
mov rdx, msg1_len
syscall

mov r8, array
mov byte[counter],05

;accept call for numbers
up:mov rax, 0
mov rdi, 0
mov rsi, r8
mov rdx, 17
syscall

add r8, 17
dec byte[counter]
jnz up

;display call for msg2
mov rax,1
mov rdi, 1
mov rsi, msg2
mov rdx, msg2_len
syscall

;display call for numbers
mov rax, 1
mov rdi, 1
mov rsi, array
mov rdx, 200
syscall

;Exit call
mov rax, 60
mov rdi, 0
syscall




