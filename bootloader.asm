;        Entry   AH    = 13h
;                AL    = Subservice (0-3)
;                BH    = Display page number
;                BL    = Attribute (Subservices 0 and 1)
;                CX    = Length of string
;                DH    = Row position where string is to be written
;                DL    = Column position where string is to be written
;                ES:BP = Pointer to string to write


xor ax, ax
mov ds, ax
mov ss, ax
mov es, ax

mov ah, 0x13
mov al, 0x01
mov bh, 0x00
mov bl, 0x02 
mov cx, 0x36
mov dh, 0x05
mov dl, 0x05
mov bp, frase
add bp, 0x7C00
int 0x10

mov bl, 0x0C
mov cx, 0x36
mov dh, 0x09
mov dl, 0x19
mov bp, frase2
add bp, 0x7c00
int 0x10


jmp $

frase: db 'Hello World but in Assembly (and now in green letters) i think i forgot to display this', 0x0a ; 54d characters -> 36h
frase2: db 'ciro vo te come miseravel' ; 25d -> 19h


times 510 - ( $ - $$ ) db 0
dw 0xAA55