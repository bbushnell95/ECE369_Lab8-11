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
    reg Clk, Reset, HiLoALUControl, AddToHi, AddToLo, MoveToHi, MoveToLo, HiLoSel;
    
    wire [31:0] HiLoOut;
    
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
        .HiLoSel(HiLoSel),
        .HiLoOut(HiLoOut)
    );
    
    initial begin
        Clk <= 1'b0;
        forever #100 Clk <= ~Clk;
    end
    
    initial begin
        //Initialize values to zero (except Upper and Lower)
        AddToHi <= 1'b0;
        AddToLo <= 1'b0;
        MoveToHi <= 1'b0;
        MoveToLo <= 1'b0;
        HiLoALUControl <= 1'b0;
        HiLoSel <= 1'b0;
        Reset <= 1'b1;
        Upper <= 'h00000001;
        Lower <= 'h000FFFFF;
        // Test Reset
        @(posedge Clk);
        #10 Reset <= 1'b0; $display("HiLoOut = %h", HiLoOut);
        //Test Move to Hi and Lo
        #100 MoveToHi <= 1'b1; MoveToLo <= 1'b1;
        @(posedge Clk);
        #10 MoveToHi <= 1'b0; MoveToLo <= 1'b0;
        //Test adding to hi and lo
        #100 Upper <= 'h00000001; Lower <= 'h00000001; AddToHi <= 1'b1; AddToLo <= 1'b1;
        @(posedge Clk);
        #10 AddToHi <= 1'b0; AddToLo <= 1'b0; $display("HiLoOut = %h", HiLoOut);
        //test subtracting hi and lo
        #100 Upper <= 'h00000002; Lower <= 'h00000001; AddToHi <= 1'b1; AddToLo <= 1'b1; HiLoALUControl <= 1'b1;
        @(posedge Clk);
        #10 AddToHi <= 1'b0; AddToLo <= 1'b0; HiLoALUControl <= 1'b0; $display("HiLoOut = %h", HiLoOut);
        // Test HiLoSel
        #100 HiLoSel <= 1'b1;
        $display("HiLoOut = %h", HiLoOut);
        #100 HiLoSel <= 1'b0;
        $display("HiLoOut = %h", HiLoOut);
    end
endmodule

