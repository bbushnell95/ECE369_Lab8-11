`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Team Members:
// Overall percent effort of each team member:
// Brett Bushnell -- 50%
// Derek Mcmullen -- 50% 
// 
////////////////////////////////////////////////////////////////////////////////

module InstructionDecodeUnit(Instruction, PCValueIn, DestinationRegIn, WriteData, RegWriteIn, Reset, Clk, BranchOut, MemReadOut, MemWriteOut, RegWriteOut, MemToRegOut, RegDstOut, ALUOpOut, ALUSrcOut, HiLoALUControlOut, AddToHiOut, AddToLoOut, MoveToHiOut, HiLoSelOut, AltALUSrc1Out, ZeroALUSrc1Out, ZeroALUSrc2Out, SwapOut, ALUHiLoSelectOut, MOVNOut, MOVZOut, StraightToHiOut, StraightToLoOut, LoadStoreByteOut, LoadStoreHalfOut, NotZeroOut, JumpOut, PCValueOut, JumpPCValueOut, ReadData1Out, ReadData2Out, SignExtendOffsetOut, RDFieldOut, RTFieldOut, InstructionOut);

    input Reset, Clk;
    input [31:0] Instruction;
	input [31:0] PCValueIn; 
	input [4:0] DestinationRegIn; 
	input [31:0] WriteData;
	input RegWriteIn; 
	
	/* Control Signals*/
    output BranchOut; 
    output MemReadOut; 
    output MemWriteOut; 
    output RegWriteOut; 
    output MemToRegOut; 
    output RegDstOut; 
    output [4:0] ALUOpOut; 
    output ALUSrcOut;
    output HiLoALUControlOut, AddToHiOut, AddToLoOut, MoveToHiOut, HiLoSelOut;
    output AltALUSrc1Out; 
    output ZeroALUSrc1Out;
    output ZeroALUSrc2Out; 
    output SwapOut;
    output ALUHiLoSelectOut; 
    output MOVNOut; 
    output MOVZOut; 
    output StraightToHiOut;
    output StraightToLoOut;
    output LoadStoreByteOut;
    output LoadStoreHalfOut;
    output NotZeroOut;
    output [1:0] JumpOut;
    
    output [31:0] PCValueOut;
    output [31:0] JumpPCValueOut;  
    output [31:0] ReadData1Out;
    output [31:0] ReadData2Out;
    output [31:0] SignExtendOffsetOut;
    output [4:0] RDFieldOut; 
    output [4:0] RTFieldOut; 
    output [31:0] InstructionOut; 

	
	wire ZeroExtend;
   // wire place_holder; 	
	
    // Included Modules
    RegisterFile RegisterFile_1(Instruction[25:21], Instruction[20:16], DestinationRegIn, WriteData, RegWriteIn, Clk, ReadData1Out, ReadData2Out);
    SignExtension SignExtension_1(Instruction[15:0], ZeroExtend, SignExtendOffsetOut);
    Controller Controller_1(Instruction, BranchOut, MemReadOut, MemWriteOut, RegWriteOut, MemToRegOut, RegDstOut, ALUOpOut, ALUSrcOut, HiLoALUControlOut, AddToHiOut, AddToLoOut, MoveToHiOut, HiLoSelOut, ZeroExtend, AltALUSrc1Out, ZeroALUSrc1Out, ZeroALUSrc2Out, SwapOut, ALUHiLoSelectOut, MOVNOut, MOVZOut, StraightToHiOut, StraightToLoOut, LoadStoreByteOut, LoadStoreHalfOut, NotZeroOut, JumpOut);
    
    
    assign JumpPCValueOut = { PCValueIn[31:28] , Instruction[25:0] , 2'b00};  // and write it as a direct output to jump muxes in IF unit
    
    // Assign Statements
//    assign RSFieldOut = Instruction[25:21];
    assign RTFieldOut = Instruction[20:16];
    assign RDFieldOut = Instruction[15:11];
    assign PCValueOut = PCValueIn;     
    assign InstructionOut = Instruction;
    
endmodule

