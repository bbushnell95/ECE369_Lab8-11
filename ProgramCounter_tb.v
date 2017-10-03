`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369A - Computer Architecture
// Laboratory 1
// Module - ProgramCounter_tb.v
// Description - Test the 'ProgramCounter.v' module.
////////////////////////////////////////////////////////////////////////////////

module ProgramCounter_tb(); 

	reg [31:0] Address;
	reg Reset, Clk;

	wire [31:0] PCResult;

    ProgramCounter u0(
        .Address(Address), 
        .PCResult(PCResult), 
        .Reset(Reset), 
        .Clk(Clk)
    );

	initial begin
		Clk <= 1'b0;
		forever #10 Clk <= ~Clk;
	end

	initial begin
	
    /* Please fill in the implementation here... */
	//Case 0: Reset
	Reset <= 1'b1;
	#1 Reset <= 1'b0; $display("PCResult = %b", PCResult);
	
	//Case 1: 0000 0001
    Address <= 'h01;
    #10 $display("PCResult = %h", PCResult); 
    
    //Case 2: 0000 AB12
    Address <= 'h0000AB12;
    #20 $display("PCResult = %h", PCResult);
    
    //Case 3: FFFF FFFF
    Address <= 'hFFFFFFFF;
    #20 $display("PCResult = %h", PCResult);
    
    //Case 4: Reset #2
    Reset <= 1'b1;
    #1 Reset <= 1'b0; $display("PCResult = %h", PCResult);
	end

endmodule

