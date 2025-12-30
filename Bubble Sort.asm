org 100h
      ;BUBBLE SORT
.DATA 
arr: db 1,20,5,5,12,6,7,4,3,19


.CODE
mov cx,9
mov si,0

BubbleSort:
    cmp cx,si
    jz Next
    mov al,arr[si]
    mov bl,arr[si+1]
    cmp al,bl
    ja exchange
    add si,1
    jmp BubbleSort
    
    exchange:
        mov arr[si],bl
        mov arr[si+1],al
        add si,1
        jmp BubbleSort


    Next:
    mov si,00
    sub cx,1
    cmp cx,0
    jnz BubbleSort










;org 100h  
;; I WILL SORT IT IN SIMPLE o(N**2) INSERTION SORT
;
;Data:
;    arr DW 1H,6H,2H,3H,0AH,2H
;    len DW 6
;    res DW 0H    ; i will use it in swapping
;    inner DW 5H      ;in inner loop
;    current DW 0H       ; current ix
;    min DW 0H
;
;
;MOV CX,[len]
;dec cx
;MOV SI,[current]
;MOV DI,0
;
;L1: 
;    MOV  SI ,[current]
;    MOV [min],SI
;    PUSH CX
;    MOV CX,[inner]
;    MOV DI,SI
;    add di,2
;    
;    
;L2: 
;    MOV ax,arr[DI]
;    MOV bx,[min]
;    cmp ax,arr[bx]
;    jle Switch
;    continue:
;        mov [res],arr[di]
;        mov es,[min]
;        mov arr[di],arr[es]
;        mov arr[min],[res]
;        
;        mov [min],di
;        Add DI,2
;        Loop L2
;        Add [current],2
;        dec inner
;        pop cx
;        loop L1
;        
;         
;    
;Switch:
;    MOV min,di
;    jmp continue    
;
;    
;      
;ret
;












;org 100h    PRACTISE
;MOV AL,0ffh
;MOV CX,Count
;MOV Ax,0
;Mov BX,0
;
;
;
;L1:
;    INC BL
;    MOV Count,CX
;    MOV Cx,Inner
;
;
;
;L2:
;    INC AL
;    Loop L2
;    MOV CX,Count
;    Loop L1
;    
;        
;ret 
;
;Count DW 5
;Inner DW 2
;
