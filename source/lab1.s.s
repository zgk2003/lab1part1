.section .text
.global main


//Set up constants for port. Don't Change!
.equ 	PCRD5, 		0x4004C014 //PORTD_PCR5   (GREEN), the manual has these backward
.equ 	SCGC5, 		0x40048038 //SIM_SCGC5    address
.equ 	PDDRD,  	0x400FF0D4 //GPIOB_PDDR   address
.equ 	PCORD,  	0x400FF0C8 //GPIOB_PCOR   address
.equ 	PSORD,  	0x400FF0C4 //GPIOB_PSOR   address


.equ 	twelve, 	0x00001000  // 1 << 12, for turning on port clock
.equ 	eight, 		0x00000100  // 1 << 8,  for setting MUX to GPIO
.equ	five, 		0x00000020  // 1 << 5,  for manipulating PIN


/*
---  Write your code below this line ---
Feel free to include additional label as needed.
*/

.equ    DOT_LENGTH,    0x3DC6C0


main:

       //Feel free to remove any unnecesary commands
	BL    LEDSETUP
	BL    LEDOFF
	MOV   r0, #23
	BL    MultiDigitMorse

	B     forever // after you program runs, it should enter this infinite loop




DivisionByTen:
    PUSH {LR}
    PUSH {R4, R5, R6, R7}

    MOV R7, #10

    SUB R6, R0, R7

    MOV R0, #0

    loop:
    MOV R7, #10
    MUL R7, R0, R7
    CMP R7, R6
    BGT exit
    ADD R0, #1
    B loop

    exit:
    POP {R4, R5, R6, R7}
    POP  {PC}


MultiDigitMorse:
    PUSH {LR}
    PUSH {R4, R5, R6, R7}

    MOV R7, #10
    MOV R4, #0

    div:
    MOV  R6, R0
    BL   DivisionByTen
    MUL  R0, R0, R7
    SUB  R5, R6, R0
    BL   DivisionByTen
    PUSH {R5}
    ADD  R4, #1
    CMP  R0, #0
    BEQ  base
    B    div


    base:
    CMP  R4, #0
    BEQ  terminate
    POP  {R0}
    BL   MorseDigit
    BL   DOT
    BL   DOT
    BL   DOT
    SUB  R4, #1
    B    base

    terminate:
    POP  {R4, R5, R6, R7}
    POP  {PC}



CASE1:
    PUSH  {LR}
    PUSH  {R4, R5, R6, R7}
    BL    LEDON
	BL    DOT
	BL    LEDOFF
	BL    DOT
	BL    LEDON
	BL    DASH
	BL    LEDOFF
	BL    DOT
	BL    LEDON
	BL    DASH
	BL    LEDOFF
	BL    DOT
	BL    LEDON
	BL    DASH
	BL    LEDOFF
	BL    DOT
	BL    LEDON
	BL    DASH
	BL    LEDOFF
	BL    DOT
	POP   {R4, R5, R6, R7}
	POP   {PC}

CASE2:
    PUSH  {LR}
    PUSH  {R4, R5, R6, R7}
    BL    LEDON
	BL    DOT
	BL    LEDOFF
	BL    DOT
	BL    LEDON
	BL    DOT
	BL    LEDOFF
	BL    DOT
	BL    LEDON
	BL    DASH
	BL    LEDOFF
	BL    DOT
	BL    LEDON
	BL    DASH
	BL    LEDOFF
	BL    DOT
	BL    LEDON
	BL    DASH
	BL    LEDOFF
	BL    DOT
	POP   {R4, R5, R6, R7}
	POP   {PC}

CASE3:
    PUSH  {LR}
    PUSH  {R4, R5, R6, R7}
    BL    LEDON
	BL    DOT
	BL    LEDOFF
	BL    DOT
	BL    LEDON
	BL    DOT
	BL    LEDOFF
	BL    DOT
	BL    LEDON
	BL    DOT
	BL    LEDOFF
	BL    DOT
	BL    LEDON
	BL    DASH
	BL    LEDOFF
	BL    DOT
	BL    LEDON
	BL    DASH
	BL    LEDOFF
	BL    DOT
	POP   {R4, R5, R6, R7}
	POP   {PC}

CASE1_HELP:
    PUSH {LR}
    B CASE1
    POP {PC}

CASE2_HELP:
    PUSH {LR}
    B CASE2
    POP {PC}

CASE3_HELP:
    PUSH {LR}
    B CASE3
    POP {PC}

CASE4:
    PUSH  {LR}
    PUSH  {R4, R5, R6, R7}
    BL    LEDON
	BL    DOT
	BL    LEDOFF
	BL    DOT
	BL    LEDON
	BL    DOT
	BL    LEDOFF
	BL    DOT
	BL    LEDON
	BL    DOT
	BL    LEDOFF
	BL    DOT
	BL    LEDON
	BL    DOT
	BL    LEDOFF
	BL    DOT
	BL    LEDON
	BL    DASH
	BL    LEDOFF
	BL    DOT
	POP   {R4, R5, R6, R7}
	POP   {PC}

CASE5:
    PUSH  {LR}
    PUSH  {R4, R5, R6, R7}
    BL    LEDON
	BL    DOT
	BL    LEDOFF
	BL    DOT
	BL    LEDON
	BL    DOT
	BL    LEDOFF
	BL    DOT
	BL    LEDON
	BL    DOT
	BL    LEDOFF
	BL    DOT
	BL    LEDON
	BL    DOT
	BL    LEDOFF
	BL    DOT
	BL    LEDON
	BL    DOT
	BL    LEDOFF
	BL    DOT
	POP   {R4, R5, R6, R7}
	POP   {PC}


MorseDigit:
    PUSH  {LR}
    PUSH  {R4, R5, R6, R7}

    CMP R0, #1
    BEQ CASE1_HELP
    CMP R0, #2
    BEQ CASE2_HELP
    CMP R0, #3
    BEQ CASE3_HELP
    CMP R0, #4
    BEQ CASE4
    CMP R0, #5
    BEQ CASE5
    CMP R0, #6
    BEQ CASE6
    CMP R0, #7
    BEQ CASE7
    CMP R0, #8
    BEQ CASE8
    CMP R0, #9
    BEQ CASE9_HELP
    CMP R0, #0
    BEQ CASE0_HELP

    end:
    POP   {R4, R5, R6, R7}
	POP   {PC}



CASE6:
    PUSH  {LR}
    PUSH  {R4, R5, R6, R7}
    BL    LEDON
	BL    DASH
	BL    LEDOFF
	BL    DOT
	BL    LEDON
	BL    DOT
	BL    LEDOFF
	BL    DOT
	BL    LEDON
	BL    DOT
	BL    LEDOFF
	BL    DOT
	BL    LEDON
	BL    DOT
	BL    LEDOFF
	BL    DOT
	BL    LEDON
	BL    DOT
	BL    LEDOFF
	BL    DOT
	POP   {R4, R5, R6, R7}
	POP   {PC}

CASE7:
    PUSH  {LR}
    PUSH  {R4, R5, R6, R7}
    BL    LEDON
	BL    DASH
	BL    LEDOFF
	BL    DOT
	BL    LEDON
	BL    DASH
	BL    LEDOFF
	BL    DOT
	BL    LEDON
	BL    DOT
	BL    LEDOFF
	BL    DOT
	BL    LEDON
	BL    DOT
	BL    LEDOFF
	BL    DOT
	BL    LEDON
	BL    DOT
	BL    LEDOFF
	BL    DOT
	POP   {R4, R5, R6, R7}
	POP   {PC}

CASE9_HELP:
    PUSH {LR}
    B CASE9
    POP {PC}

CASE0_HELP:
    PUSH {LR}
    B CASE0
    POP {PC}

CASE8:
    PUSH  {LR}
    PUSH  {R4, R5, R6, R7}
    BL    LEDON
	BL    DASH
	BL    LEDOFF
	BL    DOT
	BL    LEDON
	BL    DASH
	BL    LEDOFF
	BL    DOT
	BL    LEDON
	BL    DASH
	BL    LEDOFF
	BL    DOT
	BL    LEDON
	BL    DOT
	BL    LEDOFF
	BL    DOT
	BL    LEDON
	BL    DOT
	BL    LEDOFF
	BL    DOT
	POP   {R4, R5, R6, R7}
	POP   {PC}

CASE9:
    PUSH  {LR}
    PUSH  {R4, R5, R6, R7}
    BL    LEDON
	BL    DASH
	BL    LEDOFF
	BL    DOT
	BL    LEDON
	BL    DASH
	BL    LEDOFF
	BL    DOT
	BL    LEDON
	BL    DASH
	BL    LEDOFF
	BL    DOT
	BL    LEDON
	BL    DASH
	BL    LEDOFF
	BL    DOT
	BL    LEDON
	BL    DOT
	BL    LEDOFF
	BL    DOT
	POP   {R4, R5, R6, R7}
	POP   {PC}

CASE0:
    PUSH  {LR}
    PUSH  {R4, R5, R6, R7}
    BL    LEDON
	BL    DASH
	BL    LEDOFF
	BL    DOT
	BL    LEDON
	BL    DASH
	BL    LEDOFF
	BL    DOT
	BL    LEDON
	BL    DASH
	BL    LEDOFF
	BL    DOT
	BL    LEDON
	BL    DASH
	BL    LEDOFF
	BL    DOT
	BL    LEDON
	BL    DASH
	BL    LEDOFF
	BL    DOT
	POP   {R4, R5, R6, R7}
	POP   {PC}





fib:
 	// Your code goes here!
 	PUSH {LR}
 	PUSH {R4, R5, R6, R7}


 	CMP R0, #0
 	BLE ZERO
 	CMP R0, #1
 	BEQ ONE

 	SUB R0, #1
 	MOV R5, R0
 	BL fib
 	MOV R4, R0

 	MOV R0, R5
 	SUB R0, #1
 	BL fib
 	ADD R0, R4

 	B END


 	ZERO:
 	MOV R0, #0
 	B END

 	ONE:
 	MOV R0, #1

 	END:
 	POP {R4, R5, R6, R7}
 	POP {PC}

/*
---  And above this one ---
*/

// Call this function first to set up the LED
// You only need to call this once
LEDSETUP:
	PUSH  {R4, R5, R6, R7}    //To preserve R4 and R5
	LDR   R4, =twelve // Load the value 1 << 12
	LDR   R5, =SCGC5
	STR   R4, [R5]

	LDR   R4, =eight  //MUX Port to be GPIO
	LDR   R5, =PCRD5
	STR   R4, [R5]

	LDR   R4, =five
	LDR   R5, =PDDRD
	STR   R4, [R5]
	POP   {R4, R5, R6, R7}
	BX    LR

// The functions below are for you to use freely
LEDON:
	PUSH  {R4, R5, R6, R7}
	LDR   R4, =five
	LDR   R5, =PCORD
	STR   R4, [R5]
	POP   {R4, R5, R6, R7}
	BX    LR

LEDOFF:
	PUSH  {R4, R5, R6, R7}
	LDR   R4, =five
	LDR   R5, =PSORD
	STR   R4, [R5]
	POP   {R4, R5, R6, R7}
	BX    LR

DASH:
    PUSH {LR}
    PUSH {R4, R5, R6, R7}
    BL DOT
    BL DOT
    BL DOT
    POP {R4, R5, R6, R7}
    POP {PC}


DOT:
    PUSH  {LR}
    PUSH  {R4, R5, R6, R7}
    LDR   r0, =DOT_LENGTH
    loopbody:
    SUB   r0, #1
    CMP   r0, #0
    BNE   loopbody
    POP   {R4, R5, R6, R7}
    POP   {PC}

//wait forever
forever:
	B		forever
	.end

