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


module HiLoUnit(Upper, Lower, Clk, Reset, HiLoALUControl, AddToHi, AddToLo, MoveToHi, MoveToLo, HiLoSel, HiLoOut, HIRegOutput, LORegOutput);
    input [31:0] Upper, Lower;
    input Clk, Reset, HiLoALUControl, AddToHi, AddToLo, MoveToHi, MoveToLo, HiLoSel;
    
    output [31:0] HiLoOut, HIRegOutput, LORegOutput;
    
    wire [31:0] HiMux1Out, LoMux1Out, HiMux2Out, LoMux2Out, LoALUOut, HiRegOut, LoRegOut;
    wire [63:0] HiLoALUOut;
    
    HiLoALU HiLoALU(HiLoALUControl, {HiRegOut, LoRegOut}, {Upper, Lower}, HiLoALUOut);
    Mux32Bit2To1 HiMux1(HiMux1Out, HiRegOut, HiLoALUOut[63:32], AddToHi);
    Mux32Bit2To1 LoMux1(LoMux1Out, LoRegOut, HiLoALUOut[31:0], AddToLo);
    Mux32Bit2To1 HiMux2(HiMux2Out, HiMux1Out, Upper, MoveToHi);
    Mux32Bit2To1 LoMux2(LoMux2Out, LoMux1Out, Lower, MoveToLo);
    HiLoRegister HiReg(Clk, HiMux2Out, Reset, HiRegOut);
    HiLoRegister LoReg(Clk, LoMux2Out, Reset, LoRegOut);
    Mux32Bit2To1 HiLoMux(HiLoOut, LoRegOut, HiRegOut, HiLoSel);
    
    assign HIRegOutput = HiRegOut; 
    assign LORegOutput = LoRegOut;

endmodule
