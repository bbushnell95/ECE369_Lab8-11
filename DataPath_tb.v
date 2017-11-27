`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2017 04:43:31 PM
// Design Name: 
// Module Name: DataPath_tb
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


module DataPath_tb();

    reg Clk, Reset;  
    wire [31:0] ProgramCount;
    wire [31:0] CurrentMin;
    wire [31:0] XOut; 
    wire [31:0] YOut;
    
    DataPath u0(
       .Clk(Clk), 
       .Reset(Reset), 
       .ProgramCount(ProgramCount),
       .CurrentMin(CurrentMin),
       .XOut(XOut),
       .YOut(YOut)
    );
    
    initial begin
        Clk <= 1'b0;
        forever #100 Clk <= ~Clk;
    end
    
    initial begin

        //WriteData <= 'h00000000; 

        Reset <= 1'b1;

        // Reset Off
        @(posedge Clk);
        @(posedge Clk);
        @(posedge Clk);
        @(posedge Clk);
        #10 Reset <= 1'b0; 

    end
endmodule

