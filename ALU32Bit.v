`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - ALU32Bit.v
// Description - 32-Bit wide arithmetic logic unit (ALU).
//
// INPUTS:-
// ALUControl: 5-Bit input control bits to select an ALU operation.
// A: 32-Bit input port A.
// B: 32-Bit input port B.
//
// OUTPUTS:-
// ALUResult: 32-Bit ALU result output.
// ZERO: 1-Bit output flag. 
//
// FUNCTIONALITY:-
// Design a 32-Bit ALU behaviorally, so that it supports addition,  subtraction,
// AND, OR, and set on less than (SLT). The 'ALUResult' will output the 
// corresponding result of the operation based on the 32-Bit inputs, 'A', and 
// 'B'. The 'Zero' flag is high when 'ALUResult' is '0'. The 'ALUControl' signal 
// should determine the function of the ALU based on the table below:-
// Op   | 'ALUControl' value
// ==========================
// ADD  | 00010
// SUB  | 00110
// AND  | 00000
// OR   | 00001
// NOR  | 00011
// XNOR | 00100
// SLT  | 00111
// MULT | 01000
// SEH  | 01001
// SEB  | 01010
// SLL  | 01011
// SRL  | 01100
// ROTR | 01101
// SRA  | 01110
// SLLV | 00101
// SRLV | 01111
// ROTRV| 10001
// 
//
//
// NOTE:-less
// SLT (i.e., set on  than): ALUResult is '32'h000000001' if A < B.
// 
////////////////////////////////////////////////////////////////////////////////

module ALU32Bit(ALUControl, A, B, ALUResult, Zero);

	input [4:0] ALUControl; // control bits for ALU operation
	input [31:0] A, B;	    // inputs

	output [63:0] ALUResult;	// answer
	output Zero;	    // Zero=1 if ALUResult == 0
    
    /* Please fill in the implementation here... */
    parameter ADD = 5'b00010, SUB = 5'b00110, AND = 5'b00000, OR = 5'b00001, NOR = 5'b00011, XOR = 5'b00100, SLT = 5'b00111;
    parameter MULT = 5'b01000, SEH = 5'b01001, SEB = 5'b01010, SLL = 5'b01011, SRL = 5'b01100, ROTR = 5'b01101, SRA = 5'b01110;
    parameter SLLV = 5'b00101, SRLV = 5'b01111, ROTRV = 5'b10000; 
    reg [63:0] TempResult;
    reg TempZero;
    
    always@(ALUControl, A, B)begin
        TempZero <= 0;
        case(ALUControl)
            ADD: TempResult = A + B;
            SUB: TempResult = A - B;
            AND: TempResult = A & B;
            OR: TempResult = A | B;
            NOR: TempResult = ~(A | B);
            XOR: TempResult = A ^ B;
            SLT: TempResult = A < B;
            MULT: TempResult = A * B;
            SEH: TempResult = {{16{B[15]}}, B[15:0]};
            SEB: TempResult = {{24{B[7]}}, B[7:0]};
            SLL: TempResult = A << B[10:6];
            SRL: TempResult = A >> B[10:6];
            SLLV: TempResult = A << B; 
            SRLV: TempResult = A >> B; 
            ROTR: TempResult = {{32{1'b0}}, (A << 32-B[10:6]) | (A >> B[10:6])};
            ROTRV: TempResult = {{32{1'b0}}, (A << 32-B) | (A >> B)};
            SRA: TempResult = A >>> B;
            default: TempResult = 64'bX;
        endcase
        
        //check if the result is zero
        if(TempResult == 0) TempZero <= 1;
    end
    
    assign Zero = TempZero;
    assign ALUResult = TempResult;

endmodule

