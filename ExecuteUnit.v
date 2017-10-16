`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Team Members:
// Overall percent effort of each team member:
// Brett Bushnell -- 50%
// Derek Mcmullen -- 50% 
// 
////////////////////////////////////////////////////////////////////////////////

module ExecuteUnit(Reset, Clk, BranchIn, MemReadIn, MemWriteIn, RegWriteIn, MemToRegIn, RegDstIn, ALUOpIn, ALUSrcIn, AltALUSrc1In, ZeroALUSrc1In, SwapIn, PCValueIn, ReadData1In, ReadData2In, SignExtendOffsetIn, RDFieldIn, RTFieldIn, BranchOut, MemReadOut, MemWriteOut, RegWriteOut, MemToRegOut, BranchTargetAddressOut, ALUOut, ZeroOut, RegisterWriteDataOut, DestinationRegOut, MemoryWriteDataOut);
	
	/* Control Signals*/
    output BranchOut; 
    output MemReadOut; 
    output MemWriteOut; 
    output RegWriteOut; 
    output MemToRegOut; 
        
    output [31:0] BranchTargetAddressOut;			//this is pcvalue after adding and shifting
    output [63:0] ALUOut;
	output ZeroOut; 
	output [31:0] RegisterWriteDataOut; 
    output [4:0] DestinationRegOut; 
    output [31:0] MemoryWriteDataOut; 
	
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
    input AltALUSrc1In; 
    input ZeroALUSrc1In; 
    input SwapIn; 
    
	input [31:0] PCValueIn; 
    input [31:0] ReadData1In;
    input [31:0] ReadData2In;
    input [31:0] SignExtendOffsetIn;
    input [4:0] RDFieldIn; 
    input [4:0] RTFieldIn;

    wire [31:0] ALUInputData1;              // First Input of ALU
    wire [31:0] ALUInputData2;              // Second Input of ALU
    wire [31:0] AltALUInputData;            
    wire [31:0] SwapperWire1;
    wire [31:0] SwapperWire2;  
	
    // Included Modules
	Mux32Bit2To1 Mux32Bit2To1_1(SwapperWire1, ReadData1In, AltALUInputData, AltALUSrc1In); 
	Mux32Bit2To1 Mux32Bit2To1_2(SwapperWire2, ReadData2In, SignExtendOffsetIn, ALUSrcIn); 
    Mux32Bit2To1 Mux32Bit2To1_3(AltALUInputData, ReadData2In, 0, ZeroALUSrc1In); 
    Mux32Bit2To1 Mux32Bit2To1_4(DestinationRegOut, RTFieldIn, RDFieldIn, RegDstIn); 
    
    // Swap Muxes
    Mux32Bit2To1 Mux32Bit2To1_5(ALUInputData1, SwapperWire1, SwapperWire2, SwapIn);  
    Mux32Bit2To1 Mux32Bit2To1_6(ALUInputData2, SwapperWire2, SwapperWire1, SwapIn);
    
    // ALU
    ALU32Bit ALU32Bit_1(ALUOpIn, ALUInputData1, ALUInputData2, ALUOut, ZeroOut);
    
    // Assign Statements
    assign BranchOut = BranchIn; 
    assign MemReadOut = MemReadIn; 
    assign MemWriteOut = MemWriteIn; 
    assign RegWriteOut = RegWriteIn; 
    assign MemToRegOut = MemToRegIn; 
    assign MemoryWriteDataOut = ReadData2In; 
    
    // Need to check this adder and shifter combo
    assign BranchTargetAddressOut = (SignExtendOffsetIn << 2) + PCValueIn; 
    
    
endmodule

