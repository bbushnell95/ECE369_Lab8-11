`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Team Members:
// Overall percent effort of each team member:
// Brett Bushnell -- 50%
// Derek Mcmullen -- 50% 
// 
////////////////////////////////////////////////////////////////////////////////

module ExecuteUnit(Reset, Clk, BranchIn, MemReadIn, MemWriteIn, RegWriteIn, MemToRegIn, RegDstIn, ALUOpIn, ALUSrcIn, AltALUSrc1In, ZeroALUSrc1In, ZeroALUSrc2In, SwapIn, ALUHiLoSelectIn, MOVNIn, MOVZIn, StraightToHiIn, StraightToLoIn, LoadStoreByteIn, LoadStoreHalfIn, NotZeroIn, JumpIn, ReadData1MEMOverwrite, ReadData2MEMOverwrite, ReadData1WBOverwrite, ReadData2WBOverwrite, PCValueIn, ReadData1In, ReadData2In, SignExtendOffsetIn, RDFieldIn, RTFieldIn, InstructionIn, ForwardedDataFromMEM, ForwardedDataFromWB, HiLoALUControl, AddToHi, AddToLo, MoveToHi, HiLoSel, BranchOut, MemReadOut, MemWriteOut, RegWriteOut, MemToRegOut, LoadStoreByteOut, LoadStoreHalfOut, NotZeroOut, JumpOut, BranchTargetAddressOut, ExecuteDataOut, ZeroOut, DestinationRegOut, MemoryWriteDataOut, EXU_HIRegOutput, EXU_LORegOutput, PCValueForJALOut, InstructionOut);	
	/* Control Signals*/
    output BranchOut; 
    output MemReadOut; 
    output MemWriteOut; 
    output reg RegWriteOut; 
    output MemToRegOut;
    output LoadStoreByteOut;
    output LoadStoreHalfOut;
    output NotZeroOut; 
    output [1:0] JumpOut;
        
    output [31:0] BranchTargetAddressOut;			//this is pcvalue after adding and shifting
    output [31:0] ExecuteDataOut;                   //output to the piperegister  
	output ZeroOut; 
    output [4:0] DestinationRegOut; 
    output [31:0] MemoryWriteDataOut;
    output [31:0] EXU_HIRegOutput, EXU_LORegOutput; 
    output [31:0] PCValueForJALOut; 
    output [31:0] InstructionOut; 
  
	/* Control Signals */
    input Reset, Clk;
    input BranchIn; 
    input MemReadIn; 
    input MemWriteIn; 
    input RegWriteIn; 
    input MemToRegIn;
    input RegDstIn; 
    input [4:0] ALUOpIn; 
    input ALUSrcIn;
    input HiLoALUControl, AddToHi, AddToLo, MoveToHi, HiLoSel;
    input AltALUSrc1In; 
    input ZeroALUSrc1In;
    input ZeroALUSrc2In;     
    input SwapIn; 
    input ALUHiLoSelectIn; 
    input MOVNIn; 
    input MOVZIn; 
    input StraightToHiIn; 
    input StraightToLoIn;
    input LoadStoreByteIn;
    input LoadStoreHalfIn;
    input NotZeroIn; 
    input [1:0] JumpIn;
    input ReadData1MEMOverwrite, ReadData2MEMOverwrite, ReadData1WBOverwrite, ReadData2WBOverwrite;
    //need input control signals for the 4 forwarding cases
    
	input [31:0] PCValueIn; 
    input [31:0] ReadData1In;
    input [31:0] ReadData2In;
    input [31:0] SignExtendOffsetIn;
    input [4:0] RDFieldIn; 
    input [4:0] RTFieldIn;
    input [31:0] InstructionIn;
    input [31:0] ForwardedDataFromMEM; 
    input [31:0] ForwardedDataFromWB; 
    //need input data for 4 forwarded data paths

    wire [31:0] ALUInputData1;              // First Input of ALU
    wire [31:0] ALUInputData2;              // Second Input of ALU
    wire [31:0] AltALUInput1Data;
    wire [31:0] AltALUInput2Data;    
    wire [63:0] ALUResult;
    wire [31:0] SwapperWire1;
    wire [31:0] SwapperWire2;  
    wire [31:0] HiLoOut; 
    wire [31:0] HIRegOutput, LORegOutput; 
    wire [31:0] ForwardedLink1, ForwardedLink2;
    wire [31:0] ForwardedData1, ForwardedData2; 

	
    // Included Modules
	Mux32Bit2To1 AltSrcMux(SwapperWire1, ForwardedData1, AltALUInput1Data, AltALUSrc1In); 
	Mux32Bit2To1 ALUInput2Mux(AltALUInput2Data, ForwardedData2, SignExtendOffsetIn, ALUSrcIn); 
    Mux32Bit2To1 ZeroSrc1Mux(AltALUInput1Data, ForwardedData2, 32'b0, ZeroALUSrc1In); 
    Mux32Bit2To1 ZeroSrc2Mux(SwapperWire2, AltALUInput2Data, 32'b0, ZeroALUSrc2In);  
    Mux32Bit2To1 Mux32Bit2To1_4(DestinationRegOut, RTFieldIn, RDFieldIn, RegDstIn); 
    //Mux32Bit2To1 MoveFromMux(ExecuteDataOut, ALUResult, HiLoOut, MoveFromIn); 
    
    // Swap Muxes
    Mux32Bit2To1 SwapMux_1(ALUInputData1, SwapperWire1, SwapperWire2, SwapIn);  
    Mux32Bit2To1 SwapMux_2(ALUInputData2, SwapperWire2, SwapperWire1, SwapIn);
    
    // ALU
    ALU32Bit ALU32Bit_1(ALUOpIn, ALUInputData1, ALUInputData2, ALUResult, ZeroOut);
    HiLoUnit HiLoUnit_1(ALUResult[63:32], ALUResult[31:0], Clk, Reset, HiLoALUControl, AddToHi, AddToLo, StraightToHiIn, StraightToLoIn, MoveToHi, HiLoSel, HiLoOut, HIRegOutput, LORegOutput);
    Mux32Bit2To1 DataOutMux(ExecuteDataOut, ALUResult[31:0], HiLoOut, ALUHiLoSelectIn);     
    
    // Forwarding Muxes
    Mux32Bit2To1 MEMOverwriteData1Mux(ForwardedLink1, ReadData1In, ForwardedDataFromMEM, ReadData1MEMOverwrite); 
    Mux32Bit2To1 MEMOverwriteData2Mux(ForwardedLink2, ReadData2In, ForwardedDataFromMEM, ReadData2MEMOverwrite);
    Mux32Bit2To1 WBOverwriteData1Mux(ForwardedData1, ForwardedLink1, ForwardedDataFromWB, ReadData1WBOverwrite); 
    Mux32Bit2To1 WBOverwriteData2Mux(ForwardedData2, ForwardedLink2, ForwardedDataFromWB, ReadData2WBOverwrite); 
    
    // Assign Statements
    assign BranchOut = BranchIn; 
    assign MemReadOut = MemReadIn; 
    assign MemWriteOut = MemWriteIn; 
    assign MemToRegOut = MemToRegIn; 
    //assign MemoryWriteDataOut = ReadData2In; 
    assign MemoryWriteDataOut = ForwardedData2;
    assign EXU_HIRegOutput = HIRegOutput;
    assign EXU_LORegOutput = LORegOutput;
    assign LoadStoreByteOut = LoadStoreByteIn;
    assign LoadStoreHalfOut = LoadStoreHalfIn;
    assign NotZeroOut = NotZeroIn;
    assign PCValueForJALOut = PCValueIn; 
    assign JumpOut = JumpIn; 
    assign InstructionOut = InstructionIn; 
    
    always @(ReadData2In or RegWriteIn or MOVZIn or MOVNIn) begin
        if ((MOVZIn == 1) && (ReadData2In == 0)) begin
            RegWriteOut <= 1; 
        end 
        else if ((MOVNIn == 1) && (ReadData2In != 0)) begin
            RegWriteOut <= 1; 
        end
        else RegWriteOut <= RegWriteIn; 
     end
    
    // Need to check this adder and shifter combo
    assign BranchTargetAddressOut = (SignExtendOffsetIn << 2) + PCValueIn; 
    
endmodule

