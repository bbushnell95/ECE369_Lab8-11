`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2017 05:23:17 PM
// Design Name: 
// Module Name: Top_Module
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


module Top_Module(Rst, Clk, out7, en_out);
input Rst, Clk;
output [6:0] out7;
output [7:0] en_out;

wire [31:0] PCHolder, CMHolder;
wire [31:0] XOut, YOut;

//module DataPath(Reset, Clk, ProgramCount, Current_Min, XOut (NumberA), YOut(NumberB));
DataPath DataPath_1(Rst, Clk, PCHolder, CMHolder, XOut, YOut);

//module Two4DigitDisplay(Clk, NumberA, NumberB, out7, en_out);
Two4DigitDisplay Two4DigitDisplay1(Clk, XOut, YOut, out7, en_out);

endmodule
