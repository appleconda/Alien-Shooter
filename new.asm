;hexa for spacebar = 3920h                               
.model large 
.stack 4096
clear_screen macro
                 mov ah, 0h
                 mov al, 13h
                 int 10h
ENDM
;;;;;;;;;;;;;;;;;;;;;;
;MACRO FOR TITLE PAGE;
;;;;;;;;;;;;;;;;;;;;;;
titlepage macro 
		
	;background solid colors for the starting page
		mov bx,0
		mov cx,0
		mov dx,0
		.while cx!=60
			mov dx,0
			mov ycoord,199
			mov color,05h
			call verticalline
			inc cx
		.endw

		mov cx,260
		mov dx,0
		.while cx!=319
			mov dx,0
			mov ycoord,199
			mov color,05h
			call verticalline
			inc cx
		.endw

		mov cx,60
		mov dx,0
		.while dx!=40
			mov cx,60
			mov xcoord,260
			mov color,03h
			call horizontalline
			inc dx
		.endw

		mov cx,60
		mov dx,160
		.while dx!=200
			mov cx,60
			mov xcoord,260
			mov color,03h
			call horizontalline
			inc dx
		.endw

	;displaying "Galaxy Attack: Alien Shooter"
		mov dh, 8		;row coordinate
		mov dl, 8		;column coordinate
		mov ah,02h
		int 10h			;moving cursor position

		mov dx, offset introduction
		mov ah, 09h
		int 21h
	 
		mov dh, 10		;row coordinate
		mov dl, 8		;column coordinate
		mov ah,02h
		int 10h			;moving cursor position

		
	;displaying "Enter your username: "
		mov dx, offset name_prompt
		mov ah, 09h
		int 21h

		mov dl,10
		mov ah,02h
		int 21h

	;taking username
		mov dh, 12		;row coordinate
		mov dl, 8		;column coordinate
		mov ah,02h
		int 10h			;moving cursor position

	mov si,offset uname
	mov cx,8
	.while al!=13
		mov ah, 0			;interupt for key press, which one
		int 16h
		mov [si], al			;key pressed is stored in al 

		mov dl,al
		mov ah,02h
		int 21h

		inc si
		dec cx
	.endw

	;displaying "You are in!"
	mov al,'$'
	mov [si],al

		mov dh, 14		;row coordinate
		mov dl, 8		;column coordinate
		mov ah,02h
		int 10h
	mov dx, offset msg3
	mov ah, 09h
	int 21h
endm

.data

    shape1              DB 07h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh    ;  0
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh    ;  1
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h    ;  2
                        DB 07h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh    ;  3
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh    ;  4
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h    ;  5
                        DB 07h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh    ;  6
                        DB 0Fh,0Fh,07h,08h,07h,0Fh,0Fh,0Fh    ;  7
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h    ;  8
                        DB 07h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh    ;  9
                        DB 0Fh,07h,06h,04h,08h,0Fh,0Fh,0Fh    ; 10
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h    ; 11
                        DB 07h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh    ; 12
                        DB 07h,08h,06h,04h,04h,08h,0Fh,0Fh    ; 13
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h    ; 14
                        DB 07h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh    ; 15
                        DB 07h,06h,06h,04h,04h,04h,07h,0Fh    ; 16
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h    ; 17
                        DB 07h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,08h    ; 18
                        DB 06h,06h,06h,04h,04h,04h,08h,07h    ; 19
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h    ; 20
                        DB 07h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,06h    ; 21
                        DB 06h,06h,07h,07h,08h,04h,04h,08h    ; 22
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h    ; 23
                        DB 07h,0Fh,0Fh,07h,07h,0Fh,0Fh,06h    ; 24
                        DB 06h,08h,0Fh,0Fh,07h,08h,04h,08h    ; 25
                        DB 0Fh,0Fh,07h,0Fh,0Fh,0Fh,0Fh,00h    ; 26
                        DB 07h,0Fh,0Fh,07h,08h,0Fh,07h,06h    ; 27
                        DB 06h,07h,07h,07h,07h,08h,04h,08h    ; 28
                        DB 0Fh,0Fh,08h,0Fh,0Fh,0Fh,0Fh,00h    ; 29
                        DB 07h,0Fh,0Fh,07h,08h,07h,08h,06h    ; 30
                        DB 06h,08h,07h,07h,08h,04h,04h,04h    ; 31
                        DB 08h,07h,08h,0Fh,0Fh,0Fh,0Fh,00h    ; 32
                        DB 07h,0Fh,0Fh,08h,08h,08h,06h,06h    ; 33
                        DB 06h,06h,08h,08h,04h,04h,04h,04h    ; 34
                        DB 06h,08h,06h,07h,0Fh,0Fh,0Fh,00h    ; 35
                        DB 07h,0Fh,07h,08h,04h,04h,04h,06h    ; 36
                        DB 06h,06h,06h,04h,04h,04h,04h,04h    ; 37
                        DB 04h,04h,04h,08h,0Fh,0Fh,0Fh,00h    ; 38
                        DB 07h,0Fh,0Fh,07h,07h,08h,06h,06h    ; 39
                        DB 06h,06h,06h,04h,04h,04h,04h,04h    ; 40
                        DB 08h,07h,07h,0Fh,0Fh,0Fh,0Fh,00h    ; 41
                        DB 07h,0Fh,0Fh,0Fh,0Fh,0Fh,07h,06h    ; 42
                        DB 06h,06h,06h,04h,04h,04h,04h,08h    ; 43
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h    ; 44
                        DB 07h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,06h    ; 45
                        DB 06h,06h,06h,04h,04h,04h,04h,08h    ; 46
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h    ; 47
                        DB 07h,0Fh,0Fh,0Fh,0Fh,0Fh,07h,08h    ; 48
                        DB 08h,08h,06h,06h,06h,08h,08h,08h    ; 49
                        DB 07h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h    ; 50
                        DB 07h,0Fh,0Fh,0Fh,0Fh,07h,03h,03h    ; 51
                        DB 03h,08h,06h,06h,06h,03h,03h,03h    ; 52
                        DB 07h,07h,0Fh,0Fh,0Fh,0Fh,0Fh,00h    ; 53
                        DB 07h,0Fh,0Fh,0Fh,08h,08h,08h,08h    ; 54
                        DB 08h,06h,06h,06h,06h,08h,08h,08h    ; 55
                        DB 08h,08h,07h,0Fh,0Fh,0Fh,0Fh,00h    ; 56
                        DB 07h,0Fh,0Fh,07h,06h,06h,06h,06h    ; 57
                        DB 06h,06h,06h,06h,06h,06h,06h,06h    ; 58
                        DB 06h,06h,06h,0Fh,0Fh,0Fh,0Fh,00h    ; 59
                        DB 07h,0Fh,0Fh,0Fh,07h,06h,06h,06h    ; 60
                        DB 06h,06h,06h,06h,06h,06h,06h,06h    ; 61
                        DB 06h,08h,07h,0Fh,0Fh,0Fh,0Fh,00h    ; 62
                        DB 07h,0Fh,0Fh,0Fh,0Fh,07h,08h,04h    ; 63
                        DB 05h,06h,06h,06h,06h,06h,04h,08h    ; 64
                        DB 07h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h    ; 65
                        DB 07h,0Fh,0Fh,0Fh,0Fh,0Fh,07h,09h    ; 66
                        DB 03h,07h,08h,06h,08h,03h,03h,08h    ; 67
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h    ; 68
                        DB 07h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,08h    ; 69
                        DB 09h,0Bh,0Bh,07h,0Bh,0Bh,09h,07h    ; 70
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h    ; 71
                        DB 07h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,07h    ; 72
                        DB 09h,0Bh,0Bh,0Fh,0Bh,09h,08h,0Fh    ; 73
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h    ; 74
                        DB 07h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,07h    ; 75
                        DB 08h,03h,0Bh,0Fh,0Bh,09h,07h,07h    ; 76
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h    ; 77
                        DB 07h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh    ; 78
                        DB 07h,09h,0Bh,0Fh,0Bh,09h,07h,0Fh    ; 79
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h    ; 80
                        DB 07h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh    ; 81
                        DB 07h,03h,0Bh,0Fh,0Bh,08h,0Fh,0Fh    ; 82
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h    ; 83
                        DB 07h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh    ; 84
                        DB 0Fh,07h,0Bh,0Bh,0Bh,07h,0Fh,0Fh    ; 85
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h    ; 86
                        DB 07h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh    ; 87
                        DB 0Fh,0Fh,07h,0Bh,07h,0Fh,0Fh,0Fh    ; 88
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h    ; 89
                        DB 07h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh    ; 90
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh    ; 91
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h    ; 92
                        DB 00h,00h,00h,00h,00h,00h,00h,00h    ; 93
                        DB 00h,00h,00h,00h,00h,00h,00h,00h    ; 94
                        DB 00h,00h,00h,00h,00h,00h,00h,00h    ; 95

  
    shape2              DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh    ;  0
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh    ;  1
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h    ;  2
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh    ;  3
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh    ;  4
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h    ;  5
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh    ;  6
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh    ;  7
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h    ;  8
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh    ;  9
                        DB 0Fh,0Fh,07h,08h,08h,0Fh,0Fh,0Fh    ; 10
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h    ; 11
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh    ; 12
                        DB 0Fh,07h,07h,08h,08h,07h,0Fh,0Fh    ; 13
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h    ; 14
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh    ; 15
                        DB 07h,05h,08h,08h,08h,05h,08h,0Fh    ; 16
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h    ; 17
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh    ; 18
                        DB 07h,05h,07h,07h,07h,05h,08h,0Fh    ; 19
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h    ; 20
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,08h    ; 21
                        DB 05h,08h,07h,0Fh,07h,07h,05h,05h    ; 22
                        DB 07h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h    ; 23
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,07h,05h    ; 24
                        DB 05h,07h,0Fh,0Fh,0Fh,07h,08h,01h    ; 25
                        DB 08h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h    ; 26
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,07h,05h    ; 27
                        DB 05h,07h,07h,07h,07h,07h,08h,01h    ; 28
                        DB 08h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h    ; 29
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,07h,05h    ; 30
                        DB 05h,05h,07h,07h,07h,07h,05h,05h    ; 31
                        DB 08h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h    ; 32
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,07h,05h    ; 33
                        DB 05h,05h,08h,07h,07h,05h,05h,05h    ; 34
                        DB 08h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h    ; 35
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,07h,05h    ; 36
                        DB 05h,05h,08h,08h,08h,05h,05h,05h    ; 37
                        DB 08h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h    ; 38
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,07h,05h    ; 39
                        DB 05h,05h,08h,08h,08h,05h,05h,05h    ; 40
                        DB 08h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h    ; 41
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,07h,05h    ; 42
                        DB 05h,05h,08h,08h,08h,05h,05h,05h    ; 43
                        DB 08h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h    ; 44
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,07h,05h    ; 45
                        DB 05h,05h,08h,08h,08h,05h,05h,05h    ; 46
                        DB 08h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h    ; 47
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,07h,05h    ; 48
                        DB 05h,05h,08h,08h,08h,05h,05h,05h    ; 49
                        DB 08h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h    ; 50
                        DB 0Fh,0Fh,08h,0Fh,0Fh,0Fh,07h,07h    ; 51
                        DB 07h,07h,07h,07h,08h,08h,08h,08h    ; 52
                        DB 08h,0Fh,0Fh,0Fh,07h,07h,0Fh,00h    ; 53
                        DB 0Fh,07h,08h,07h,0Fh,0Fh,07h,07h    ; 54
                        DB 07h,07h,07h,07h,08h,08h,08h,08h    ; 55
                        DB 07h,0Fh,0Fh,0Fh,08h,07h,0Fh,00h    ; 56
                        DB 0Fh,07h,04h,07h,0Fh,07h,07h,08h    ; 57
                        DB 08h,08h,08h,08h,05h,05h,05h,05h    ; 58
                        DB 08h,07h,07h,0Fh,08h,08h,0Fh,00h    ; 59
                        DB 0Fh,07h,04h,07h,07h,05h,08h,07h    ; 60
                        DB 07h,07h,07h,07h,08h,08h,08h,08h    ; 61
                        DB 08h,05h,08h,07h,08h,08h,0Fh,00h    ; 62
                        DB 07h,08h,04h,05h,05h,05h,08h,07h    ; 63
                        DB 07h,07h,07h,08h,08h,08h,08h,08h    ; 64
                        DB 08h,05h,05h,05h,04h,08h,07h,00h    ; 65
                        DB 07h,08h,08h,08h,08h,08h,05h,05h    ; 66
                        DB 08h,08h,08h,08h,08h,08h,08h,05h    ; 67
                        DB 05h,04h,08h,08h,08h,08h,08h,00h    ; 68
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,07h,08h,05h    ; 69
                        DB 09h,03h,0Bh,07h,0Bh,03h,08h,08h    ; 70
                        DB 04h,08h,0Fh,0Fh,0Fh,0Fh,0Fh,00h    ; 71
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,07h    ; 72
                        DB 07h,09h,0Bh,0Fh,0Bh,09h,08h,07h    ; 73
                        DB 07h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h    ; 74
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh    ; 75
                        DB 07h,08h,0Bh,0Fh,0Bh,09h,07h,0Fh    ; 76
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h    ; 77
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh    ; 78
                        DB 0Fh,08h,0Bh,0Bh,0Bh,08h,0Fh,0Fh    ; 79
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h    ; 80
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh    ; 81
                        DB 0Fh,0Fh,0Bh,0Bh,0Bh,07h,0Fh,0Fh    ; 82
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h    ; 83
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh    ; 84
                        DB 0Fh,0Fh,07h,07h,07h,0Fh,0Fh,0Fh    ; 85
                        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h    ; 86
                        DB 00h,00h,00h,00h,00h,00h,00h,00h    ; 87
                        DB 00h,00h,00h,00h,00h,00h,00h,00h    ; 88
                        DB 00h,00h,00h,00h,00h,00h,00h,00h    ; 89
                        DB 00h,00h,00h,00h,00h,00h,00h,00h    ; 90
                        DB 00h,00h,00h,00h,00h,00h,00h,00h    ; 91
                        DB 00h,00h,00h,00h,00h,00h,00h,00h    ; 92
                        DB 00h,00h,00h,00h,00h,00h,00h,00h    ; 93
                        DB 00h,00h,00h,00h,00h,00h,00h,00h    ; 94
                        DB 00h,00h,00h,00h,00h,00h,00h,00h    ; 95


    shape3  DB 07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h     ;  0
        DB 07h,07h,07h,00h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Bh,0Bh,0Bh,0Fh,0Fh,0Fh     ;  1
        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Bh,0Bh,0Bh     ;  2
        DB 0Bh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh     ;  3
        DB 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h,0Fh,0Fh,0Fh,0Fh     ;  4
        DB 0Fh,0Fh,0Fh,0Fh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h     ;  5
        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,07h,0Bh,0Bh,07h,0Fh,0Fh,07h,0Bh,0Bh,07h,0Fh,0Fh,0Fh,0Fh     ;  6
        DB 0Fh,0Fh,0Fh,00h,07h,08h,07h,0Fh,0Fh,0Fh,07h,0Bh,07h,07h,0Fh,0Fh,07h,07h,03h,08h     ;  7
        DB 0Fh,0Fh,0Fh,07h,08h,07h,0Fh,00h,07h,06h,07h,0Fh,0Fh,0Fh,0Bh,0Bh,07h,07h,07h,07h     ;  8
        DB 07h,07h,0Bh,03h,0Fh,0Fh,0Fh,07h,06h,07h,0Fh,00h,07h,08h,07h,0Fh,07h,08h,03h,03h     ;  9
        DB 0Bh,07h,07h,07h,07h,0Bh,0Bh,03h,08h,07h,0Fh,07h,08h,07h,0Fh,00h,07h,03h,07h,0Fh     ; 10
        DB 08h,08h,03h,03h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,03h,08h,08h,0Fh,07h,03h,07h,0Fh,00h     ; 11
        DB 07h,08h,07h,07h,08h,08h,03h,03h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,03h,08h,08h,07h,07h     ; 12
        DB 08h,07h,0Fh,00h,07h,07h,06h,06h,08h,08h,03h,03h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,03h     ; 13
        DB 08h,08h,06h,06h,07h,07h,0Fh,00h,0Fh,07h,06h,06h,08h,08h,03h,03h,0Bh,0Bh,0Bh,0Bh     ; 14
        DB 0Bh,0Bh,0Bh,03h,08h,08h,06h,06h,07h,07h,0Fh,00h,0Fh,07h,07h,06h,08h,08h,03h,03h     ; 15
        DB 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,03h,08h,08h,06h,06h,07h,0Fh,0Fh,00h,0Fh,0Fh,07h,07h     ; 16
        DB 08h,08h,03h,03h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,03h,03h,08h,08h,07h,07h,0Fh,0Fh,0Fh,00h     ; 17
        DB 0Fh,0Fh,0Fh,0Fh,08h,08h,03h,03h,0Bh,0Bh,0Bh,03h,03h,03h,03h,03h,08h,08h,0Fh,0Fh     ; 18
        DB 0Fh,0Fh,0Fh,00h,0Fh,0Fh,0Fh,0Fh,07h,07h,03h,03h,0Bh,0Bh,0Bh,03h,09h,03h,03h,03h     ; 19
        DB 08h,07h,0Fh,0Fh,0Fh,0Fh,0Fh,00h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,07h,08h,08h,08h,08h,08h     ; 20
        DB 08h,08h,08h,08h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,08h     ; 21
        DB 03h,0Bh,07h,07h,0Bh,03h,08h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h,0Fh,0Fh,0Fh,0Fh     ; 22
        DB 0Fh,0Fh,0Fh,07h,09h,0Bh,0Fh,0Bh,0Bh,09h,07h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h     ; 23
        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,07h,08h,0Bh,0Bh,0Bh,03h,08h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh     ; 24
        DB 0Fh,0Fh,0Fh,00h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,07h,03h,0Bh,0Bh,03h,07h,0Fh,0Fh     ; 25
        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,07h,03h,0Bh,0Bh     ; 26
        DB 03h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh     ; 27
        DB 0Fh,07h,0Bh,0Bh,08h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h,0Fh,0Fh,0Fh,0Fh     ; 28
        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,07h,07h,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,00h     ; 29
        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh     ; 30
        DB 0Fh,0Fh,0Fh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 31
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 32
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 33
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 34
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 35
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 36
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h     ; 37
        DB 00h,00h,00h,00h,00h,00h,00h,00h
 
 
    ;display proc parameters variables
    start_xaxis_figure1 dw 100
    start_yaxis_figure1 dw 150


    ;display_shape2 parameters variables
    
    start_xaxis_figure2 dw 130
    start_yaxis_figure2 dw 100
    display_stopCount2  dw 0

    ;display shape3 proc variables 
    start_xaxis_figure3 dw 50
    start_yaxis_figure3 dw 0
    

    ;vertical line varibales 
    start_x_axis_line dw ? 
    start_y_axis_line dw ? 
    end_y_axis_line dw ? 


    ;first intro page variables 
    introduction db "Galaxy Attack: Alien Shooter", '$'
    name_prompt db "Enter your username: ", '$'
    level1_str db "Easy ", '$'
    level2_str db "Medium ", '$'
    level3_str db "Difficult ", '$'

    cursor db ?
    xcoord dw 0
    ycoord dw 0
    uname db 26 dup(?)
    msg3 db "You are in!$"

color db 0

.code
main proc
                        mov          ax, @data
                        mov          ds,ax
                        mov          ah, 0h
                        mov          al, 13h
                        int          10h
                        
                        titlepage
                        clear_screen

                        call         display_shape1
                        

                        call display_shape3
                        
                        xor          ax, ax
                        xor          bx, bx
                        xor          si, si
                        xor          cx, cx
                        xor          dx, dx
    ;call display_shape2


    jmp_keybrd_scanCode:
                        mov          ah, 00h
                        int          16h
                        cmp          ax, 4800h
                        je           press_up
                        cmp          ax, 5000h
                        je           press_down
                        cmp          ax, 19712
                        je           press_right
                        cmp          ax, 4b00h
                        je           press_left
                        cmp             ax, 3920h 
                        je              spacebar 
                        JMP          jmp_keybrd_scanCode

    press_up:           

                        clear_screen
                        mov          ax, start_yaxis_figure1
                        sub          ax, 1
                        mov          start_yaxis_figure1, ax
                        call         display_shape1
            
                        jmp          jmp_keybrd_scanCode

    press_down:         
                        clear_screen
                        mov          ax, start_yaxis_figure1
                        add          ax, 1
                        mov          start_yaxis_figure1, ax
                        call         display_shape1

                        jmp          jmp_keybrd_scanCode

    press_left:         
                        clear_screen
                        mov          ax, start_xaxis_figure1
                        sub          ax, 1
                        mov          start_xaxis_figure1, ax
                        call         display_shape1
                        jmp          jmp_keybrd_scanCode
       
    press_right:        
                        clear_screen
                        mov          ax, start_xaxis_figure1
                        add          ax, 1
                        mov          start_xaxis_figure1, ax
                        call         display_shape1
                        jmp          jmp_keybrd_scanCode

                        mov          ah, 0h

    spacebar: 
        call bulletFire
    
        jmp jmp_keybrd_scanCode
        
                        mov          ah, 04ch
                        int          21h

main endp

display_shape1 proc
    ;for this function, start video mode outside in main
 .data
    end_xaxis_figure1    dw 124
    end_yaxis_figure1    dw 32
    end_dx1              dw 100
    display_stopCount1   dw ?
    pixel_width_figure1  dw 24     ;pixel dimension in width
    pixel_height_figure1 dw 32
 .code
                        push ax
                        push bx
                        push si
                        push cx
                        push dx
                        mov  si, 0
                        mov  ax, 0
                        mov  cx, 0
                        mov  dx, 0

                        mov  ax, pixel_width_figure1
                        add  ax, start_xaxis_figure1
                        mov  end_xaxis_figure1, ax

                        mov  ax, pixel_height_figure1
                        mov  end_yaxis_figure1, ax

                        mov  ax, start_yaxis_figure1
                        mov  end_dx1, ax


                        mov  bx, start_xaxis_figure1
                          
                        mov  display_stopCount1, 0

    label_displayProc_1:
                        mov  ah, 0ch
                        mov  al, shape1[si]
                        mov  cx, bx
                        mov  dx, end_dx1
                        int  10h

                        inc  bx
                        inc  si
                        cmp  bx, end_xaxis_figure1
                        jne  label_displayProc_1
                        je   label_displayProc_2

    label_displayProc_2:
                        mov  bx, start_xaxis_figure1
                        inc  end_dx1
                        inc  display_stopCount1
                        mov  dx, display_stopCount1
                        cmp  dx, end_yaxis_figure1
                        Je   label_displayProc_3
                        jmp  label_displayProc_1
      
    label_displayProc_3:

                        ;display bullet here 
                        

                        pop  ax
                        pop  bx
                        pop  si
                        pop  cx
                        pop  dx
                        ret
display_shape1 endp

display_shape2 proc
    ;for this function, start video mode outside in main
 .data
    end_xaxis_figure2    dw 154
    end_yaxis_figure2    dw 30
    end_dx2              dw 100
    pixel_width_figure2  dw 24     ;pixel dimension in width
    pixel_height_figure2 dw 30
    

 .code
                          mov ax, pixel_width_figure2
                          add ax, start_xaxis_figure2
                          mov end_xaxis_figure2, ax

                          mov ax, pixel_height_figure2
                          mov end_yaxis_figure2, ax

                          mov ax, start_yaxis_figure2
                          mov end_dx2, ax

                          mov bx, start_xaxis_figure2
                          mov si, 0
                          mov display_stopCount2, 0
    label_displayProc_1_1:
                          mov ah, 0ch
                          mov al, shape2[si]
                          mov cx, bx
                          mov dx, end_dx2
                          int 10h

                          inc bx
                          inc si
                          cmp bx, end_xaxis_figure2
                          jne label_displayProc_1_1
                          je  label_displayProc_2_1

    label_displayProc_2_1:
                          mov bx, start_xaxis_figure2
                          inc end_dx2
                          inc display_stopCount2
                          mov dx, display_stopCount2
                          cmp dx, end_yaxis_figure2
                          Je  label_displayProc_3_1
                          jmp label_displayProc_1_1
        
    label_displayProc_3_1:
                          ret
display_shape2 endp
display_shape3 proc 
    .data
    end_xaxis_figure3    dw 154
    end_yaxis_figure3    dw 30
    end_dx3              dw 100
    pixel_width_figure3  dw 24     ;pixel dimension in width
    pixel_height_figure3 dw 27
    display_stopCount3 dw ? 

 .code
                          mov           ax, pixel_width_figure3
                          add           ax, start_xaxis_figure3
                          mov           end_xaxis_figure3, ax

                          mov           ax, pixel_height_figure3
                          mov           end_yaxis_figure3, ax

                          mov           ax, start_yaxis_figure3
                          mov           end_dx3, ax

                          mov           bx, start_xaxis_figure3
                          mov           si, 0
                          mov           display_stopCount3, 0
    label_displayProc_1_3:
                          mov           ah, 0ch
                          mov           al, shape3[si]
                          mov           cx, bx
                          mov           dx, end_dx3
                          int           10h

                          inc           bx
                          inc           si
                          cmp           bx, end_xaxis_figure3
                          jne           label_displayProc_1_3
                          je            label_displayProc_2_3

    label_displayProc_2_3:
                          mov           bx, start_xaxis_figure3
                          inc           end_dx3
                          inc           display_stopCount3
                          mov           dx, display_stopCount3
                          cmp           dx, end_yaxis_figure3
                          Je            label_displayProc_3_3
                          jmp           label_displayProc_1_3
        
    label_displayProc_3_3: 
ret 
display_shape3 endp 
draw_vertical proc 
    push cx
    push dx
    push bx
    
    mov bx, start_y_axis_line
   

    l2: 
        mov ah, 0ch 
        mov al, 11
        mov cx, start_x_axis_line
        mov dx, bx 
        int 10h

        dec bx
        cmp bx, end_y_axis_line
        jne l2
    pop cx
    pop dx
    pop bx
    ret
draw_vertical endp 


erase_line proc 
    push cx
    push dx
    push bx
    
    mov bx, start_y_axis_line
   

    erase_line_proc_label1: 
        mov ah, 0ch 
        mov al, 00
        mov cx, start_x_axis_line
        mov dx, bx 
        int 10h

        dec bx
        cmp bx, end_y_axis_line
        jne erase_line_proc_label1
    pop cx
    pop dx
    pop bx 
ret
erase_line endp 

bulletFire proc


    mov ax, start_xaxis_figure1
    add ax, 12
    mov start_x_axis_line, ax
    mov ax, start_yaxis_figure1
    mov start_y_axis_line, ax 

    mov ax, start_y_axis_line
    sub ax, 100
    mov end_y_axis_line, ax ;setting y axis line here this will be where the line made will end 
    call draw_vertical
    ;nop looop to gimmick a delay in the game 
    mov cx, 1000000000
    bullet_fire_nop: 
        nop
    loop bullet_fire_nop
    ;calling erase line to erase teh bullet so sucessive bullets can be made 
    call erase_line
    

    
ret 
bulletFire endp 

;---------------------------intro page procedures ----------------------------
;Shamaeim
;----------
;----------BEGIN-------------
verticalline proc
line2:
mov ah, 0ch
mov bx, 0 ;pg number
mov al, color
int 10h
inc dx
cmp dx, ycoord
JE return2
JNE line2
return2:
ret
verticalline endp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;PROCEDURE FOR HORIZONTAL LINE;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
horizontalline proc
line:
                    mov             ah, 0ch
                    mov             bx, 0 ;pg number
                    mov             al, color
                    int             10h
                    inc             cx
                    cmp             cx, xcoord
                    JE              return
                    JNE             line
    return:
ret
horizontalline endp


;;;;;;;;;;;;;;;;;;
;TIME DELAY MACRO;
;;;;;;;;;;;;;;;;;;
Tdelay macro
mov delay, 0
	.while delay != 2000
		.while delay1 != 500
			inc delay1
		.endw
		inc delay
		mov delay1,0
	.endw
endm

;;;;;;;;;;;;;;;;;;;;;;;;
;CLEAR SCREEN PROCEDURE;
;;;;;;;;;;;;;;;;;;;;;;;;
ClearScreen proc                                
    mov ah,0
    mov al,13h 
    int 10h
ret
ClearScreen endp

end main


ret




