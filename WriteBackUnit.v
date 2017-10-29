`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Team Members:
// Overall percent effort of each team member:
// Brett Bushnell -- 50%
// Derek Mcmullen -- 50% 
// 
////////////////////////////////////////////////////////////////////////////////

module WriteBackUnit(RegWriteIn, MemToRegIn, JumpIn, ALUIn, MemoryReadDataIn, DestinationRegIn, PCValueForJALIn, RegWriteOut, RegWriteDataOut, DestinationRegOut);
	
    /* Control Signals*/
    output RegWriteOut; 
    
    /* Data Signals*/
    output [31:0] RegWriteDataOut;
    output [4:0] DestinationRegOut; 
	
	/* Control Signals*/
    input RegWriteIn; 
    input MemToRegIn; 
    input [1:0] JumpIn; 
    
    /* Data Signals*/
    input [31:0] ALUIn;
    input [31:0] MemoryReadDataIn; 
    input [4:0] DestinationRegIn; 
    input [31:0] PCValueForJALIn; 
    
    wire [31:0] NonJumpWriteData; 
    wire JumpControlsOrTogether; 
    
    // Included Modules
	Mux32Bit2To1 WriteDataMux(NonJumpWriteData, MemoryReadDataIn, ALUIn, MemToRegIn); 
	Mux32Bit2To1 WriteDataOverride(RegWriteDataOut, NonJumpWriteData, PCValueForJALIn, JumpControlsOrTogether); 
	Mux32Bit2To1 DestinationRegOverride(DestinationRegOut, DestinationRegIn, 31, JumpControlsOrTogether); 
	
	// Assign statements
	assign RegWriteOut = RegWriteIn; 
	//assign DestinationRegOut = DestinationRegIn;
	assign JumpControlsOrTogether = (JumpIn[0] | JumpIn[1]); 
    
endmodule

