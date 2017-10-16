`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - HiLoALU.v
// Description - 32-Bit wide ALU for HI and Lo registers. Supported Operations are ADD and SUB.
//
// INPUTS:-
// ALUOp: 1-bit input ALUOp port
// A: 32-bit input A port
// B: 32-bit input B port
//
// OUTPUTS:-
// Result: 32-bit output port Out
//
// FUNCTIONALITY:-
// HiLoRegister takes in a 32-bit input (In) and assigns it to a 32-bit output (Out) on the positive clock edge.
// It uses a synchronous reset.
// Op   | 'ALUOp' value
// ==========================
// ADD  | 0
// SUB  | 1
//
//////////////////////////////////////////////////////////////////////////////////


module HiLoALU(ALUOp, A, B, Result);
    input [31:0] A, B;
    input ALUOp;
    
    output [31:0] Result;
    
    reg [31:0] tempResult;
    
    always@(A, B, ALUOp)begin
        if(ALUOp == 1'b0) tempResult <= A + B;
        else tempResult <= A - B;
    end
    
    assign Result = tempResult;

endmodule
