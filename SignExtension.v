`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - SignExtension.v
// Description - Sign extension module.
////////////////////////////////////////////////////////////////////////////////
module SignExtension(in, zeroExtend, out);

    /* A 16-Bit input word */
    input [15:0] in;
    input zeroExtend;
    
    /* A 32-Bit output word */
    output [31:0] out;
    
    reg [31:0] outTemp;
    /* Fill in the implementation here ... */
        
    always@(in, zeroExtend)begin
        if(zeroExtend == 1'b1) outTemp <= {{16{1'b0}}, in};
        else outTemp <= { {16{in[15]}}, in};
    end
    
    assign out = outTemp;
    
endmodule
