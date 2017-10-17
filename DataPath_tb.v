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
    //reg [31:0] WriteData;
    
    DataPath u0(
       .Clk(Clk), 
       .Reset(Reset), 
       .WriteData(WriteData)
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
        #10 Reset <= 1'b0; 

    end
endmodule

