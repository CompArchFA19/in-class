# Simple (non-recursive) function call example

# Explicitly initialize stack pointer
#   Starts at 0x3ffc for memory configuration: Compact, Text at 0
#   MARS will do this for you, but your CPU will not, so it's a good idea
#   to include as the first line of your assembly programs when using stack
addi $sp, $zero, 0x3ffc

# Main (test program): Calls double function
main:
# How to call a function (caller):
# 1) Save any registers I need to keep (i.e $t*) by pushing to stack (not needed here)
# 2) Set up arguments in $a0
addi $a0, $zero, 5
# 3) Call function. Assume return value will be in $v0 by convention
jal double
# 4) Restore saved registers from step (1) (not needed here)


# If this jump were not included, after completing our "main" sequence execution
# would fall right through to the next instruction in the program, i.e. the first
# line of "double")
j end


# Double function
#   int double(int x) -> returns 2*x
double:
# How to be a function (callee):
# 1) By convention, assume first argument was put in $a0 by caller
# 2) Save (push to stack) any registers (i.e. $s* or $ra) that I might overwrite 
#      In this example we push $ra - unnecessarily, since it isn't overwritten,
#      but we often need to save $ra because it is overwritten by the JAL for any
#      subfunction calls, and we need its value to return to our caller.
addi $sp, $sp, -4
sw $ra, 0($sp)		# push($ra)

# 3) Actually do the work (including calling sub-functions), and 
#    ensure that return value ends up in $v0 (required by convention)
sll $v0, $a0, 1		# v0 = 2*a0

# 4) Restore any registers saved in step (2).
#    Right before you return:
#     a) stack should be exactly the same as when you were called
#     b) saved ($s*) registers should have the same values as when you were called
lw $ra, 0($sp)		# pop($ra)
addi $sp, $sp, 4

# 5) Return to caller (with return value in $v0)
jr $ra

# Infinite loop, so we don't fall through and start executing data in memory as code
end:
j end