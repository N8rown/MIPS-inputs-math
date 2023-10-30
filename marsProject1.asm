#CS2640
#October 29, 2023
#Project 1
#write a prgram in assembly that takes two numbers from a user
#have the user select from an output menu of 4 arithmetic options
#Display result in the output
#1) prompt user for inputs
#2) assign numbers to registers $t0, $t1
#3) create and display 4 arithmetic options in menu
#4) get the result of the desired operation given the two ints
#5) store result in register $t2
#6) display $t2
.data
prompt1: .asciiz "\nPlease enter the first integer: "
prompt2: .asciiz "\nPlease enter the second integer: "
prompt3: .asciiz "\nYour ints were: "
prompt4: .asciiz " and "
addP: .asciiz "\nint1 + int2 = "
subP: .asciiz "\nint1 - int2 = "
multP: .asciiz "\nint1 * int2 = "
divP: .asciiz "\nint1 / int2 = "
equalP: .asciiz "\nEQUAL"
unequalP: .asciiz "\nUNEQUAL"

.text
main:
#section1
	#Output prompt for first int
	li $v0, 4 #4 is for Strings - I want to print a string
	la $a0, prompt1 #prints string syscall
	syscall
	#get user num 1
	li $v0, 5 #5 is for ints - I want to take user input int
	syscall 
	move $s0, $v0 #Stores user input into regester $t0
	
	#output second prompt
	li $v0, 4
	la $a0, prompt2
	syscall
	#get user num 2
	li $v0, 5
	syscall 
	move $s1, $v0 
	
	li $v0, 4
	la $a0, prompt3 # your ints were
	syscall
	
	li $v0, 1
	move $a0, $s0 #int1
	syscall
	li $v0, 4
	la $a0, prompt4 #and
	syscall
	li $v0, 1
	move $a0, $s1 # int2
	syscall
	
	li $v0, 4
	la $a0, addP #adding
	syscall
	li $v0, 1
	add $t0, $s0, $s1
	move $a0, $t0
	syscall 
	
	li $v0, 4
	la $a0, subP #subtracting
	syscall
	li $v0, 1
	sub $t0, $s0, $s1
	move $a0, $t0
	syscall 
	
	li $v0, 4
	la $a0, multP #multiplying
	syscall
	li $v0, 1
	mul $t0, $s0, $s1
	move $a0, $t0
	syscall 
	
	li $v0, 4
	la $a0, divP #dividing
	syscall
	li $v0, 1
	div $t0, $s0, $s1
	move $a0, $t0
	syscall 
	
	beq $s0, $s1, equal
	j unequal
	
equal:
	li $v0, 4 #4 is for Strings - I want to print a string
	la $a0, equalP #prints string syscall
	syscall
	j exit
unequal:
	li $v0, 4 #4 is for Strings - I want to print a string
	la $a0, unequalP #prints string syscall
	syscall
	j exit
exit: 
	#exit syscall
	li $v0, 10
	syscall
	
