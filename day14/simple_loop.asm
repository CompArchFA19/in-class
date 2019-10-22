# Simple loop example - add first N integers

addi $t0, $zero, 5	# t0 = 5 (N)
addi $t1, $zero, 0	# t1 = 0 (sum)

LOOPSTART: 
beq  $t0, $zero, LOOPEND	# if i == 0: GOTO END
add  $t1, $t1, $t0		# sum += i 
addi $t0, $t0, -1		# i--
j LOOPSTART

LOOPEND:



# Bonus: print result via syscall
li   $v0, 4		# Service code to print string
la   $a0, prompt	# Argument is memory address of string to print
syscall

li   $v0, 1		# Service code to print integer
add  $a0, $zero, $t1	# Argument is integer to print
syscall


.data
# Null-terminated string to print as part of result"
prompt: .asciiz "\nFinal sum: "
