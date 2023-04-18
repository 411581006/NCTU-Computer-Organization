.data
N: .word 10
str1: .string "th number in the Fibonacci sequence is "


.text
main:
    lw       a0, N
    jal      ra, fibonacci

    mv       a1, t2
    lw       a0, N
    jal      ra, Result

    li       a0, 10
    ecall

fibonacci:
    addi     a3, zero, 1
    bgt      a0,a3,fib2
    mv       t2,a0
    ret
fib2:
    addi     sp,sp,-12
    sw       ra,0(sp)

    sw       a0,4(sp)
    addi     a0,a0,-1
    jal      fibonacci
    lw       a0,4(sp)
    sw       t2,8(sp)

    addi      a0,a0,-2
    jal      fibonacci

    lw       t0,8(sp)
    add      t2,t0,t2

    lw       ra,0(sp)
    addi     sp,sp,12
    ret

Result:
    mv       t0, a0
    mv       t1, a1

    mv       a1, t0
    li       a0, 1
    ecall

    la       a1, str1
    li       a0, 4
    ecall


    mv       a1  t1
    li       a0, 1
        ecall

ret
