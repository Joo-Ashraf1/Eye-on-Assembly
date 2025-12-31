.DATA
    str DB "maffaarrrr"
    len DB 0AH
    modifed DB 10 Dup('$')
.CODE
MOV cl,[len]
XOR ch,ch
mov si,0 ;for str
mov di,0 ; for modifed
mov al,str[si]
mov modifed[di],al
inc di
inc si
Function:
    cmp si,cx
    je terminate
    mov bl,str[si]
    cmp bl,al
    jnz notEqual
    inc si
    jmp Function
    
notEqual:
    mov al,str[si]
    mov modifed[di],al
    inc di
    inc si
    jmp Function    


terminate:
    ret