`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - HiLoRegister.v
// Description - 32-Bit wide register for HI and LO.
//
// INPUTS:-
// In: 32-bit input port In
// Clk: 32-bit input clock signal
//
// OUTPUTS:-
// Out: 32-bit output port Out
//
// FUNCTIONALITY:-
// HiLoRegister takes in a 32-bit input (In) and assigns it to a 32-bit output (Out) on the positive clock edge.
// It uses a synchronous reset.
//
//////////////////////////////////////////////////////////////////////////////////


module HiLoRegister(Clk, In, Reset,Out);
    input [31:0]In;
    input Clk, Reset;
    
    output reg [31:0] Out;
    
    always@(posedge Clk)begin
        if(Reset == 1'b1) Out<=32'b0;
        else Out <= In;
    end
endmodule
