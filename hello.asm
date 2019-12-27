signature db "YANG"
version dw 1
length dw end
start dw begin
zoneseg dw 0100h
reserved dd 0

begin:
pusha
push di
push si
push es
mov bx,77h
push bx
mov al,80
mov ah,5
int 10h
cld
mov ax,cs
mov ds,ax

mov cx,25
repeat:
mov al,0dh
mov bh,0
mov ah,14
int 10h
mov al,0ah
int 10h
loop repeat

xor dx,dx
xor cx,cx

ppp:
push dx
mov dh,cl
mov bh,0
mov ah,2
int 10h
pop dx

mov ah,0
int 16h
cmp al,'w'
jne p2
sub cl,1
p2:
cmp al,'s'
jne p3
add cl,1
p3:
cmp al,'a'
jne p4
sub dl,1
p4:
cmp al,'d'
jne p5
add dl,1
p5:
cmp al,'j'
jne p6
jmp draw
p6:
cmp al,'c'
jne p7
mov ax,3
int 10h
jmp ppp
p7:
cmp al,'1'
jne p8
pop bx
mov bx,47h
push bx
p8:
cmp al,'2'
jne p9
pop bx
mov bx,27h
push bx
p9:
cmp al,'3'
jne p10
pop bx
mov bx,17h
push bx
p10:
cmp al,'4'
jne p11
pop bx
mov bx,77h
push bx
p11:
cmp al,'0'
jne p12
pop bx
mov bx,07h
push bx
p12:
cmp al,'p'
jne ppp

mov ax,3
int 10h
pop bx
pop es
pop si
pop di
popa
retf

draw:
mov si,hello
mov ax,0b800h
mov es,ax
pop bx
mov ah,bl
push bx
xor bx,bx
mov bx,80
imul bx,cx
add bx,dx
imul bx,2
mov di,bx
;mov ah,77h
loc1:
lodsb
or al,al
jz loc2
stosw
jmp loc1
loc2:
jmp ppp

hello db " ",0
end: