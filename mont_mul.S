MIT License

Copyright (c) 2026 Wang jie,Gao lei, Fu yong, Wang meiqin

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

# 0 "SM2_MultN2.S"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 0 "<command-line>" 2
# 1 "SM2_MultN2.S"
# 458 "SM2_MultN2.S"
 ####
 #### Montgomery Friendly Multiplication
 #### requires: -(p)^-1 mod 2^64 =1
 #### A= B x C mod p @ MM
 ####

.p2align 4,,15
 .globl SM2_MultmodGPMMF;

 .type SM2_MultmodGPMMF,@function
SM2_MultmodGPMMF:
 pushq %rbp
 pushq %rbx

 pushq %r12
 pushq %r13
 pushq %r14
 pushq %r15
 subq $128, %rsp

 vmovdqu (%rcx),%ymm1;

 vmovdqu %ymm1, (0)(%rsp);

movq %rdi, 56(%rsp);

 movq %rdx, %rdi
 xor %r13, %r13 ;
 movq (%rdi), %rdx ;
 mulx (%rsi) , %r10,%rcx ;
 mulx ( 8)(%rsi), %r12,%r9 ;
 movq %r10, 64(%rsp) ;
 movq ( 8)(%rdi), %rdx ;
 mulx (%rsi) , %r10,%r8 ;
 mulx ( 8)(%rsi), %r11,%rax ;
 adcx %r10, %rcx ;
 adox %r11, %r9;
 movq ( 16)(%rdi), %rdx ;
 mulx (%rsi) , %r10,%rbp ;
 mulx ( 8)(%rsi), %r11,%r14 ;
 adcx %r10, %r8 ;
 adox %r11, %rax;
 movq ( 24)(%rdi), %rdx ;
 mulx (%rsi) , %r10,%r11 ;
 adcx %r10, %rbp ;
 mulx ( 8)(%rsi), %r10,%r15 ;
 adox %r10, %r14;
 adcx %r13, %r11 ;
 adox %r13, %r15 ;
 adcx %rcx, %r12;
 movq %r12 , (64 +8)(%rsp);
 adcx %r8, %r9;
 adcx %rbp, %rax;
 adcx %r11, %r14;
 adcx %r13, %r15;
 movq (%rdi), %rdx ;
 mulx ( 16)(%rsi) , %rbx,%rcx ;
 adox %r9, %rbx;
 mulx ( 24)(%rsi), %r12,%r9 ;
 adox %rax, %r12;
 movq ( 8)(%rdi), %rdx ;
 mulx ( 16)(%rsi) , %r10,%r8 ;
 mulx ( 24)(%rsi), %rbp,%rax ;
 adcx %r10, %rcx ;
 adox %rbp, %r9;
 movq ( 16)(%rdi), %rdx ;
 mulx ( 16)(%rsi) , %r10,%rbp ;
 mulx ( 24)(%rsi), %r11,%r13 ;
 adcx %r10, %r8 ;
 adox %r11, %rax;
 movq ( 24)(%rdi), %rdx ;
 mulx ( 16)(%rsi) , %r10,%r11 ;
 adcx %r10, %rbp ;
 mulx ( 24)(%rsi), %rdi,%rsi ;
 adox %r13,%rdi;
 movq $0, %r10;
 adcx %r10, %r11 ;
 adox %r10, %rsi;
 adcx %rcx, %r12;
 adcx %r8, %r9;
 adox %r14,%r9;
 adcx %rbp, %rax;
 adox %r15,%rax;
 adcx %r11, %rdi;
 adox %r10,%rdi;
 adcx %r10, %rsi;
 adox %rsi,%r10 ;

 xorq %rbp, %rbp;
movq (64)(%rsp), %rdx;
mulx (0)(%rsp), %r11, %r13;
adcx (64)(%rsp), %r11;
mulx (0 +8)(%rsp), %r8, %r14;
mulx (0 +16)(%rsp), %r15, %rcx;
adcx (64 +8)(%rsp), %r13;
 adox %r8, %r13;
mulx (0 +24)(%rsp), %r11, %r8;
 adcx %r14, %r15;
 adox %r15, %rbx ;
 movq %r13, %rdx;
adcx %r11, %rcx;
 adox %rcx, %r12;
 mulx (0)(%rsp), %r11, %r15;
adcx %rbp, %r8;
 adox %r8, %r9;
 mulx (0 +8)(%rsp), %rsi, %r14;
adox %rbp, %rax;
 mulx (0 +16)(%rsp), %r8, %rcx;
 adcx %r11, %r13;
adox %rbp, %rdi;
mulx (0 +24)(%rsp), %r11, %r13;
adox %rbp, %r10;
 adcx %r15,%rsi;
 adox %rsi, %rbx;
adcx %r8,%r14;
 adox %r14, %r12;
 movq %rbx, %rdx;
adcx %r11, %rcx;
 adox %rcx, %r9;
 mulx (0)(%rsp), %r11, %r8;
adcx %rbp, %r13;
 adox %r13, %rax;
 mulx (0 +8)(%rsp), %rsi, %r14;
adox %rbp, %rdi;
 mulx (0 +16)(%rsp), %r15, %rcx;
 adcx %r11, %rbx;
adox %rbp, %r10;
mulx (0 +24)(%rsp), %r11, %r13;
 adcx %r8, %rsi;
 adox %rsi, %r12;
adcx %r15, %r14 ;
 adox %r14, %r9;
 movq %r12, %rdx;
adcx %r11, %rcx;
 adox %rcx, %rax;
mulx (0)(%rsp), %r11, %r8;
adcx %rbp, %r13;
 adox %r13, %rdi;
mulx (0 +8)(%rsp), %rbx, %r14;
adox %rbp,%r10;
 mulx (0 +16)(%rsp), %r15, %rcx;
 adcx %r11, %r12;
mulx (0 +24)(%rsp), %r11, %r13;
adcx %r8, %rbx;
 adox %rbx, %r9;
 movq %r9, %rbx;
adcx %r15, %r14;
 adox %r14, %rax;
movq %rax, %r14;
adcx %r11, %rcx;
 adox %rcx, %rdi;
movq %rdi, %rcx;
adcx %rbp, %r13;
 adox %r13, %r10;
 movq %r10,%r13;
adox %rbp, %r12;
subq (0)(%rsp), %r9;
sbbq (0 ++8)(%rsp), %rax;
sbbq (0 +16)(%rsp), %rdi;
sbbq (0 +24)(%rsp), %r10;
sbbq $0, %r12;
cmovc %rbx, %r9;
cmovc %r14, %rax;
cmovc %rcx, %rdi;
cmovc %r13, %r10;
 movq 56(%rsp), %rsi ;
 movq %r9, (%rsi);
 movq %rax, 8(%rsi);
 movq %rdi, 16(%rsi);
 movq %r10, 24(%rsi);

 addq $128, %rsp
 popq %r15
 popq %r14
 popq %r13
 popq %r12

 popq %rbx
 popq %rbp
 ret
.size SM2_MultmodGPMMF, .-SM2_MultmodGPMMF



 ####
 #### Montgomery Friendly square
 #### requires: -(p)^-1 mod 2^64 =1
 #### A= B x C mod p @ MM
 ####

.p2align 4,,15
 .globl SM2_SQRmodGPMMF;

 .type SM2_SQRmodGPMMF,@function
SM2_SQRmodGPMMF:
 pushq %rbp
 pushq %rbx

 pushq %r12
 pushq %r13
 pushq %r14
 pushq %r15

 subq $128, %rsp

 vmovdqu (%rdx),%ymm1;

 vmovdqu %ymm1, (0)(%rsp);

    movq %rdi, 56(%rsp);

 movq %rsi, %rdi

 xor %rbp, %rbp ;
 movq 0(%rdi), %rdx;
 movq 8(%rdi), %r12;
 movq 16(%rdi), %r11;
 movq 24(%rdi), %rdi;
 movq %rdx, %rsi ;
 mulx %r12 , %r13,%r15 ;
 mulx %rdi, %r9,%rax ;
 movq %r11, %rdx ;
 mulx %r12 , %r10,%rcx ;
 adcx %r9, %r10;
 adcx %rax, %rcx ;
 mulx %rdi, %r11,%r8 ;
 mulx %rsi , %rbx,%r14 ;
 adcx %rbp, %r11 ;
 adox %rbx, %r15 ;
 adcx %rbp, %r8 ;
 adox %r14, %r10 ;
 mulx %rdx, %r9,%rax;
 movq %rdi, %rdx ;
 mulx %r12 , %rdx,%rbx ;
 adox %rdx, %rcx ;
 adcx %r13, %r13;
 movq %rsi, %rdx;
 mulx %rdx, %rsi,%r14 ;
 adox %rbx, %r11 ;
adcx %r15, %r15;
 movq %r12, %rdx ;
 mulx %rdx, %rbx, %r12 ;
 adox %rbp, %r8;
adcx %r10, %r10 ;
 adox %r13, %r14;
 adcx %rcx, %rcx ;
 adcx %r11, %r11 ;
 adox %r15, %rbx;
 adox %r10, %r12 ;
 movq %rdi, %rdx ;
 mulx %rdx, %rdi,%r10 ;
 adcx %r8, %r8 ;
adox %rcx, %r9 ;
 adcx %rbp, %r10 ;
adox %r11, %rax ;
 adox %r8, %rdi;
 adox %rbp, %r10;

 xorq %rbp, %rbp;
movq %rsi, %rdx;
mulx (0)(%rsp), %r11, %r13;
adcx %rsi, %r11;
mulx (0 +8)(%rsp), %r8, %rsi;
mulx (0 +16)(%rsp), %r15, %rcx;
adcx %r14, %r13;
 adox %r8, %r13;
mulx (0 +24)(%rsp), %r11, %r8;
adcx %rsi, %r15;
 adox %r15, %rbx ;
 movq %r13, %rdx;
adcx %r11, %rcx;
 adox %rcx, %r12;
 mulx (0)(%rsp), %r11, %r15;
adcx %rbp, %r8;
 adox %r8, %r9;
 mulx (0 +8)(%rsp), %rsi, %r14;
adox %rbp, %rax;
 mulx (0 +16)(%rsp), %r8, %rcx;
 adcx %r11, %r13;
adox %rbp, %rdi;
mulx (0 +24)(%rsp), %r11, %r13;
adox %rbp, %r10;
 adcx %r15,%rsi;
 adox %rsi, %rbx;
 adcx %r8,%r14;
 adox %r14, %r12;
 movq %rbx, %rdx;
adcx %r11, %rcx;
 adox %rcx, %r9;
 mulx (0)(%rsp), %r11, %r8;
adcx %rbp, %r13;
 adox %r13, %rax;
 mulx (0 +8)(%rsp), %rsi, %r14;
adox %rbp, %rdi;
 mulx (0 +16)(%rsp), %r15, %rcx;
 adcx %r11, %rbx;
adox %rbp, %r10;
mulx (0 +24)(%rsp), %r11, %r13;
 adcx %r8, %rsi;
 adox %rsi, %r12;
 adcx %r15, %r14 ;
 adox %r14, %r9;
 movq %r12, %rdx;
adcx %r11, %rcx;
 adox %rcx, %rax;
mulx (0)(%rsp), %r11, %r8;
adcx %rbp, %r13;
 adox %r13, %rdi;
mulx (0 +8)(%rsp), %rbx, %r14;
adox %rbp,%r10;
 mulx (0 +16)(%rsp), %r15, %rcx;
 adcx %r11, %r12;
mulx (0 +24)(%rsp), %r11, %r13;
adcx %r8, %rbx;
 adox %rbx, %r9;
 movq %r9, %rbx;
adcx %r15, %r14;
 adox %r14, %rax;
movq %rax, %r14;
adcx %r11, %rcx;
 adox %rcx, %rdi;
movq %rdi, %rcx;
adcx %rbp, %r13;
 adox %r13, %r10;
 movq %r10,%r13;
adox %rbp, %r12;
subq (0)(%rsp), %r9;
sbbq (0 ++8)(%rsp), %rax;
sbbq (0 +16)(%rsp), %rdi;
sbbq (0 +24)(%rsp), %r10;
sbbq $0, %r12;
cmovc %rbx, %r9;
cmovc %r14, %rax;
cmovc %rcx, %rdi;
cmovc %r13, %r10;
 movq 56(%rsp), %rsi ;
 movq %r9, (%rsi);
 movq %rax, 8(%rsi);
 movq %rdi, 16(%rsi);
 movq %r10, 24(%rsi);

 addq $128, %rsp

 popq %r15
 popq %r14
 popq %r13
 popq %r12

 popq %rbx
 popq %rbp
 ret
 .size SM2_SQRmodGPMMF, .-SM2_SQRmodGPMMF



.p2align 4,,15
 .globl SM2_MultmodGPMM;

 .type SM2_MultmodGPMM,@function
SM2_MultmodGPMM:
 pushq %rbp
 pushq %rbx

 pushq %r12
 pushq %r13
 pushq %r14
 pushq %r15
 subq $128, %rsp

 vmovdqu (%rcx),%ymm1;

 vmovdqu %ymm1, (0)(%rsp);

 movq 32(%rcx),%r15
 movq %r15, (0 +32)(%rsp)
    movq %rdi, 56(%rsp);

 movq %rdx, %rdi
 xor %r13, %r13 ;
 movq (%rdi), %rdx ;
 mulx (%rsi) , %r10,%rcx ;
 mulx ( 8)(%rsi), %r12,%r9 ;
 movq %r10, 64(%rsp) ;
 movq ( 8)(%rdi), %rdx ;
 mulx (%rsi) , %r10,%r8 ;
 mulx ( 8)(%rsi), %r11,%rax ;
 adcx %r10, %rcx ;
 adox %r11, %r9;
 movq ( 16)(%rdi), %rdx ;
 mulx (%rsi) , %r10,%rbp ;
 mulx ( 8)(%rsi), %r11,%r14 ;
 adcx %r10, %r8 ;
 adox %r11, %rax;
 movq ( 24)(%rdi), %rdx ;
 mulx (%rsi) , %r10,%r11 ;
 adcx %r10, %rbp ;
 mulx ( 8)(%rsi), %r10,%r15 ;
 adox %r10, %r14;
 adcx %r13, %r11 ;
 adox %r13, %r15 ;
 adcx %rcx, %r12;
 movq %r12 , (64 +8)(%rsp);
 adcx %r8, %r9;
 adcx %rbp, %rax;
 adcx %r11, %r14;
 adcx %r13, %r15;
 movq (%rdi), %rdx ;
 mulx ( 16)(%rsi) , %rbx,%rcx ;
 adox %r9, %rbx;
 mulx ( 24)(%rsi), %r12,%r9 ;
 adox %rax, %r12;
 movq ( 8)(%rdi), %rdx ;
 mulx ( 16)(%rsi) , %r10,%r8 ;
 mulx ( 24)(%rsi), %rbp,%rax ;
 adcx %r10, %rcx ;
 adox %rbp, %r9;
 movq ( 16)(%rdi), %rdx ;
 mulx ( 16)(%rsi) , %r10,%rbp ;
 mulx ( 24)(%rsi), %r11,%r13 ;
 adcx %r10, %r8 ;
 adox %r11, %rax;
 movq ( 24)(%rdi), %rdx ;
 mulx ( 16)(%rsi) , %r10,%r11 ;
 adcx %r10, %rbp ;
 mulx ( 24)(%rsi), %rdi,%rsi ;
 adox %r13,%rdi;
 movq $0, %r10;
 adcx %r10, %r11 ;
 adox %r10, %rsi;
 adcx %rcx, %r12;
 adcx %r8, %r9;
 adox %r14,%r9;
 adcx %rbp, %rax;
 adox %r15,%rax;
 adcx %r11, %rdi;
 adox %r10,%rdi;
 adcx %r10, %rsi;
 adox %rsi,%r10 ;

 xorq %rbp, %rbp;
 movq (0 +32)(%rsp), %rdx;
mulx (64)(%rsp), %rdx, %r13;
mulx (0)(%rsp), %r11, %r13;
adcx (64)(%rsp), %r11;
mulx (0 +8)(%rsp), %r8, %r14;
mulx (0 +16)(%rsp), %r15, %rcx;
adcx (64 +8)(%rsp), %r13;
 adox %r8, %r13;
mulx (0 +24)(%rsp), %r11, %r8;
 movq (0 +32)(%rsp), %rdx;
adcx %r14, %r15;
 adox %r15, %rbx ;
 mulx %r13, %rdx, %r14;
adcx %r11, %rcx;
 adox %rcx, %r12;
 mulx (0)(%rsp), %r11, %r15;
adcx %rbp, %r8;
 adox %r8, %r9;
 mulx (0 +8)(%rsp), %rsi, %r14;
adox %rbp, %rax;
 mulx (0 +16)(%rsp), %r8, %rcx;
 adcx %r11, %r13;
adox %rbp, %rdi;
mulx (0 +24)(%rsp), %r11, %r13;
adox %rbp, %r10;
 adcx %r15,%rsi;
 adox %rsi, %rbx;
 movq (0 +32)(%rsp), %rdx;
adcx %r8,%r14;
 adox %r14, %r12;
 mulx %rbx, %rdx, %r14;
adcx %r11, %rcx;
 adox %rcx, %r9;
 mulx (0)(%rsp), %r11, %r8;
adcx %rbp, %r13;
 adox %r13, %rax;
 mulx (0 +8)(%rsp), %rsi, %r14;
adox %rbp, %rdi;
 mulx (0 +16)(%rsp), %r15, %rcx;
 adcx %r11, %rbx;
adox %rbp, %r10;
mulx (0 +24)(%rsp), %r11, %r13;
 adcx %r8, %rsi;
 adox %rsi, %r12;
 movq (0 +32)(%rsp), %rdx;
adcx %r15, %r14 ;
 adox %r14, %r9;
 mulx %r12, %rdx, %r14;
adcx %r11, %rcx;
 adox %rcx, %rax;
mulx (0)(%rsp), %r11, %r8;
adcx %rbp, %r13;
 adox %r13, %rdi;
mulx (0 +8)(%rsp), %rbx, %r14;
adox %rbp,%r10;
 mulx (0 +16)(%rsp), %r15, %rcx;
 adcx %r11, %r12;
mulx (0 +24)(%rsp), %r11, %r13;
adcx %r8, %rbx;
 adox %rbx, %r9;
 movq %r9, %rbx;
adcx %r15, %r14;
 adox %r14, %rax;
movq %rax, %r14;
adcx %r11, %rcx;
 adox %rcx, %rdi;
movq %rdi, %rcx;
adcx %rbp, %r13;
 adox %r13, %r10;
 movq %r10,%r13;
adox %rbp, %r12;
subq (0)(%rsp), %r9;
sbbq (0 ++8)(%rsp), %rax;
sbbq (0 +16)(%rsp), %rdi;
sbbq (0 +24)(%rsp), %r10;
sbbq $0, %r12;
cmovc %rbx, %r9;
cmovc %r14, %rax;
cmovc %rcx, %rdi;
cmovc %r13, %r10;
 movq 56(%rsp), %rsi ;
 movq %r9, (%rsi);
 movq %rax, 8(%rsi);
 movq %rdi, 16(%rsi);
 movq %r10, 24(%rsi);

 addq $128, %rsp
 popq %r15
 popq %r14
 popq %r13
 popq %r12

 popq %rbx
 popq %rbp
 ret
 .size SM2_MultmodGPMM, .-SM2_MultmodGPMM




  .p2align 4,,15
 .globl SM2_SQRmodGPMM;

 .type SM2_SQRmodGPMM,@function
SM2_SQRmodGPMM:
 pushq %rbp
 pushq %rbx

 pushq %r12
 pushq %r13
 pushq %r14
 pushq %r15

 subq $128, %rsp

 vmovdqu (%rdx),%ymm1;

 vmovdqu %ymm1, (0)(%rsp);

 movq 32(%rdx),%r15
 movq %r15, (0 +32)(%rsp)

    movq %rdi, 56(%rsp);

 movq %rsi, %rdi

 xor %rbp, %rbp ;
 movq 0(%rdi), %rdx;
 movq 8(%rdi), %r12;
 movq 16(%rdi), %r11;
 movq 24(%rdi), %rdi;
 movq %rdx, %rsi ;
 mulx %r12 , %r13,%r15 ;
 mulx %rdi, %r9,%rax ;
 movq %r11, %rdx ;
 mulx %r12 , %r10,%rcx ;
 adcx %r9, %r10;
 adcx %rax, %rcx ;
 mulx %rdi, %r11,%r8 ;
 mulx %rsi , %rbx,%r14 ;
 adcx %rbp, %r11 ;
 adox %rbx, %r15 ;
 adcx %rbp, %r8 ;
 movq %rdx, %r9;
 adox %r14, %r10 ;
 movq %rdi, %rdx ;
 mulx %r12 , %rdx,%rbx ;
 adox %rdx, %rcx ;
 adcx %r13, %r13;
 movq %rsi, %rdx;
 mulx %rdx, %rsi,%r14 ;
 adox %rbx, %r11 ;
adcx %r15, %r15;
 movq %r12, %rdx ;
 mulx %rdx, %rbx, %r12 ;
 adox %rbp, %r8;
 adcx %r10, %r10 ;
 movq %r9, %rdx;
 mulx %rdx, %r9,%rax;
 adox %r13, %r14;
 adcx %rcx, %rcx ;
 adcx %r11, %r11 ;
 adox %r15, %rbx;
 adox %r10, %r12 ;
 movq %rdi, %rdx ;
 mulx %rdx, %rdi,%r10 ;
 adcx %r8, %r8 ;
adox %rcx, %r9 ;
 adcx %rbp, %r10 ;
adox %r11, %rax ;
 adox %r8, %rdi;
 adox %rbp, %r10;

 xorq %rbp, %rbp;
movq (0 +32)(%rsp), %rdx;
mulx %rsi, %rdx, %r13;
mulx (0)(%rsp), %r11, %r13;
adcx %rsi, %r11;
mulx (0 +8)(%rsp), %r8, %rsi;
mulx (0 +16)(%rsp), %r15, %rcx;
adcx %r14, %r13;
 adox %r8, %r13;
mulx (0 +24)(%rsp), %r11, %r8;
 movq (0 +32)(%rsp), %rdx;
adcx %rsi, %r15;
 adox %r15, %rbx ;
 mulx %r13, %rdx, %r14;
adcx %r11, %rcx;
 adox %rcx, %r12;
 mulx (0)(%rsp), %r11, %r15;
adcx %rbp, %r8;
 adox %r8, %r9;
 mulx (0 +8)(%rsp), %rsi, %r14;
adox %rbp, %rax;
 mulx (0 +16)(%rsp), %r8, %rcx;
 adcx %r11, %r13;
adox %rbp, %rdi;
mulx (0 +24)(%rsp), %r11, %r13;
adox %rbp, %r10;
 adcx %r15,%rsi;
 adox %rsi, %rbx;
 movq (0 +32)(%rsp), %rdx;
adcx %r8,%r14;
 adox %r14, %r12;
 mulx %rbx, %rdx, %r14;
adcx %r11, %rcx;
 adox %rcx, %r9;
 mulx (0)(%rsp), %r11, %r8;
adcx %rbp, %r13;
 adox %r13, %rax;
 mulx (0 +8)(%rsp), %rsi, %r14;
adox %rbp, %rdi;
 mulx (0 +16)(%rsp), %r15, %rcx;
 adcx %r11, %rbx;
adox %rbp, %r10;
mulx (0 +24)(%rsp), %r11, %r13;
 adcx %r8, %rsi;
 adox %rsi, %r12;
 movq (0 +32)(%rsp), %rdx;
adcx %r15, %r14 ;
 adox %r14, %r9;
 mulx %r12, %rdx, %r14;
adcx %r11, %rcx;
 adox %rcx, %rax;
mulx (0)(%rsp), %r11, %r8;
adcx %rbp, %r13;
 adox %r13, %rdi;
mulx (0 +8)(%rsp), %rbx, %r14;
adox %rbp,%r10;
 mulx (0 +16)(%rsp), %r15, %rcx;
 adcx %r11, %r12;
mulx (0 +24)(%rsp), %r11, %r13;
adcx %r8, %rbx;
 adox %rbx, %r9;
 movq %r9, %rbx;
adcx %r15, %r14;
 adox %r14, %rax;
movq %rax, %r14;
adcx %r11, %rcx;
 adox %rcx, %rdi;
movq %rdi, %rcx;
adcx %rbp, %r13;
 adox %r13, %r10;
 movq %r10,%r13;
adox %rbp, %r12;
subq (0)(%rsp), %r9;
sbbq (0 ++8)(%rsp), %rax;
sbbq (0 +16)(%rsp), %rdi;
sbbq (0 +24)(%rsp), %r10;
sbbq $0, %r12;
cmovc %rbx, %r9;
cmovc %r14, %rax;
cmovc %rcx, %rdi;
cmovc %r13, %r10;
 movq 56(%rsp), %rsi ;
 movq %r9, (%rsi);
 movq %rax, 8(%rsi);
 movq %rdi, 16(%rsi);
 movq %r10, 24(%rsi);

 addq $128, %rsp

 popq %r15
 popq %r14
 popq %r13
 popq %r12

 popq %rbx
 popq %rbp
 ret
 .size SM2_SQRmodGPMM, .-SM2_SQRmodGPMM

# 730 "SM2_MultN2.S"
.section .rdata, "a", @progbits
 .align 32
.SM2_NV:
.quad 0x53bbf40939d54123,0x7203df6b21c6052b,0xFFFFFFFFFFFFFFFF,0xFFFFFFFEFFFFFFFF
SM2u_nN:
 .quad 0
 .quad 0
 .quad 0
 .quad 0
 .quad 1345559660988549536
 .quad -8215655787415847935
 .quad 4294967297
 .quad 4294967297
 .quad 2691119321977099072
 .quad 2015432498877855746
 .quad 8589934595
 .quad 8589934594
 .quad 4036678982965648608
 .quad -6200223288537992189
 .quad 12884901892
 .quad 12884901891
