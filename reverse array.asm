org 100h
.DATA
   arr:DB 10,2,4,5,6
   len:DB 5

.CODE

MOV cx,[len]
dec cx
mov si,0
MOV di,cx

Reverse:
    mov al,arr[si]
    mov bl,arr[si+1]
    mov arr[si],bl
    mov arr[si+1],al
    cmp si,di
    je modify
    inc si
    jmp Reverse

modify:
    dec di
    mov si,0
    cmp si,di
    je terminate
    jmp Reverse    

terminate:
    ret