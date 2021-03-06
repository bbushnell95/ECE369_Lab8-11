`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
//
// Student(s) Name and Last Name:   Derek McMullen
//                                  Brett Bushnell
// Module - EX_Mem_PipeReg.v
// Description - Implements a register between ID and EX stage of processor
////////////////////////////////////////////////////////////////////////////////

module ID_EX_PipeReg(Reset, BranchIn, MemReadIn, MemWriteIn, RegWriteIn, MemToRegIn, RegDstIn, ALUOpIn, ALUSrcIn, HiLoALUControlIn, AddToHiIn, AddToLoIn, MoveToHiIn, HiLoSelIn, AltALUSrc1In, ZeroALUSrc1In, ZeroALUSrc2In, SwapIn, ALUHiLoSelectIn, MOVNIn, MOVZIn, StraightToHiIn, StraightToLoIn, LoadStoreByteIn, LoadStoreHalfIn, NotZeroIn, JumpIn, PCValueIn, ReadData1In, ReadData2In, SignExtendOffsetIn, RDFieldIn, RTFieldIn, InstructionIn, Clk, BranchOut, MemReadOut, MemWriteOut, RegWriteOut, MemToRegOut, RegDstOut, ALUOpOut, ALUSrcOut, HiLoALUControlOut, AddToHiOut, AddToLoOut, MoveToHiOut, HiLoSelOut, AltALUSrc1Out, ZeroALUSrc1Out, ZeroALUSrc2Out, SwapOut, ALUHiLoSelectOut, MOVNOut, MOVZOut, StraightToHiOut, StraightToLoOut, LoadStoreByteOut, LoadStoreHalfOut, NotZeroOut, JumpOut, PCValueOut, ReadData1Out, ReadData2Out, SignExtendOffsetOut, RDFieldOut, RTFieldOut, InstructionOut);

	/* Control Signals*/
    output reg BranchOut; 
    output reg MemReadOut; 
    output reg MemWriteOut; 
    output reg RegWriteOut; 
    output reg MemToRegOut;
    output reg RegDstOut; 
    output reg [4:0] ALUOpOut; 
    output reg ALUSrcOut;
    output reg HiLoALUControlOut, AddToHiOut, AddToLoOut, MoveToHiOut, HiLoSelOut;
    output reg AltALUSrc1Out; 
    output reg ZeroALUSrc1Out;
    output reg ZeroALUSrc2Out;
    output reg SwapOut;
    output reg ALUHiLoSelectOut; 
    output reg MOVNOut; 
    output reg MOVZOut; 
    output reg StraightToHiOut; 
    output reg StraightToLoOut;
    output reg LoadStoreByteOut;
    output reg LoadStoreHalfOut;
    output reg NotZeroOut; 
    output reg [1:0] JumpOut; 
    
    output reg [31:0] PCValueOut;
    output reg [31:0] ReadData1Out;
    output reg [31:0] ReadData2Out;
    output reg [31:0] SignExtendOffsetOut;
    output reg [4:0] RDFieldOut; 
    output reg [4:0] RTFieldOut;
    output reg [31:0] InstructionOut; 
    
    /* Control Signals*/
    input Reset; 
    //input Stall; 
    input BranchIn; 
    input MemReadIn; 
    input MemWriteIn; 
    input RegWriteIn; 
    input MemToRegIn; 
    input RegDstIn; 
    input [4:0] ALUOpIn; 
    input ALUSrcIn;
    input HiLoALUControlIn, AddToHiIn, AddToLoIn, MoveToHiIn, HiLoSelIn;
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
    
    input [31:0] PCValueIn;
    input [31:0] ReadData1In;
    input [31:0] ReadData2In;
    input [31:0] SignExtendOffsetIn;
    input [4:0] RDFieldIn; 
    input [4:0] RTFieldIn;
    input [31:0] InstructionIn; 
    input Clk; 
        
    always @ (posedge Clk)
        begin
        
        if (Reset == 1) begin
            BranchOut <= 0; 
            MemReadOut <= 0; 
            MemWriteOut <= 0; 
            RegWriteOut <= 0; 
            MemToRegOut <= 0;
            RegDstOut <= 0; 
            ALUOpOut <= 0; 
            ALUSrcOut <= 0;
            HiLoALUControlOut <= 0; 
            AddToHiOut <= 0; 
            AddToLoOut <= 0; 
            MoveToHiOut <= 0; 
            HiLoSelOut <= 0; 
            AltALUSrc1Out <= 0; 
            ZeroALUSrc1Out <= 0;
            ZeroALUSrc2Out <= 0;
            SwapOut <= 0;
            ALUHiLoSelectOut <= 0; 
            MOVNOut <= 0; 
            MOVZOut <= 0; 
            StraightToHiOut <= 0; 
            StraightToLoOut <= 0;
            LoadStoreByteOut <= 0;
            LoadStoreHalfOut <= 0;
            NotZeroOut <= 0; 
            JumpOut <= 0;
            
            PCValueOut <= 0; 
            ReadData1Out <= 0;
            ReadData2Out <= 0;
            SignExtendOffsetOut <= 0;
            RDFieldOut <= 0; 
            RTFieldOut <= 0;
            InstructionOut <= 0; 
        end
        else begin
            BranchOut <= BranchIn; 
            MemReadOut <= MemReadIn; 
            MemWriteOut <= MemWriteIn; 
            RegWriteOut <= RegWriteIn; 
            MemToRegOut <= MemToRegIn;
            RegDstOut <= RegDstIn; 
            ALUOpOut <= ALUOpIn; 
            ALUSrcOut <= ALUSrcIn;
            HiLoALUControlOut <= HiLoALUControlIn; 
            AddToHiOut <= AddToHiIn; 
            AddToLoOut <= AddToLoIn; 
            MoveToHiOut <= MoveToHiIn; 
            HiLoSelOut <= HiLoSelIn; 
            AltALUSrc1Out <= AltALUSrc1In; 
            ZeroALUSrc1Out <= ZeroALUSrc1In;
            ZeroALUSrc2Out <= ZeroALUSrc2In;
            SwapOut <= SwapIn;
            ALUHiLoSelectOut <= ALUHiLoSelectIn; 
            MOVNOut <= MOVNIn; 
            MOVZOut <= MOVZIn; 
            StraightToHiOut <= StraightToHiIn; 
            StraightToLoOut <= StraightToLoIn;
            LoadStoreByteOut <= LoadStoreByteIn;
            LoadStoreHalfOut <= LoadStoreHalfIn;
            NotZeroOut <= NotZeroIn; 
            JumpOut <= JumpIn;
            
            PCValueOut <= PCValueIn; 
            ReadData1Out <= ReadData1In;
            ReadData2Out <= ReadData2In;
            SignExtendOffsetOut <= SignExtendOffsetIn;
            RDFieldOut <= RDFieldIn; 
            RTFieldOut <= RTFieldIn;
            InstructionOut <= InstructionIn; 
        end
    end
endmodule
