; Microsoft Visual Studio 2019 
; MASM x64
; Quicksort - implementation of Hoare partition scheme

.code
arr textequ <rcx>
start  textequ <rdx>
_end  textequ <r8>
arrmid textequ <r11d>

; void quicksort(int *arr, int start, int end):
; Sort an array of ints, where
;	arr - pointer to array of ints
;	start - index pointing at the first element 
;	end - index pointing at the last element 
; 

quicksort proc
	push rbp
	mov rbp, rsp
	push rax

	; usage:
	;  rcx - arr - pointer to the array
	;  rdx - _end  - size of the array
	;  r8  - start  - 0
	;  'partitioning' returns in rax next start/_end value
	call partitioning

	; set new range:
	; _end := rax
	; start := start (old value)
	; jump to LB_omit if start == end
	push _end
	mov _end, rax
	cmp start, _end
	jz LB_omit
	call quicksort
LB_omit:
	pop _end

	; set new range:
	;  _end := _end (old value)
	;  start := rax
	;  jump to LB_end if start == end
	push start
	mov start, rax
	inc start
	cmp start, _end
	jz LB_end
	call quicksort

LB_end:
	pop start
	pop rax
	pop rbp
	ret
quicksort endp

partitioning proc
	push rbp
	mov rbp, rsp
	push _end
	push start

	; rbx hold index of the middle element
	mov rbx, _end
	add rbx, start
	shr rbx, 1		; (_end+start)/2
	mov arrmid, [arr+4*rbx]

	dec start
	inc _end

LB_Repeat:
LB_start_smaller_than_mid:
	; do .. while loop
	; start - iterator starting from the start of the array
	; increment start
	; if Arr[start] >= Arr[(_end+start)/2], break the loop
	inc start
	cmp [arr+4*start], arrmid
	jl LB_start_smaller_than_mid	; jump if Arr[start] < Arr[(_end+start)/2]

LB_end_greater_than_mid:
	; do .. while loop
	; _end - iterator starting from the end of the array
	; decrement _end
	; if Arr[_end] <= Arr[(_end+start)/2], break the loop
	dec _end
	cmp [arr+4*_end], arrmid; Arr[(_end+start)/2]
	jg LB_end_greater_than_mid		; jump if Arr[end] > Arr[(_end+start)/2]

	; if(start >= _end) end procedure
	cmp start, _end	
	jge LB_end

	; swap Arr[start] and Arr[_end]
	mov r9d, dword ptr [arr+4*_end]						
	mov r10d, dword ptr [arr+4*start]
	mov dword ptr [arr+4*_end], r10d	
	mov dword ptr [arr+4*start], r9d
	jmp LB_Repeat
	

LB_end:
	; save _end as new start/_end for another 'quicksort' procedure
	mov rax, _end
	pop start
	pop _end
	pop rbp
	ret
partitioning endp
End
