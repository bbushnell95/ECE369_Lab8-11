`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Team Members:
// Overall percent effort of each team member:
// Brett Bushnell -- 50%
// Derek Mcmullen -- 50% 
// 
////////////////////////////////////////////////////////////////////////////////

module WriteBackUnit(Clk, RegWriteIn, MemToRegIn, ALUIn, MemoryReadDataIn, DestinationRegIn, RegWriteOut, RegWriteDataOut, DestinationRegOut);
	
    /* Control Signals*/
    output RegWriteOut; 
    /* Data Signals*/
    output [31:0] RegWriteDataOut;
    output [4:0] DestinationRegOut; 
	
	/* Control Signals*/
	input Clk; 
    input RegWriteIn; 
    input MemToRegIn; 
    /* Data Signals*/
    input [63:0] ALUIn;
    input [31:0] MemoryReadDataIn; 
    input [4:0] DestinationRegIn; 
    
    // Included Modules
	Mux32Bit2To1 Mux32Bit2To1_1(RegWriteDataOut, MemoryReadDataIn, ALUIn, MemToRegIn); 
	
	// Assign statements
	assign RegWriteOut = RegWriteIn; 
	assign DestinationRegOut = DestinationRegIn;
    
endmodule

