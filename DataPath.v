`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Team Members:
// Overall percent effort of each team member:
// Brett Bushnell -- 50%
// Derek Mcmullen -- 50% 
//
////////////////////////////////////////////////////////////////////////////////

module DataPath(Reset, Clk, WriteData, ProgramCount, HIRegOutput, LORegOutput);
	
	input Reset, Clk; 
	
	output [31:0] WriteData; 
	output [31:0] ProgramCount;
	output [31:0] HIRegOutput; 
	output [31:0] LORegOutput;
	
	// MEM to IFU
	wire [31:0]MEM_IFU_BranchTargetAddress; 
	wire MEM_IFU_PCSrc; 
	
	// IFU to IFIDPipeReg wires
	wire [31:0]IFU_IFID_PCValue, IFU_IFID_Instruction;  
	
	// IFIDPipeReg to IDU wires
	wire [31:0]IFID_IDU_PCValue, IFID_IDU_Instruction;
	
	// WB to IDU wires
	wire [4:0]WB_IDU_DestinationReg; 
	wire [31:0]WB_IDU_WriteData;
	wire WB_IDU_RegWrite;
	
	// IDU to IDEXPipeReg wires
	wire [31:0]IDU_IDEX_PCValue, IDU_IDEX_ReadData1, IDU_IDEX_ReadData2, IDU_IDEX_SignExtendOffset;
	wire [4:0]IDU_IDEX_RTField, IDU_IDEX_RDField;
	wire IDU_IDEX_Branch, IDU_IDEX_MemRead, IDU_IDEX_MemWrite, IDU_IDEX_RegWrite, IDU_IDEX_MemToReg, IDU_IDEX_RegDst, IDU_IDEX_ALUSrc, IDU_IDEX_HiLoALUControl, IDU_IDEX_AddToHi, IDU_IDEX_AddToLo, IDU_IDEX_MoveToHi, IDU_IDEX_HiLoSel, IDU_IDEX_AltALUSrc1, IDU_IDEX_ZeroALUSrc1, IDU_IDEX_ZeroALUSrc2, IDU_IDEX_Swap, IDU_IDEX_ALUHiLoSelect, IDU_IDEX_MOVN, IDU_IDEX_MOVZ; 
	wire [4:0]IDU_IDEX_ALUOp;
	wire IDU_IDEX_StraightToHi, IDU_IDEX_StraightToLo;
	
	// IDEX to EXU wires
	wire IDEX_EXU_Branch, IDEX_EXU_MemRead, IDEX_EXU_MemWrite, IDEX_EXU_RegWrite, IDEX_EXU_MemToReg, IDEX_EXU_RegDst, IDEX_EXU_ALUSrc, IDEX_EXU_HiLoALUControl, IDEX_EXU_AddToHi, IDEX_EXU_AddToLo, IDEX_EXU_MoveToHi, IDEX_EXU_HiLoSel, IDEX_EXU_AltALUSrc1, IDEX_EXU_ZeroALUSrc1, IDEX_EXU_ZeroALUSrc2, IDEX_EXU_Swap, IDEX_EXU_ALUHiLoSelect, IDEX_EXU_MOVN, IDEX_EXU_MOVZ;
	wire [31:0] IDEX_EXU_PCValue, IDEX_EXU_ReadData1, IDEX_EXU_ReadData2, IDEX_EXU_SignExtendOffset;
	wire [4:0] IDEX_EXU_RDField, IDEX_EXU_RTField;
	wire [4:0] IDEX_EXU_ALUOp;
	wire IDEX_EXU_StraightToHi, IDEX_EXU_StraightToLo;
	
	// EXU to EXMEMPipeReg wires
	wire EXU_EXMEM_Branch, EXU_EXMEM_MemRead, EXU_EXMEM_MemWrite, EXU_EXMEM_RegWrite, EXU_EXMEM_MemToReg, EXU_EXMEM_Zero;
	wire [31:0]EXU_EXMEM_BranchTargetAddress, EXU_EXMEM_ExecuteData, EXU_EXMEM_MemoryWriteData;
	wire [4:0]EXU_EXMEM_DestinationReg;
	
	// EXMEM to MEM wires
	wire EXMEM_MEM_Branch, EXMEM_MEM_MemRead, EXMEM_MEM_MemWrite, EXMEM_MEM_RegWrite, EXMEM_MEM_MemToReg, EXMEM_MEM_BranchTargetAddress, EXMEM_MEM_Zero;
	wire [31:0] EXMEM_MEM_ALU, EXMEM_MEM_MemoryWriteData;
	wire [4:0] EXMEM_MEM_DestinationReg;
	
	// MEM to MEMWBPipeReg wires
	wire MEM_MEMWB_RegWrite, MEM_MEMWB_MemToReg; 
	wire [31:0] MEM_MEMWB_ALU, MEM_MEMWB_DataMem;
	wire [4:0] MEM_MEMWB_DestinationReg;
	
	//MEMWB to WB wires
	wire MEMWB_WB_RegWrite, MEMWB_WB_MemToReg;
	wire [31:0] MEMWB_WB_ALU, MEMWB_WB_DataMem;
	wire [4:0] MEMWB_WB_DestinationReg;
	
	// EXU Wires
	wire [31:0] EXU_HIRegOutput, EXU_LORegOutput;
	
    InstructionFetchUnit InstructionFetchUnit_1(Reset, Clk, MEM_IFU_PCSrc, MEM_IFU_BranchTargetAddress, IFU_IFID_Instruction, IFU_IFID_PCValue);
    IF_ID_PipeReg IF_ID_PipeReg_1(IFU_IFID_PCValue, IFU_IFID_Instruction, Clk, IFID_IDU_PCValue, IFID_IDU_Instruction);
    InstructionDecodeUnit InstructionDecodeUnit_1(IFID_IDU_Instruction, IFID_IDU_PCValue, WB_IDU_DestinationReg, WB_IDU_WriteData, WB_IDU_RegWrite, Reset, Clk, IDU_IDEX_Branch, IDU_IDEX_MemRead, IDU_IDEX_MemWrite, IDU_IDEX_RegWrite, IDU_IDEX_MemToReg, IDU_IDEX_RegDst, IDU_IDEX_ALUOp, IDU_IDEX_ALUSrc, IDU_IDEX_HiLoALUControl, IDU_IDEX_AddToHi, IDU_IDEX_AddToLo, IDU_IDEX_MoveToHi, IDU_IDEX_HiLoSel, IDU_IDEX_AltALUSrc1, IDU_IDEX_ZeroALUSrc1, IDU_IDEX_ZeroALUSrc2, IDU_IDEX_Swap, IDU_IDEX_ALUHiLoSelect, IDU_IDEX_MOVN, IDU_IDEX_MOVZ, IDU_IDEX_StraightToHi, IDU_IDEX_StraightToLo,IDU_IDEX_PCValue, IDU_IDEX_ReadData1, IDU_IDEX_ReadData2, IDU_IDEX_SignExtendOffset, IDU_IDEX_RDField, IDU_IDEX_RTField);
    ID_EX_PipeReg ID_EX_PipeReg_1(IDU_IDEX_Branch, IDU_IDEX_MemRead, IDU_IDEX_MemWrite, IDU_IDEX_RegWrite, IDU_IDEX_MemToReg, IDU_IDEX_RegDst, IDU_IDEX_ALUOp, IDU_IDEX_ALUSrc, IDU_IDEX_HiLoALUControl, IDU_IDEX_AddToHi, IDU_IDEX_AddToLo, IDU_IDEX_MoveToHi, IDU_IDEX_HiLoSel, IDU_IDEX_AltALUSrc1, IDU_IDEX_ZeroALUSrc1, IDU_IDEX_ZeroALUSrc2, IDU_IDEX_Swap, IDU_IDEX_ALUHiLoSelect, IDU_IDEX_MOVN, IDU_IDEX_MOVZ, IDU_IDEX_StraightToHi, IDU_IDEX_StraightToLo, IDU_IDEX_PCValue, IDU_IDEX_ReadData1, IDU_IDEX_ReadData2, IDU_IDEX_SignExtendOffset, IDU_IDEX_RDField, IDU_IDEX_RTField, Clk, IDEX_EXU_Branch, IDEX_EXU_MemRead, IDEX_EXU_MemWrite, IDEX_EXU_RegWrite, IDEX_EXU_MemToReg, IDEX_EXU_RegDst, IDEX_EXU_ALUOp, IDEX_EXU_ALUSrc, IDEX_EXU_HiLoALUControl, IDEX_EXU_AddToHi, IDEX_EXU_AddToLo, IDEX_EXU_MoveToHi, IDEX_EXU_HiLoSel, IDEX_EXU_AltALUSrc1, IDEX_EXU_ZeroALUSrc1, IDEX_EXU_ZeroALUSrc2, IDEX_EXU_Swap, IDEX_EXU_ALUHiLoSelect, IDEX_EXU_MOVN, IDEX_EXU_MOVZ, IDEX_EXU_StraightToHi, IDEX_EXU_StraightToLo, IDEX_EXU_PCValue, IDEX_EXU_ReadData1, IDEX_EXU_ReadData2, IDEX_EXU_SignExtendOffset, IDEX_EXU_RDField, IDEX_EXU_RTField);
    ExecuteUnit ExecuteUnit_1(Reset, Clk, IDEX_EXU_Branch, IDEX_EXU_MemRead, IDEX_EXU_MemWrite, IDEX_EXU_RegWrite, IDEX_EXU_MemToReg, IDEX_EXU_RegDst, IDEX_EXU_ALUOp, IDEX_EXU_ALUSrc, IDEX_EXU_AltALUSrc1, IDEX_EXU_ZeroALUSrc1, IDEX_EXU_ZeroALUSrc2, IDEX_EXU_Swap, IDEX_EXU_ALUHiLoSelect, IDEX_EXU_MOVN, IDEX_EXU_MOVZ, IDEX_EXU_StraightToHi, IDEX_EXU_StraightToLo, IDEX_EXU_PCValue, IDEX_EXU_ReadData1, IDEX_EXU_ReadData2, IDEX_EXU_SignExtendOffset, IDEX_EXU_RDField, IDEX_EXU_RTField, IDEX_EXU_HiLoALUControl, IDEX_EXU_AddToHi, IDEX_EXU_AddToLo, IDEX_EXU_MoveToHi, IDEX_EXU_HiLoSel, EXU_EXMEM_Branch, EXU_EXMEM_MemRead, EXU_EXMEM_MemWrite, EXU_EXMEM_RegWrite, EXU_EXMEM_MemToReg, EXU_EXMEM_BranchTargetAddress, EXU_EXMEM_ExecuteData, EXU_EXMEM_Zero, EXU_EXMEM_DestinationReg, EXU_EXMEM_MemoryWriteData, EXU_HIRegOutput, EXU_LORegOutput);	
    EX_Mem_PipeReg EX_Mem_PipeReg_1(EXU_EXMEM_Branch, EXU_EXMEM_MemRead, EXU_EXMEM_MemWrite, EXU_EXMEM_RegWrite, EXU_EXMEM_MemToReg, EXU_EXMEM_BranchTargetAddress, EXU_EXMEM_ExecuteData, EXU_EXMEM_Zero, EXU_EXMEM_MemoryWriteData, EXU_EXMEM_DestinationReg, Clk, EXMEM_MEM_Branch, EXMEM_MEM_MemRead, EXMEM_MEM_MemWrite, EXMEM_MEM_RegWrite, EXMEM_MEM_MemToReg, EXMEM_MEM_BranchTargetAddress, EXMEM_MEM_ALU, EXMEM_MEM_Zero, EXMEM_MEM_MemoryWriteData, EXMEM_MEM_DestinationReg);
    MemoryUnit MemoryUnit_1(Clk, EXMEM_MEM_Branch, EXMEM_MEM_MemRead, EXMEM_MEM_MemWrite, EXMEM_MEM_RegWrite, EXMEM_MEM_MemToReg, EXMEM_MEM_BranchTargetAddress, EXMEM_MEM_ALU, EXMEM_MEM_Zero, EXMEM_MEM_MemoryWriteData, EXMEM_MEM_DestinationReg, MEM_MEMWB_RegWrite, MEM_MEMWB_MemToReg, MEM_IFU_PCSrc, MEM_IFU_BranchTargetAddress, MEM_MEMWB_ALU, MEM_MEMWB_DataMem, MEM_MEMWB_DestinationReg);
    Mem_WB_PipeReg Mem_WB_PipeReg_1(MEM_MEMWB_RegWrite, MEM_MEMWB_MemToReg, MEM_MEMWB_ALU, MEM_MEMWB_DataMem, MEM_MEMWB_DestinationReg, Clk, MEMWB_WB_RegWrite, MEMWB_WB_MemToReg, MEMWB_WB_ALU, MEMWB_WB_DataMem, MEMWB_WB_DestinationReg);
    WriteBackUnit WriteBackUnit_1(MEMWB_WB_RegWrite, MEMWB_WB_MemToReg, MEMWB_WB_ALU, MEMWB_WB_DataMem, MEMWB_WB_DestinationReg, WB_IDU_RegWrite, WB_IDU_WriteData, WB_IDU_DestinationReg);    
	
    assign ProgramCount = IFU_IFID_PCValue - 4;
    assign WriteData = WB_IDU_WriteData; 
    assign HIRegOutput = EXU_HIRegOutput; 
    assign LORegOutput = EXU_LORegOutput;
    
endmodule

