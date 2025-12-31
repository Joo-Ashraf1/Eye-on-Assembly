ORG 100h

.DATA
    s DB "({[])0"
    result DB "Valid  $"   ; Default message
    invalid DB "Invalid$"
    len DW 0

.CODE
    MOV AX, @DATA
    MOV DS, AX

    
    MOV SI, 0
FindLen:
    MOV AL, s[SI]
    CMP AL, '0'      
    JE FoundLen
    INC SI
    JMP FindLen
FoundLen:
    MOV [len], SI
    MOV CX, [len]
    JCXZ ValidExit
    MOV SI, 0

CheckLoop:
    MOV AL, s[SI]
    
    ; If Opening: Push to stack
    CMP AL, '('
    JE PushIt
    CMP AL, '['
    JE PushIt
    CMP AL, '{'
    JE PushIt
    
    ; If Closing: Pop and Compare
    CMP AL, ')'
    JE PopParen
    CMP AL, ']'
    JE PopSquare
    CMP AL, '}'
    JE PopCurly
    
    JMP NextChar     

PushIt:
    PUSH AX          
    INC SI
    LOOP CheckLoop
    JMP FinalCheck

PopParen:
    CALL CheckStackEmpty
    POP DX
    CMP DL, '('       
    JNE NotMatches
    JMP NextChar

PopSquare:
    CALL CheckStackEmpty
    POP DX
    CMP DL, '['
    JNE NotMatches
    JMP NextChar

PopCurly:
    CALL CheckStackEmpty
    POP DX
    CMP DL, '{'
    JNE NotMatches
    JMP NextChar

NextChar:
    INC SI
    LOOP CheckLoop

FinalCheck:
    ; At the end, the stack pointer (SP) should be where it started.

ValidExit:
    LEA DX, result
    MOV AH, 09h
    INT 21h
    RET

NotMatches:
    LEA DX, invalid
    MOV AH, 09h
    INT 21h
    RET

CheckStackEmpty PROC
    RET
CheckStackEmpty ENDP
       