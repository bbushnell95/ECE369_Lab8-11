`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - HiLoUnit.v
// Description - Unit to handel instructions needing the Hi an Lo registers.
//
// INPUTS:-
// Upper: Upper 32-bit input from ALU
// Lower: Lower 32-bit input from ALU
// HiLoALUControl: Controal signal for HiLoALU
// Clk: clock signal
// Reset: Reset Signal
//
// OUTPUTS:-
// HI: Hi register value
// LO: Lo register value
//
// FUNCTIONALITY:-
//
//////////////////////////////////////////////////////////////////////////////////


module HiLoUnit(Upper, Lower, Clk, Reset, HiLoALUControl, AddToHi, AddToLo, MoveToHi, MoveToLo, HI, LO);
    input [31:0] Upper, Lower;
    input Clk, Reset, HiLoALUControl, AddToHi, AddToLo, MoveToHi, MoveToLo;
    
    output [31:0] HI, LO;
    
    wire [31:0] HiMux1Out, LoMux1Out, HiMux2Out, LoMux2Out, HiALUOut, LoALUOut, HiRegOut, LoRegOut;
    
    HiLoALU HiALU(HiLoALUControl, Upper, HiRegOut, HiALUOut);
    HiLoALU LoALU(HiLoALUControl, Lower, LoRegOut, LoALUOut);
    Mux32Bit2To1 HiMux1(HiMux1Out, HiRegOut, HiALUOut, AddToHi);
    Mux32Bit2To1 LoMux1(LoMux1Out, LoRegOut, LoALUOut, AddToLo);
    Mux32Bit2To1 HiMux2(HiMux2Out, HiMux1Out, Upper, MoveToHi);
    Mux32Bit2To1 LoMux2(LoMux2Out, LoMux1Out, Lower, MoveToLo);
    HiLoRegister HiReg(Clk, HiMux2Out, Reset, HiRegOut);
    HiLoRegister LoReg(Clk, LoMux2Out, Reset, LoRegOut);
    
    assign HI = HiRegOut;
    assign LO = LoRegOut;

endmodule
