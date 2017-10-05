`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - HiLoRegister_tb.v
// Description - Test the 'HiLoRegister.v' module.
//////////////////////////////////////////////////////////////////////////////////


module HiLoALU_tb();
    reg [31:0] A, B;
    reg ALUOp;
    
    wire [31:0] Result;
    
    HiLoALU u0(
        .ALUOp(ALUOp),
        .A(A),
        .B(B),
        .Result(Result)
    );
    
    
    initial begin
        //Adding 0 and 1 (Result = 'h00000001)
        #100 A <= 'h00000000; B <= 'h00000001; ALUOp <= 1'b0;
        #20 $display("Result = %h", Result);
        
        //Subtracting 0 and 1 (Result = 'hFFFFFFFF)
        #100 A <= 'h00000000; B <= 'h00000001; ALUOp <= 1'b1;
        #20 $display("Result = %h", Result);
    end

endmodule
