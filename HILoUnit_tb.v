`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2017 04:43:31 PM
// Design Name: 
// Module Name: HILoUnit_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module HILoUnit_tb();

    reg [31:0] Upper, Lower;
    reg Clk, Reset, HiLoALUControl, AddToHi, AddToLo, MoveToHi, MoveToLo;
    
    wire [31:0] HI, LO;
    
    HiLoUnit u0(
        .Upper(Upper),
        .Lower(Lower),
        .Clk(Clk),
        .Reset(Reset),
        .HiLoALUControl(HiLoALUControl),
        .AddToHi(AddToHi),
        .AddToLo(AddToLo),
        .MoveToHi(MoveToHi),
        .MoveToLo(MoveToLo),
        .HI(HI),
        .LO(LO)
    );
    
    initial begin
        Clk <= 1'b0;
        AddToHi <= 1'b0;
        AddToLo <= 1'b0;
        MoveToHi <= 1'b1;
        MoveToLo <= 1'b1;
        HiLoALUControl <= 1'b0;
        Reset <= 1'b0;
//        Upper = 'h00000001;
//        Lower = 'h00000001;
        forever #100 Clk <= ~Clk;
    end
    
    initial begin
        // Test Reset
        #50 Reset <= 1'b1;
        #1 Reset <= 1'b0;
        #101 $display("HI = %h, LO = %h", HI, LO); MoveToHi <= 1'b0; MoveToLo <= 1'b0;
    end
endmodule
