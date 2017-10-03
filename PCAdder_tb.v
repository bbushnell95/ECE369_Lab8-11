`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369A - Computer Architecture
// Laboratory 1 
// Module - PCAdder_tb.v
// Description - Test the 'PCAdder.v' module.
////////////////////////////////////////////////////////////////////////////////

module PCAdder_tb();

    reg [31:0] PCResult;

    wire [31:0] PCAddResult;

    PCAdder u0(
        .PCResult(PCResult), 
        .PCAddResult(PCAddResult)
    );
    
	initial begin
	
    /* Please fill in the implementation here... */
    
    //Case 0: Initial address
    PCResult <= 'h00000000; 
    $display("PCAddResult = %b", PCAddResult);
   
    //Case 1: Increasing Address
   	#10
    PCResult <= 'h00000004; 
    $display("PCAddResult = %b", PCAddResult);  
    
    //Case 2: Another Step
    #10
    PCResult <= 'h00000008; 
    $display("PCAddResult = %b", PCAddResult);	
    
    //Case 3: Middle Case
    #10
    PCResult <= 'hFFFF0000; 
    $display("PCAddResult = %b", PCAddResult);
    
    //Case 4: End Case
    #10
    PCResult <= 'hFFFFFFFF; 
    $display("PCAddResult = %b", PCAddResult);
   
	end

endmodule

