; Microsoft Visual Studio 2019 
; MASM x64


.code 
; char* toUpperCase(char *arr, int n):
; Setting to uppercase first 'n' alphabetic letters, where:
;	arr - pointer to array of char
;	n	- number of characters
;	return - arr
toUpperCase proc
	it equ rsi
	arr_it equ rcx
	n equ edx
	char textequ <sbyte ptr [arr_it]>

	push rbp
	mov rbp, rsp
	push rcx


LB_new_char:
	cmp char, 65	; smaller than char 'A'
	jb LB_omit
	cmp char, 91	; smaller than char 'Z'
	jbe LB_dec
	cmp char, 97	; smaller than char 'a'
	jb LB_omit
	cmp char, 122	; greater than char 'z'
	ja LB_omit 

	and char, 0DFh	; zeroing 5 bit
LB_dec:
	dec n

LB_omit:
	inc arr_it

	; if (str[it]=="\0") then end the procedure
	cmp char, 0	
	je LB_end

	; if(i < n) then continue loop
	cmp n, 0	
	jne LB_new_char

LB_end:
	pop rcx
	pop rbp
	mov rax, arr_it
	ret

toUpperCase endp 
End
