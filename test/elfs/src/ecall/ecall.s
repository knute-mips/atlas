/* Test: nop.elf
 * ISA: rv64i
 * Description: Stream of nops.
 */

.include "host.s"
.include "macros.s"

.section .text
    .global main

main:
    .rept 1000
        nop
    .endr

pass:
    /* exit system call */
    li a7, 0x5d
    ecall

fail:
    test_fail

.section .data
data:
    .fill 64, 4, 0xFFFFFFFF
_end:
    .fill 64, 4, 0
