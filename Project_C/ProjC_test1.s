# Phase 1 tests for project part c. 

# data selection
.data
	temp1: .word 16
	arr1: .word 0 : 31

# instructions
.text 
	#la $9, temp1
	lui $1, 0x00001001
	sll $0, $0, 0
	sll $0, $0, 0
	sll $0, $0, 0
	ori $9, $1, 0x00000000
	sll $0, $0, 0
	sll $0, $0, 0
	sll $0, $0, 0
	
	#la $16, arr1
	lui $1, 0x00001001
	sll $0, $0, 0
	sll $0, $0, 0
	sll $0, $0, 0
	ori $16, $1, 0x00000004
	sll $0, $0, 0
	sll $0, $0, 0
	sll $0, $0, 0

###########################
#DON'T USE $9, and $16
###########################



# Setup
addi $1, $0, 1		
addi $2, $0, 2		
addi $3, $0, 3
addi $4, $0, 4
addi $5, $0, 5
addi $6, $0, 6
addi $7, $0, 7
addi $8, $0, 1

# Add stuff
add $27, $1, $2
addiu $11, $3, 4
addu $12, $5, $6
add $13, $7, $8

# And stuff 
and $13, $1, $2
andi $14, $3, 11

# Load stuff 	
lw $17, 0($9)	


# NOR, XOR, and OR stuff
nor $19, $1, $2		
xor $20, $3, $4		
xori $21, $5, 3	
or $22, $6, $7		
ori $23, $8, 3		

# SLT stuff
slt $24, $1, $2 	
slti $25, $3, 3
sltiu $26, $4, 3
sltu $27, $5, $6

# Shift stuff  
sll $28, $1, 4
srl $29, $2, 4
sra $30, $3, 4
sllv $31, $4, $5
srlv $11, $6, $7
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
srav $12, $8, $1

# Store stuff
#sw $13, 4($16)

# Using reg10 for subing
sub $14, $3, $4

#subu $15, $5, 3
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
lui $1, 0x00000000
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
ori $1, $1, 0x00000003
sll $0, $0, 0
sll $0, $0, 0
sll $0, $0, 0
subu $15, $5, $1 

#branching stuff
beq $1, $8, equal
	
equal:          sll $0, $0, 0
		sll $0, $0, 0
		sll $0, $0, 0
		beq $2, $3, na
		sll $0, $0, 0
		sll $0, $0, 0
		sll $0, $0, 0
	        #beq $1, $8, na
	        bne $4, $5, jumping
	        j jumping
	
jumping:        sll $0, $0, 0
		sll $0, $0, 0
		sll $0, $0, 0
		j next

next:	        sll $0, $0, 0
		sll $0, $0, 0
		sll $0, $0, 0
		sll $0, $0, 0
		sll $0, $0, 0
		sll $0, $0, 0
		sll $0, $0, 0
		sll $0, $0, 0      
		#jal message
		sll $0, $0, 0
		sll $0, $0, 0
		sll $0, $0, 0
		sll $0, $0, 0
		sll $0, $0, 0
		sll $0, $0, 0
		sll $0, $0, 0
		sll $0, $0, 0 
	        #jal message
	    	#li $16, 10
		lui $at, 0x1001
		sll $0, $0, 0
		sll $0, $0, 0
		sll $0, $0, 0
		sll $0, $0, 0
		sll $0, $0, 0 
		ori $17, $at, 0x1111
		sll $0, $0, 0
		sll $0, $0, 0
		sll $0, $0, 0
		sll $0, $0, 0
		sll $0, $0, 0 
		j end

message:
		sll $0, $0, 0
		sll $0, $0, 0
		sll $0, $0, 0
		#la $a0, arr1
		lui $1, 0x00001001
		sll $0, $0, 0
		sll $0, $0, 0
		sll $0, $0, 0
		ori $4, $1, 0x00001111
		sll $0, $0, 0
		sll $0, $0, 0
		sll $0, $0, 0
		#li $v0, 4
		addiu $2, $0, 0x00000004
		sll $0, $0, 0
		sll $0, $0, 0
		sll $0, $0, 0
		syscall
		jr $ra

na:   sll $0, $0, 0
      sll $0, $0, 0
      sll $0, $0, 0 
      add $20, $1, $2  		#If $t7 = 3, it's bad.

end: 
	#addi $2, $0, 0		# Clear reg2
	sll $0, $0, 0
	sll $0, $0, 0
	sll $0, $0, 0
	addi $2, $0, 10 	# Cause the halt 
	syscall 		# Halt 