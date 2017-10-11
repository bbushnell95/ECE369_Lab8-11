`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Team Members:
// Overall percent effort of each team member:
// Brett Bushnell -- 50%
// Derek Mcmullen -- 50% 
// 
////////////////////////////////////////////////////////////////////////////////

module ExecuteUnit(Reset, Clk, BranchIn, MemReadIn, MemWriteIn, RegWriteIn, MemToRegIn, RegDstIn, ALUOpIn, ALUSrcIn, PCValueIn, ReadData1In, ReadData2In, SignExtendOffsetIn, RDFieldIn, RTFieldIn, BranchOut, MemReadOut, MemWriteOut, RegWriteOut, MemToRegOut, BranchTargetAddressOut, ALUOut, ZeroOut, RegisterWriteDataOut, DestinationRegOut);
	
	/* Control Signals*/
    output BranchOut; 
    output MemReadOut; 
    output MemWriteOut; 
    output RegWriteOut; 
    output MemToRegOut; 
        
    output [31:0] BranchTargetAddressOut;			//this is pcvalue
    output [63:0] ALUOut;
	output ZeroOut; 
	output [31:0] RegisterWriteDataOut; 
    output [4:0] DestinationRegOut; 
	
	/* Control Signals */
    input Reset, Clk;
    input BranchIn; 
    input MemReadIn; 
    input MemWriteIn; 
    input RegWriteIn; 
    input MemToRegIn;
    input RegDstIn; 
    input [3:0] ALUOpIn; 
    input ALUSrcIn;
    // need to implement AltALUSrc1 & ZeroALUSrc1
    // need to add swap mux and control
    
	input [31:0] PCValueIn; 
    input [31:0] ReadData1In;
    input [31:0] ReadData2In;
    input [31:0] SignExtendOffsetIn;
    input [4:0] RDFieldIn; 
    input [4:0] RTFieldIn;

    wire [31:0] ALUInputData1;              // First Input of ALU
    wire [31:0] ALUInputData2;              // Second Input of ALU
    wire [31:0] AltALUInputData;            // wire from mux to mux at input 1 of ALU
	
	Mux32Bit2To1 Mux32Bit2To1_1(ALUInputData1, ReadData1In, AltALUInputData, AltALUSrc1); 
	Mux32Bit2To1 Mux32Bit2To1_2(ALUInputData2, ReadData2In, SignExtendOffsetIn, ALUSrcIn); 
    Mux32Bit2To1 Mux32Bit2To1_3(AltALUInputData, ReadData2In, 0, ZeroALUSrc1); 
    Mux32Bit2To1 Mux32Bit2To1_4(DestinationRegOut, RTFieldIn, RDFieldIn, RegDstIn); 
    ALU32Bit ALU32Bit_1(ALUOpIn, ALUInputData1, ALUInputData2, ALUOut, ZeroOut);
    
    //need to pass through most control signals
    //need to pass through ReadData2In -> MemoryWriteDataOut (must add WriteDataOut)
    
    //need to implement shift left 2
    //need to implement adder
    //controller needs to be implemented
    
endmodule

