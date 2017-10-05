`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - ALU32Bit.v
// Description - 32-Bit wide arithmetic logic unit (ALU).
//
// INPUTS:-
// ALUControl: 4-Bit input control bits to select an ALU operation.
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
// ADD  | 0010
// SUB  | 0110
// AND  | 0000
// OR   | 0001
// SLT  | 0111
//
// NOTE:-less
// SLT (i.e., set on  than): ALUResult is '32'h000000001' if A < B.
// 
////////////////////////////////////////////////////////////////////////////////

module ALU32Bit(ALUControl, A, B, ALUResult, Zero);

	input [3:0] ALUControl; // control bits for ALU operation
	input [31:0] A, B;	    // inputs

	output [63:0] ALUResult;	// answer
	output Zero;	    // Zero=1 if ALUResult == 0
    
    /* Please fill in the implementation here... */
    parameter ADD = 4'b0010, SUB = 4'b0110, AND = 4'b0000, OR = 4'b0001, SLT = 4'b0111;
    reg [63:0] TempResult;
    reg TempZero;
    
    always@(ALUControl, A, B)begin
        TempZero <= 0;
        case(ALUControl)
            ADD: TempResult = A + B;
            SUB: TempResult = A - B;
            AND: TempResult = A & B;
            OR: TempResult = A | B;
            SLT: TempResult = A < B;
        endcase
        
        //check if the result is zero
        if(TempResult == 0)TempZero <= 1;
    end
    
    assign Zero = TempZero;
    assign ALUResult = TempResult;

endmodule

