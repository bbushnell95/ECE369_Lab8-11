`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
//
// Student(s) Name and Last Name:   Derek McMullen
//                                  Brett Bushnell
// Module - EX_Mem_PipeReg.v
// Description - Implements a register between ID and EX stage of processor
////////////////////////////////////////////////////////////////////////////////

module ID_EX_PipeReg(BranchIn, MemReadIn, MemWriteIn, RegWriteIn, MemToRegIn, RegDstIn, ALUOpIn, ALUSrcIn, HiLoALUControlIn, AddToHiIn, AddToLoIn, MoveToHiIn, MoveToLoIn, HiLoSelIn, AltALUSrc1In, ZeroALUSrc1In, SwapIn, ALUHiLoSelectIn, PCValueIn, ReadData1In, ReadData2In, SignExtendOffsetIn, RDFieldIn, RTFieldIn, Clk, BranchOut, MemReadOut, MemWriteOut, RegWriteOut, MemToRegOut, RegDstOut, ALUOpOut, ALUSrcOut, HiLoALUControlOut, AddToHiOut, AddToLoOut, MoveToHiOut, MoveToLoOut, HiLoSelOut, AltALUSrc1Out, ZeroALUSrc1Out, SwapOut, ALUHiLoSelectOut, PCValueOut, ReadData1Out, ReadData2Out, SignExtendOffsetOut, RDFieldOut, RTFieldOut);

	/* Control Signals*/
    output reg BranchOut; 
    output reg MemReadOut; 
    output reg MemWriteOut; 
    output reg RegWriteOut; 
    output reg MemToRegOut;
    output reg RegDstOut; 
    output reg [3:0] ALUOpOut; 
    output reg ALUSrcOut;
    output reg HiLoALUControlOut, AddToHiOut, AddToLoOut, MoveToHiOut, MoveToLoOut, HiLoSelOut;
    output reg AltALUSrc1Out; 
    output reg ZeroALUSrc1Out;
    output reg SwapOut;
    output reg ALUHiLoSelectOut; 
    
    
    output reg [31:0] PCValueOut;
    output reg [31:0] ReadData1Out;
    output reg [31:0] ReadData2Out;
    output reg [31:0] SignExtendOffsetOut;
    output reg [4:0] RDFieldOut; 
    output reg [4:0] RTFieldOut;
    
    /* Control Signals*/
    input BranchIn; 
    input MemReadIn; 
    input MemWriteIn; 
    input RegWriteIn; 
    input MemToRegIn; 
    input RegDstIn; 
    input [3:0] ALUOpIn; 
    input ALUSrcIn;
    input HiLoALUControlIn, AddToHiIn, AddToLoIn, MoveToHiIn, MoveToLoIn, HiLoSelIn;
    input AltALUSrc1In; 
    input ZeroALUSrc1In;
    input SwapIn;
    input ALUHiLoSelectIn; 
    
    input [31:0] PCValueIn;
    input [31:0] ReadData1In;
    input [31:0] ReadData2In;
    input [31:0] SignExtendOffsetIn;
    input [4:0] RDFieldIn; 
    input [4:0] RTFieldIn;
    input Clk; 
        
    always @ (posedge Clk)
        begin
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
        MoveToLoOut <= MoveToLoIn; 
        HiLoSelOut <= HiLoSelIn; 
        AltALUSrc1Out <= AltALUSrc1In; 
        ZeroALUSrc1Out <= ZeroALUSrc1In;
        SwapOut <= SwapIn;
        ALUHiLoSelectOut <= ALUHiLoSelectIn; 
        
        PCValueOut <= PCValueIn; 
        ReadData1Out <= ReadData1In;
        ReadData2Out <= ReadData2In;
        SignExtendOffsetOut <= SignExtendOffsetIn;
        RDFieldOut <= RDFieldIn; 
        RTFieldOut <= RTFieldIn;
        end

endmodule
