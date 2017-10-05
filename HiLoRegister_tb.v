`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - HiLoRegister_tb.v
// Description - Test the 'HiLoRegister.v' module.
//////////////////////////////////////////////////////////////////////////////////


module HiLoRegister_tb();
    reg [31:0] In;
    reg Reset, Clk;
    wire [31:0] Out;
    
    HiLoRegister u0(
        .Clk(Clk),
        .In(In),
        .Reset(Reset),
        .Out(Out)
    );
    
    initial begin
        Clk <= 1'b0;
        forever #100 Clk <= ~Clk;
    end
    
    initial begin
        //Case 0: Reset (Out should be 0)
        #90 Reset <= 1'b1;
        #20 Reset <= 1'b0; $display("Out = %h", Out);
        
        //Case 1: 'h00000001 (Out should be 'h00000001)
        #180 In <= 'h00000001;
        #20 $display("Out = %h", Out);
        
        //Case 2: 'hFFFFFFFF (Out should be 'hFFFFFFFF)
        #180 In <= 'hFFFFFFFF;
        #20 $display("Out = %h", Out);
        
        //Case 3: no change (Out should be 'hFFFFFFFF)
        #200 $display("Out = %h", Out);
        
        //Case 4: Reset (Out should be 'h00000000)
        #180 Reset = 1'b1;
        #20 Reset = 1'b0; $display("Out = %h", Out);
        
    end
endmodule
