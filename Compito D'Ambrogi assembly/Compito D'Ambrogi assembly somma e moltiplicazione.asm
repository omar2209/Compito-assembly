
section .data
msg db "somma: " 
len equ $ - msg  
goal db "moltiplicazione: "
lun equ $ - goal

  new_line db 0xA
   len_nl equ $ - new_line

section .bss
risultato resb 1
mol resb 1

section .text
global _start

_start:
mov	eax, '2'
sub eax, '0'
mov	ebx, '4'
sub ebx, '0'

add	eax, ebx
add	eax, '0'
mov	[risultato], eax


mov	al, '2'
sub al, '0'
mov	bl, '2'
sub bl, '0'

mul bl;
add al, '0'
mov [mol], al


mov	ecx, msg
mov	edx, len
mov	ebx,1
mov	eax, 4
int	80h

mov	ecx, risultato
mov	edx, 1
mov	ebx, 1
mov	eax, 4
int	80h

 mov eax, 4
	mov ebx, 1
	mov ecx, new_line
	mov edx, len_nl
	int 80h

mov ecx, goal
mov	edx, lun
mov	ebx, 1
mov	eax, 4
int	80h

mov	ecx, mol
mov	edx, 1
mov	ebx, 1
mov	eax, 4
int	80h

mov	eax, 1
mov	ebx, 0
int	80h