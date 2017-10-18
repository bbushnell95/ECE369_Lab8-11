`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Team Members:
// Overall percent effort of each team member:
// Brett Bushnell -- 50%
// Derek Mcmullen -- 50% 
// 
////////////////////////////////////////////////////////////////////////////////

module ExecuteUnit(Reset, Clk, BranchIn, MemReadIn, MemWriteIn, RegWriteIn, MemToRegIn, RegDstIn, ALUOpIn, ALUSrcIn, AltALUSrc1In, ZeroALUSrc1In, ZeroALUSrc2In, SwapIn, ALUHiLoSelectIn, PCValueIn, ReadData1In, ReadData2In, SignExtendOffsetIn, RDFieldIn, RTFieldIn, HiLoALUControl, AddToHi, AddToLo, MoveToHi, MoveToLo, HiLoSel, BranchOut, MemReadOut, MemWriteOut, RegWriteOut, MemToRegOut, BranchTargetAddressOut, ExecuteDataOut, ZeroOut, DestinationRegOut, MemoryWriteDataOut);	
	/* Control Signals*/
    output BranchOut; 
    output MemReadOut; 
    output MemWriteOut; 
    output RegWriteOut; 
    output MemToRegOut; 
        
    output [31:0] BranchTargetAddressOut;			//this is pcvalue after adding and shifting
    output [31:0] ExecuteDataOut;                   //output to the piperegister  
	output ZeroOut; 
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
    input HiLoALUControl, AddToHi, AddToLo, MoveToHi, MoveToLo, HiLoSel;
    input AltALUSrc1In; 
    input ZeroALUSrc1In;
    input ZeroALUSrc2In;     
    input SwapIn; 
    input ALUHiLoSelectIn; 
    
	input [31:0] PCValueIn; 
    input [31:0] ReadData1In;
    input [31:0] ReadData2In;
    input [31:0] SignExtendOffsetIn;
    input [4:0] RDFieldIn; 
    input [4:0] RTFieldIn;

    wire [31:0] ALUInputData1;              // First Input of ALU
    wire [31:0] ALUInputData2;              // Second Input of ALU
    wire [31:0] AltALUInput1Data;
    wire [31:0] AltALUInput2Data;    
    wire [63:0] ALUResult;
    wire [31:0] SwapperWire1;
    wire [31:0] SwapperWire2;  
    wire [31:0] HiLoOut; 

	
    // Included Modules
	Mux32Bit2To1 AltSrcMux(SwapperWire1, ReadData1In, AltALUInput1Data, AltALUSrc1In); 
	Mux32Bit2To1 Mux32Bit2To1_2(AltALUInput2Data, ReadData2In, SignExtendOffsetIn, ALUSrcIn); 
    Mux32Bit2To1 ZeroSrc1Mux(AltALUInput1Data, ReadData2In, 32'b0, ZeroALUSrc1In); 
    Mux32Bit2To1 ZeroSrc2Mux(SwapperWire2, AltALUInput2Data, 32'b0, ZeroALUSrc2In);  
    Mux32Bit2To1 Mux32Bit2To1_4(DestinationRegOut, RTFieldIn, RDFieldIn, RegDstIn); 
    
    
    // Swap Muxes
    Mux32Bit2To1 SwapMux_1(ALUInputData1, SwapperWire1, SwapperWire2, SwapIn);  
    Mux32Bit2To1 SwapMux_2(ALUInputData2, SwapperWire2, SwapperWire1, SwapIn);
    
    // ALU
    ALU32Bit ALU32Bit_1(ALUOpIn, ALUInputData1, ALUInputData2, ALUResult, ZeroOut);
    HiLoUnit HiLoUnit_1(ALUResult[63:32], ALUResult[31:0], Clk, Reset, HiLoALUControl, AddToHi, AddToLo, MoveToHi, MoveToLo, HiLoSel, HiLoOut);
    Mux32Bit2To1 DataOutMux(ExecuteDataOut, ALUResult[31:0], HiLoOut, ALUHiLoSelectIn);     
    
    // Assign Statements
    assign BranchOut = BranchIn; 
    assign MemReadOut = MemReadIn; 
    assign MemWriteOut = MemWriteIn; 
    assign RegWriteOut = RegWriteIn; 
    assign MemToRegOut = MemToRegIn; 
    assign MemoryWriteDataOut = ReadData2In; 
//    assign HIRegOutput = 
//    assign LORegOutput = 
    //assign ALUOut = ALUResult[31:0];
    
    // Need to check this adder and shifter combo
    assign BranchTargetAddressOut = (SignExtendOffsetIn << 2) + PCValueIn; 
    
endmodule

