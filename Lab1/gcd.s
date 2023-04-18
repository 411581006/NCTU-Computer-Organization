.data
N1: .word 512
N2: .word 480
str1: .string "GCD value of "
str2: .string " and "
str3: .string " is "

.text
main:
        lw       a0, N1
        lw       a1, N2
        jal     ra, gcd

        add      a2, a0, zero
        lw       a0, N1
        lw       a1, N2
        jal    	ra, Result

        li       a0, 10
        ecall


gcd:
        addi     sp, sp, -24
        sw       ra, 16(sp)
        sw       a1, 8(sp)
        sw       a0, 0(sp)
        bne     zero, a1, gcd2
        addi     sp, sp, 24
        jalr     x0, x1, 0
gcd2:
        rem     t0, a0, a1
        add     a0, a1, zero
        add     a1, t0, zero
        bne zero, a1, gcd2
        addi     sp, sp, 24
        jalr     x0, x1, 0


Result:
        mv       t0, a0
        mv       t1, a1
        mv       t2, a2

        la       a1, str1
        li       a0, 4
        ecall

        mv       a1, t0
        li       a0, 1
        ecall

        la       a1, str2
        li       a0, 4
        ecall

        mv       a1, t1
        li       a0, 1
        ecall

        la       a1, str3
        li       a0, 4
        ecall

        mv       a1, t2
        li       a0, 1
        ecall

        ret