`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369A - Computer Architecture
// Laboratory  1
// Module - InstructionMemory.v
// Description - 32-Bit wide instruction memory.
//
// INPUT:-
// Address: 32-Bit address input port.
//
// OUTPUT:-
// Instruction: 32-Bit output port.
//
// FUNCTIONALITY:-
// Similar to the DataMemory, this module should also be byte-addressed
// (i.e., ignore bits 0 and 1 of 'Address'). All of the instructions will be 
// hard-coded into the instruction memory, so there is no need to write to the 
// InstructionMemory.  The contents of the InstructionMemory is the machine 
// language program to be run on your MIPS processor.
//
//
//we will store the machine code for a code written in C later. for now initialize 
//each entry to be its index * 4 (memory[i] = i * 4;)
//all you need to do is give an address as input and read the contents of the 
//address on your output port. 
// 
//Using a 32bit address you will index into the memory, output the contents of that specific 
//address. for data memory we are using 1K word of storage space. for the instruction memory 
//you may assume smaller size for practical purpose. you can use 128 words as the size and 
//hardcode the values.  in this case you need 7 bits to index into the memory. 
//
//be careful with the least two significant bits of the 32bit address. those help us index 
//into one of the 4 bytes in a word. therefore you will need to use bit [8-2] of the input address. 


////////////////////////////////////////////////////////////////////////////////

module InstructionMemory(Address, Instruction); 

    input [31:0] Address;        // Input Address 

    output reg [31:0] Instruction;    // Instruction at memory location Address
    
    
        /* Please fill in the implementation here */
    integer i, DecimalEQ;
    reg [31:0] memory[0:468];       // All instructions

    initial begin                               // Initialize the InstructionBank
        $readmemh("Instruction_memory.txt", memory);
        /* These instructions are for the SAD routine, need to move them into Instruction_memory.txt */
        // memory[0] = 32'b00100011101111011111111111111100;	//	main:		addi	$sp, $sp, -4
        // memory[1] = 32'b10101111101111110000000000000000;    //            sw    $ra, 0($sp)
        // memory[2] = 32'b00110100000001000000000000000000;    //            ori    $a0, $zero, 0
        // memory[3] = 32'b00110100000001010000000000010000;    //            ori    $a1, $zero, 16
        // memory[4] = 32'b00110100000001100000010000010000;    //                 ori     $a2, $zero, 1040
        // memory[5] = 32'b00001100000000000000000000011010;    //            jal    vbsme
        // memory[6] = 32'b00001100000000000000000000001010;    //            jal    print_result
        // memory[7] = 32'b10001111101111110000000000000000;    //            lw    $ra, 0($sp)
        // memory[8] = 32'b00100011101111010000000000000100;    //            addi    $sp, $sp, 4
        // memory[9] = 32'b00000011111000000000000000001000;    //            jr    $ra
        // memory[10] = 32'b00000000010000000010000000100000;    //    print_result:    add    $a0, $v0, $zero
        // memory[11] = 32'b00110100000000100000000000000001;    //            ori    $v0, $zero, 1
        // memory[12] = 32'b00000000000000000000000000000000;    //            nop
        // memory[13] = 32'b00110100000001000000010001010000;    //            ori    $a0, $zero, 1104
        // memory[14] = 32'b00110100000000100000000000000100;    //            ori    $v0, $zero, 4
        // memory[15] = 32'b00000000000000000000000000000000;    //            nop
        // memory[16] = 32'b00000000011000000010000000100000;    //            add    $a0, $v1, $zero
        // memory[17] = 32'b00110100000000100000000000000001;    //            ori    $v0, $zero, 1
        // memory[18] = 32'b00000000000000000000000000000000;    //            nop
        // memory[19] = 32'b00110100000001000000010001010000;    //            ori    $a0, $zero, 1104
        // memory[20] = 32'b00110100000000100000000000000100;    //            ori    $v0, $zero, 4
        // memory[21] = 32'b00000000000000000000000000000000;    //            nop
        // memory[22] = 32'b00110100000001000000010001010000;    //            ori    $a0, $zero, 1104
        // memory[23] = 32'b00110100000000100000000000000100;    //            ori    $v0, $zero, 4
        // memory[24] = 32'b00000000000000000000000000000000;    //            nop
        // memory[25] = 32'b00000011111000000000000000001000;    //            jr    $ra
        // memory[26] = 32'b00110100000000100000000000000000;    //    vbsme:        ori    $v0, $zero, 0
        // memory[27] = 32'b00110100000000110000000000000000;    //            ori    $v1, $zero, 0
        // memory[28] = 32'b00100011101111011111111111111100;    //            addi    $sp, $sp, -4
        // memory[29] = 32'b10101111101111110000000000000000;    //            sw    $ra, 0($sp)
        // memory[30] = 32'b00000000101000000100000000100000;    //    initialize:    add    $t0, $a1, $0
        // memory[31] = 32'b00100000000100001111111111111111;    //            addi    $s0, $0, -1
        // memory[32] = 32'b00000000000100001000000001000010;    //            srl    $s0, $s0, 1
        // memory[33] = 32'b00000000000000001000100000100000;    //            add    $s1, $0, $0
        // memory[34] = 32'b00000000000000001001000000100000;    //            add    $s2, $0, $0
        // memory[35] = 32'b00000000000000001100000000100000;    //            add    $t8, $0, $0
        // memory[36] = 32'b00000000000000001100100000100000;    //            add    $t9, $0, $0
        // memory[37] = 32'b10001100100101010000000000001100;    //            lw    $s5, 12($a0)
        // memory[38] = 32'b10001100100101100000000000001000;    //            lw    $s6, 8($a0)
        // memory[39] = 32'b10001100100100110000000000000100;    //            lw    $s3, 4($a0)
        // memory[40] = 32'b10001100100101000000000000000000;    //            lw    $s4, 0($a0)
        // memory[41] = 32'b00010110011101010000000000000010;    //            bne    $s3, $s5, traverse
        // memory[42] = 32'b00010110100101100000000000000001;    //            bne    $s4, $s6, traverse
        // memory[43] = 32'b00001000000000000000000010001011;    //            j    match_case
        // memory[44] = 32'b00100010011101110000000000000000;    //    traverse:    addi    $s7, $s3, 0
        // memory[45] = 32'b00000000000101111011100010000000;    //            sll    $s7, $s7, 2
        // memory[46] = 32'b10001100100100110000000000000100;    //            lw    $s3, 4($a0)
        // memory[47] = 32'b00000010011101011001100000100010;    //            sub    $s3, $s3, $s5
        // memory[48] = 32'b00000010011100011001100000100010;    //            sub    $s3, $s3, $s1
        // memory[49] = 32'b00000000000100111001100010000000;    //            sll    $s3, $s3, 2
        // memory[50] = 32'b00000010011010001001100000100000;    //            add    $s3, $s3, $t0
        // memory[51] = 32'b00001000000000000000000000111100;    //            j    horiz_rloop
        // memory[52] = 32'b10001100100100110000000000000100;    //    horiz_rt:    lw    $s3, 4($a0)
        // memory[53] = 32'b10001100100101010000000000001100;    //            lw    $s5, 12($a0)
        // memory[54] = 32'b00000010011101011001100000100010;    //            sub    $s3, $s3, $s5
        // memory[55] = 32'b00000010011100011001100000100010;    //            sub    $s3, $s3, $s1
        // memory[56] = 32'b00010010011000000000000001010100;    //            beq    $s3, $0, finished
        // memory[57] = 32'b00000000000100111001100010000000;    //            sll    $s3, $s3, 2
        // memory[58] = 32'b00000010011010001001100000100000;    //            add    $s3, $s3, $t0
        // memory[59] = 32'b00100010001100010000000000000001;    //            addi    $s1, $s1, 1
        // memory[60] = 32'b00001100000000000000000001101000;    //    horiz_rloop:    jal    sad_calc
        // memory[61] = 32'b00010001000100110000000000000011;    //            beq    $t0, $s3, vert_dn
        // memory[62] = 32'b00100001000010000000000000000100;    //            addi    $t0, $t0, 4
        // memory[63] = 32'b00100011000110000000000000000001;    //            addi    $t8, $t8, 1
        // memory[64] = 32'b00001000000000000000000000111100;    //            j    horiz_rloop
        // memory[65] = 32'b10001100100100110000000000000000;    //    vert_dn:    lw    $s3, 0($a0)
        // memory[66] = 32'b10001100100101100000000000001000;    //            lw    $s6, 8($a0)
        // memory[67] = 32'b00000010011101101001100000100010;    //            sub    $s3, $s3, $s6
        // memory[68] = 32'b00000010011100101001100000100010;    //            sub    $s3, $s3, $s2
        // memory[69] = 32'b00010010011000000000000001000111;    //            beq    $s3, $0, finished
        // memory[70] = 32'b01110010011101111001100000000010;    //            mul    $s3, $s3, $s7
        // memory[71] = 32'b00000010011010001001100000100000;    //            add    $s3, $s3, $t0
        // memory[72] = 32'b00100010010100100000000000000001;    //            addi    $s2, $s2, 1
        // memory[73] = 32'b00001100000000000000000001101000;    //    vert_dloop:    jal    sad_calc
        // memory[74] = 32'b00010001000100110000000000000011;    //            beq    $t0, $s3, horiz_lt
        // memory[75] = 32'b00000001000101110100000000100000;    //            add    $t0, $t0, $s7
        // memory[76] = 32'b00100011001110010000000000000001;    //            addi    $t9, $t9, 1
        // memory[77] = 32'b00001000000000000000000001001001;    //            j    vert_dloop
        // memory[78] = 32'b10001100100100110000000000000100;    //    horiz_lt:    lw    $s3, 4($a0)
        // memory[79] = 32'b10001100100101010000000000001100;    //            lw    $s5, 12($a0)
        // memory[80] = 32'b00000010011101011001100000100010;    //            sub    $s3, $s3, $s5
        // memory[81] = 32'b00000010011100011001100000100010;    //            sub    $s3, $s3, $s1
        // memory[82] = 32'b00010010011000000000000000111010;    //            beq    $s3, $0, finished
        // memory[83] = 32'b00000000000100111001100010000000;    //            sll    $s3, $s3, 2
        // memory[84] = 32'b00000001000100111001100000100010;    //            sub    $s3, $t0, $s3
        // memory[85] = 32'b00100010001100010000000000000001;    //            addi    $s1, $s1, 1
        // memory[86] = 32'b00001100000000000000000001101000;    //    horiz_lloop:    jal    sad_calc
        // memory[87] = 32'b00010001000100110000000000000011;    //            beq    $t0, $s3, vert_up
        // memory[88] = 32'b00100001000010001111111111111100;    //            addi    $t0, $t0, -4
        // memory[89] = 32'b00100011000110001111111111111111;    //            addi    $t8, $t8, -1
        // memory[90] = 32'b00001000000000000000000001010110;    //            j    horiz_lloop
        // memory[91] = 32'b10001100100100110000000000000000;    //    vert_up:    lw    $s3, 0($a0)
        // memory[92] = 32'b10001100100101100000000000001000;    //            lw    $s6, 8($a0)
        // memory[93] = 32'b00000010011101101001100000100010;    //            sub    $s3, $s3, $s6
        // memory[94] = 32'b00000010011100101001100000100010;    //            sub    $s3, $s3, $s2
        // memory[95] = 32'b00010010011000000000000000101101;    //            beq    $s3, $0, finished
        // memory[96] = 32'b01110010011101111001100000000010;    //            mul    $s3, $s3, $s7
        // memory[97] = 32'b00000001000100111001100000100010;    //            sub    $s3, $t0, $s3
        // memory[98] = 32'b00100010010100100000000000000001;    //            addi    $s2, $s2, 1
        // memory[99] = 32'b00001100000000000000000001101000;    //    vert_uloop:    jal    sad_calc
        // memory[100] = 32'b00010001000100111111111111001111;    //            beq    $t0, $s3, horiz_rt
        // memory[101] = 32'b00000001000101110100000000100010;    //            sub    $t0, $t0, $s7
        // memory[102] = 32'b00100011001110011111111111111111;    //            addi    $t9, $t9, -1
        // memory[103] = 32'b00001000000000000000000001100011;    //            j    vert_uloop
        // memory[104] = 32'b10001100100101010000000000001100;    //    sad_calc:    lw    $s5, 12($a0)
        // memory[105] = 32'b10001100100101100000000000001000;    //            lw    $s6, 8($a0)
        // memory[106] = 32'b00000000000101010110000010000000;    //            sll    $t4, $s5, 2
        // memory[107] = 32'b00000001100010000110000000100000;    //            add    $t4, $t4, $t0
        // memory[108] = 32'b00100001100011001111111111111100;    //            addi    $t4, $t4, -4
        // memory[109] = 32'b01110010110101110110100000000010;    //            mul    $t5, $s6, $s7
        // memory[110] = 32'b00000001101010000110100000100000;    //            add    $t5, $t5, $t0
        // memory[111] = 32'b00000001000000000101000000100000;    //            add    $t2, $t0, $0
        // memory[112] = 32'b00000000000000000100100000100000;    //            add    $t1, $0, $0
        // memory[113] = 32'b00000010110000000111100000100000;    //            add    $t7, $s6, $0
        // memory[114] = 32'b00000000110000001010100000100000;    //            add    $s5, $a2, $0
        // memory[115] = 32'b10001101010010110000000000000000;    //    sad_loop:    lw    $t3, 0($t2)
        // memory[116] = 32'b10001110101101100000000000000000;    //            lw    $s6, 0($s5)
        // memory[117] = 32'b00000001011101100111000000100010;    //            sub    $t6, $t3, $s6
        // memory[118] = 32'b00000001110000001010000000101010;    //            slt    $s4, $t6, $0
        // memory[119] = 32'b00010010100000000000000000000001;    //            beq    $s4, $0, sum_pos
        // memory[120] = 32'b00000000000011100111000000100010;    //            sub    $t6, $0, $t6
        // memory[121] = 32'b00000001001011100100100000100000;    //    sum_pos:    add    $t1, $t1, $t6
        // memory[122] = 32'b00010001010011000000000000000011;    //            beq    $t2, $t4, next_row
        // memory[123] = 32'b00100001010010100000000000000100;    //            addi    $t2, $t2, 4
        // memory[124] = 32'b00100010101101010000000000000100;    //            addi    $s5, $s5, 4
        // memory[125] = 32'b00001000000000000000000001110011;    //            j    sad_loop
        // memory[126] = 32'b00100001111011111111111111111111;    //    next_row:    addi    $t7, $t7, -1
        // memory[127] = 32'b01110001111101110111000000000010;    //            mul    $t6, $t7, $s7
        // memory[128] = 32'b00000001101011100101000000100010;    //            sub    $t2, $t5, $t6
        // memory[129] = 32'b00100010101101010000000000000100;    //            addi    $s5, $s5, 4
        // memory[130] = 32'b00000001100101110110000000100000;    //            add    $t4, $t4, $s7
        // memory[131] = 32'b00010101111000001111111111101111;    //            bne    $t7, $0, sad_loop
        // memory[132] = 32'b00000001001100000111000000101010;    //            slt    $t6, $t1, $s0
        // memory[133] = 32'b00010101110000000000000000000001;    //            bne    $t6, $0, new_best
        // memory[134] = 32'b00000011111000000000000000001000;    //            jr    $ra
        // memory[135] = 32'b00000001001000001000000000100000;    //    new_best:    add    $s0, $t1, $0
        // memory[136] = 32'b00000011001000000001000000100000;    //            add    $v0, $t9, $0
        // memory[137] = 32'b00000011000000000001100000100000;    //            add    $v1, $t8, $0
        // memory[138] = 32'b00000011111000000000000000001000;    //            jr    $ra
        // memory[139] = 32'b00000000000000000001000000100000;    //    match_case:    add    $v0, $0, $0
        // memory[140] = 32'b00000000000000000001100000100000;    //            add    $v1, $0, $0
        // memory[141] = 32'b10001111101111110000000000000000;    //    finished:    lw    $ra, 0($sp)
        // memory[142] = 32'b00100011101111010000000000000100;    //            addi    $sp, $sp, 4
        // memory[143] = 32'b00000011111000000000000000001000;    //            jr    $ra
    end
   
    always @ (Address)              // Find the desired address then assign the output to the corresponding instruction
    begin
        Instruction <= memory[Address[10:2]]; 
    end

endmodule
