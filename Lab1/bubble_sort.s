.data
n: .word 10  
str1: .string "Array: "
str2: .string "Sorted: "
space: .string " "
array: .word 5, 3, 6, 7, 31, 23, 43, 12, 45, 1
endl: .string "\n"

.text
main:
 	la a1, str1 
 	li a0, 4
	ecall

 	la t0, array  
	lw t2, n
	jal ra, loop1 
	la t0, array  
	lw t2, n  
	addi t1, zero, 0 
 	addi t3, t1, -1 
	addi s5, zero, 1
	bge t2, s5, bubble 
	 li      a0, 10  
	ecall

bubble:
	bge  t1, t2, exit  
	addi t3, t1, -1

bubble2:
	blt t3, zero, exit2 
 	addi s2, zero, 4
 	mul s2 ,s2, t3  
	add s2, t0, s2 
	lw s3, 0(s2) 
 	lw s4, 4(s2) 
 	ble s3, s4, exit2 
 	j swap  
  	addi t3, t3 ,-1
 	j bubble2

exit2: 
 	addi t1, t1, 1
 	j bubble 
 
exit:
	la a1, str2
 	li a0, 4
 	ecall
 	jal ra, loop1 
 	li  a0, 10
  ecall
 
swap:
 	addi s2, zero, 4 
 	mul s2 ,s2, t3 
 	add s2, t0, s2 
 	lw s3, 0(s2) 
 	lw s4, 4(s2) 
 	sw s3, 4(s2) 
 	sw s4, 0(s2) 
 	jalr x0, x1, 0 
 

loop1: 
 	li a0, 4  
 	la a1, space
 	ecall

 	li a0, 1  
	lw t1, 0(t0)
 	mv a1, t1
 	ecall

 	addi t0, t0, 4 
	addi t2, t2, -1 
	bne t2, zero, loop1 
	la a1, endl
 	li a0, 4
 	ecall
 	ret