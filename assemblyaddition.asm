DATA SEGMENT
     NUM1 DB 9H
     NUM2 DB 7H
     RESULT DB ?
ENDS
 
CODE SEGMENT  
    ASSUME DS:DATA CS:CODE
START:
      MOV AX,DATA
      MOV DS,AX
 
      MOV AL,NUM1
      ADD AL,NUM2
 
      MOV RESULT,AL  
 
      MOV AH,4CH
      INT 21H      
ENDS
END START
