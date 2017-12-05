`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Team Members:
// Overall percent effort of each team member:
// Brett Bushnell -- 50%
// Derek Mcmullen -- 50% 
//
////////////////////////////////////////////////////////////////////////////////
//module DataPath(Reset, Clk, ProgramCount, Current_Min, XOut (NumberA), YOut(NumberB));

module DataPath(Reset, Clk, ProgramCount, CurrentMin, XOut, YOut);
	
	input Reset, Clk; 
	 
	output [31:0] ProgramCount;
    output [31:0] CurrentMin;
    output [31:0] XOut, YOut;
	// MEM to IFU
	wire [31:0]MEM_IFU_BranchTargetAddress; 
	wire MEM_IFU_PCSrc; 
	
	// IFU to IFIDPipeReg wires
	wire [31:0]IFU_IFID_PCValue, IFU_IFID_Instruction;  
	
	// IFIDPipeReg to IDU wires
	wire [31:0]IFID_IDU_PCValue, IFID_IDU_Instruction;
	
	// IDU to IFU wires
	wire [31:0] IDU_IFU_JumpPCValue; 
	
	// WB to IDU wires
	wire [4:0]WB_IDU_DestinationReg; 
	wire [31:0]WB_IDU_WriteData;
	wire WB_IDU_RegWrite;
	
	// IDU to IDEXPipeReg wires
	wire [31:0]IDU_IDEX_PCValue, IDU_IDEX_ReadData1, IDU_IDEX_ReadData2, IDU_IDEX_SignExtendOffset;
	wire [4:0]IDU_IDEX_RTField, IDU_IDEX_RDField;
	wire [31:0] IDU_IDEX_Instruction; 
	wire IDU_IDEX_Branch, IDU_IDEX_MemRead, IDU_IDEX_MemWrite, IDU_IDEX_RegWrite, IDU_IDEX_MemToReg, IDU_IDEX_RegDst, IDU_IDEX_ALUSrc, IDU_IDEX_HiLoALUControl, IDU_IDEX_AddToHi, IDU_IDEX_AddToLo, IDU_IDEX_MoveToHi, IDU_IDEX_HiLoSel, IDU_IDEX_AltALUSrc1, IDU_IDEX_ZeroALUSrc1, IDU_IDEX_ZeroALUSrc2, IDU_IDEX_Swap, IDU_IDEX_ALUHiLoSelect, IDU_IDEX_MOVN, IDU_IDEX_MOVZ; 
	wire [4:0]IDU_IDEX_ALUOp;
	wire IDU_IDEX_StraightToHi, IDU_IDEX_StraightToLo;
	wire IDU_IDEX_LoadStoreByte, IDU_IDEX_LoadStoreHalf;
	wire IDU_IDEX_NotZero;
	wire [1:0] IDU_IDEX_Jump; 
	
	// IDEX to EXU wires
	wire IDEX_EXU_Branch, IDEX_EXU_MemRead, IDEX_EXU_MemWrite, IDEX_EXU_RegWrite, IDEX_EXU_MemToReg, IDEX_EXU_RegDst, IDEX_EXU_ALUSrc, IDEX_EXU_HiLoALUControl, IDEX_EXU_AddToHi, IDEX_EXU_AddToLo, IDEX_EXU_MoveToHi, IDEX_EXU_HiLoSel, IDEX_EXU_AltALUSrc1, IDEX_EXU_ZeroALUSrc1, IDEX_EXU_ZeroALUSrc2, IDEX_EXU_Swap, IDEX_EXU_ALUHiLoSelect, IDEX_EXU_MOVN, IDEX_EXU_MOVZ;
	wire [31:0] IDEX_EXU_PCValue, IDEX_EXU_ReadData1, IDEX_EXU_ReadData2, IDEX_EXU_SignExtendOffset;
	wire [4:0] IDEX_EXU_RDField, IDEX_EXU_RTField;
	wire [31:0] IDEX_EXU_Instruction; 
	wire [4:0] IDEX_EXU_ALUOp;
	wire IDEX_EXU_StraightToHi, IDEX_EXU_StraightToLo;
	wire IDEX_EXU_LoadStoreByte, IDEX_EXU_LoadStoreHalf;
	wire IDEX_EXU_NotZero;
    wire [1:0] IDEX_EXU_Jump; 
	
	// EXU to EXMEMPipeReg wires
	wire EXU_EXMEM_Branch, EXU_EXMEM_MemRead, EXU_EXMEM_MemWrite, EXU_EXMEM_RegWrite, EXU_EXMEM_MemToReg, EXU_EXMEM_Zero;
	wire [31:0]EXU_EXMEM_BranchTargetAddress, EXU_EXMEM_ExecuteData, EXU_EXMEM_MemoryWriteData, EXU_EXMEM_PCValueForJAL;
	wire [31:0]EXU_EXMEM_Instruction; 
	wire [4:0]EXU_EXMEM_DestinationReg;
	wire EXU_EXMEM_LoadStoreByte, EXU_EXMEM_LoadStoreHalf;
	wire EXU_EXMEM_NotZero;
    wire [1:0] EXU_EXMEM_Jump; 
	
	// EXMEM to MEM wires
	wire EXMEM_MEM_Branch, EXMEM_MEM_MemRead, EXMEM_MEM_MemWrite, EXMEM_MEM_RegWrite, EXMEM_MEM_MemToReg, EXMEM_MEM_Zero;
	wire [31:0] EXMEM_MEM_BranchTargetAddress, EXMEM_MEM_ALU, EXMEM_MEM_MemoryWriteData, EXMEM_MEM_PCValueForJAL;
	wire [31:0] EXMEM_MEM_Instruction;
	wire [4:0] EXMEM_MEM_DestinationReg;
	wire EXMEM_MEM_LoadStoreByte, EXMEM_MEM_LoadStoreHalf;
	wire EXMEM_MEM_NotZero;
	wire [1:0] EXMEM_MEM_Jump;
	
	// MEM to MEMWBPipeReg wires
	wire MEM_MEMWB_RegWrite, MEM_MEMWB_MemToReg; 
	wire [31:0] MEM_MEMWB_ALU, MEM_MEMWB_DataMem, MEM_MEMWB_PCValueForJAL;
	wire [4:0] MEM_MEMWB_DestinationReg;
	wire [1:0] MEM_MEMWB_Jump; 
	
	// MEMWB to WB wires
	wire MEMWB_WB_RegWrite, MEMWB_WB_MemToReg;
	wire [31:0] MEMWB_WB_ALU, MEMWB_WB_DataMem, MEMWB_WB_PCValueForJAL;
	wire [4:0] MEMWB_WB_DestinationReg;
	wire [1:0] MEMWB_WB_Jump;
	
	// EXU Wires
	wire [31:0] EXU_HIRegOutput, EXU_LORegOutput;
	
	// ForwardingUnit Wires
	wire [31:0] IDU_InstructionOut; 
	wire EXU_ReadData1MEMOverwrite, EXU_ReadData2MEMOverwrite, EXU_ReadData1WBOverwrite, EXU_ReadData2WBOverwrite, IDU_ReadData1Overwrite, IDU_ReadData2Overwrite, IDU_ReadData1WBOverwrite, IDU_ReadData2WBOverwrite;
	
	// HazardUnit Wires
	wire Stall; 
	
	// Flushing wires
	wire IF_ID_Flush, ID_EX_Flush, EX_MEM_Flush;
	
	//Outputs for VBSM
	wire [31:0] XOutWire, YOutWire, CurrentMinWire;
		
    InstructionFetchUnit InstructionFetchUnit_1(Reset, Stall, Clk, MEM_IFU_PCSrc, IDU_IDEX_Jump, MEM_IFU_BranchTargetAddress, IDU_IFU_JumpPCValue, IDU_IDEX_ReadData1, IFU_IFID_Instruction, IFU_IFID_PCValue);
    IF_ID_PipeReg IF_ID_PipeReg_1(IF_ID_Flush, Stall, IFU_IFID_PCValue, IFU_IFID_Instruction, Clk, IFID_IDU_PCValue, IFID_IDU_Instruction);
    InstructionDecodeUnit InstructionDecodeUnit_1(IFID_IDU_Instruction, IFID_IDU_PCValue, WB_IDU_DestinationReg, WB_IDU_WriteData, WB_IDU_RegWrite, IDU_ReadData1Overwrite, IDU_ReadData2Overwrite, IDU_ReadData1WBOverwrite, IDU_ReadData2WBOverwrite, EXMEM_MEM_ALU, Reset, Clk, IDU_IDEX_Branch, IDU_IDEX_MemRead, IDU_IDEX_MemWrite, IDU_IDEX_RegWrite, IDU_IDEX_MemToReg, IDU_IDEX_RegDst, IDU_IDEX_ALUOp, IDU_IDEX_ALUSrc, IDU_IDEX_HiLoALUControl, IDU_IDEX_AddToHi, IDU_IDEX_AddToLo, IDU_IDEX_MoveToHi, IDU_IDEX_HiLoSel, IDU_IDEX_AltALUSrc1, IDU_IDEX_ZeroALUSrc1, IDU_IDEX_ZeroALUSrc2, IDU_IDEX_Swap, IDU_IDEX_ALUHiLoSelect, IDU_IDEX_MOVN, IDU_IDEX_MOVZ, IDU_IDEX_StraightToHi, IDU_IDEX_StraightToLo, IDU_IDEX_LoadStoreByte, IDU_IDEX_LoadStoreHalf, IDU_IDEX_NotZero, IDU_IDEX_Jump, IDU_IDEX_PCValue, IDU_IFU_JumpPCValue, IDU_IDEX_ReadData1, IDU_IDEX_ReadData2, IDU_IDEX_SignExtendOffset, IDU_IDEX_RDField, IDU_IDEX_RTField, IDU_IDEX_Instruction, XOutWire, YOutWire, CurrentMinWire);
    ID_EX_PipeReg ID_EX_PipeReg_1(ID_EX_Flush, IDU_IDEX_Branch, IDU_IDEX_MemRead, IDU_IDEX_MemWrite, IDU_IDEX_RegWrite, IDU_IDEX_MemToReg, IDU_IDEX_RegDst, IDU_IDEX_ALUOp, IDU_IDEX_ALUSrc, IDU_IDEX_HiLoALUControl, IDU_IDEX_AddToHi, IDU_IDEX_AddToLo, IDU_IDEX_MoveToHi, IDU_IDEX_HiLoSel, IDU_IDEX_AltALUSrc1, IDU_IDEX_ZeroALUSrc1, IDU_IDEX_ZeroALUSrc2, IDU_IDEX_Swap, IDU_IDEX_ALUHiLoSelect, IDU_IDEX_MOVN, IDU_IDEX_MOVZ, IDU_IDEX_StraightToHi, IDU_IDEX_StraightToLo, IDU_IDEX_LoadStoreByte, IDU_IDEX_LoadStoreHalf, IDU_IDEX_NotZero, IDU_IDEX_Jump, IDU_IDEX_PCValue, IDU_IDEX_ReadData1, IDU_IDEX_ReadData2, IDU_IDEX_SignExtendOffset, IDU_IDEX_RDField, IDU_IDEX_RTField, IDU_IDEX_Instruction, Clk, IDEX_EXU_Branch, IDEX_EXU_MemRead, IDEX_EXU_MemWrite, IDEX_EXU_RegWrite, IDEX_EXU_MemToReg, IDEX_EXU_RegDst, IDEX_EXU_ALUOp, IDEX_EXU_ALUSrc, IDEX_EXU_HiLoALUControl, IDEX_EXU_AddToHi, IDEX_EXU_AddToLo, IDEX_EXU_MoveToHi, IDEX_EXU_HiLoSel, IDEX_EXU_AltALUSrc1, IDEX_EXU_ZeroALUSrc1, IDEX_EXU_ZeroALUSrc2, IDEX_EXU_Swap, IDEX_EXU_ALUHiLoSelect, IDEX_EXU_MOVN, IDEX_EXU_MOVZ, IDEX_EXU_StraightToHi, IDEX_EXU_StraightToLo, IDEX_EXU_LoadStoreByte, IDEX_EXU_LoadStoreHalf, IDEX_EXU_NotZero, IDEX_EXU_Jump, IDEX_EXU_PCValue, IDEX_EXU_ReadData1, IDEX_EXU_ReadData2, IDEX_EXU_SignExtendOffset, IDEX_EXU_RDField, IDEX_EXU_RTField, IDEX_EXU_Instruction);
    ExecuteUnit ExecuteUnit_1(Reset, Clk, IDEX_EXU_Branch, IDEX_EXU_MemRead, IDEX_EXU_MemWrite, IDEX_EXU_RegWrite, IDEX_EXU_MemToReg, IDEX_EXU_RegDst, IDEX_EXU_ALUOp, IDEX_EXU_ALUSrc, IDEX_EXU_AltALUSrc1, IDEX_EXU_ZeroALUSrc1, IDEX_EXU_ZeroALUSrc2, IDEX_EXU_Swap, IDEX_EXU_ALUHiLoSelect, IDEX_EXU_MOVN, IDEX_EXU_MOVZ, IDEX_EXU_StraightToHi, IDEX_EXU_StraightToLo, IDEX_EXU_LoadStoreByte, IDEX_EXU_LoadStoreHalf, IDEX_EXU_NotZero, IDEX_EXU_Jump, EXU_ReadData1MEMOverwrite, EXU_ReadData2MEMOverwrite, EXU_ReadData1WBOverwrite, EXU_ReadData2WBOverwrite,IDEX_EXU_PCValue, IDEX_EXU_ReadData1, IDEX_EXU_ReadData2, IDEX_EXU_SignExtendOffset, IDEX_EXU_RDField, IDEX_EXU_RTField, IDEX_EXU_Instruction, EXMEM_MEM_ALU, WB_IDU_WriteData, IDEX_EXU_HiLoALUControl, IDEX_EXU_AddToHi, IDEX_EXU_AddToLo, IDEX_EXU_MoveToHi, IDEX_EXU_HiLoSel, EXU_EXMEM_Branch, EXU_EXMEM_MemRead, EXU_EXMEM_MemWrite, EXU_EXMEM_RegWrite, EXU_EXMEM_MemToReg, EXU_EXMEM_LoadStoreByte, EXU_EXMEM_LoadStoreHalf, EXU_EXMEM_NotZero, EXU_EXMEM_Jump, EXU_EXMEM_BranchTargetAddress, EXU_EXMEM_ExecuteData, EXU_EXMEM_Zero, EXU_EXMEM_DestinationReg, EXU_EXMEM_MemoryWriteData, EXU_HIRegOutput, EXU_LORegOutput, EXU_EXMEM_PCValueForJAL, EXU_EXMEM_Instruction);	
    EX_Mem_PipeReg EX_Mem_PipeReg_1(EX_MEM_Flush, EXU_EXMEM_Branch, EXU_EXMEM_MemRead, EXU_EXMEM_MemWrite, EXU_EXMEM_RegWrite, EXU_EXMEM_MemToReg, EXU_EXMEM_LoadStoreByte, EXU_EXMEM_LoadStoreHalf, EXU_EXMEM_NotZero, EXU_EXMEM_Jump, EXU_EXMEM_BranchTargetAddress, EXU_EXMEM_ExecuteData, EXU_EXMEM_Zero, EXU_EXMEM_MemoryWriteData, EXU_EXMEM_DestinationReg, EXU_EXMEM_PCValueForJAL, EXU_EXMEM_Instruction, Clk, EXMEM_MEM_Branch, EXMEM_MEM_MemRead, EXMEM_MEM_MemWrite, EXMEM_MEM_RegWrite, EXMEM_MEM_MemToReg, EXMEM_MEM_BranchTargetAddress, EXMEM_MEM_ALU, EXMEM_MEM_Zero, EXMEM_MEM_MemoryWriteData, EXMEM_MEM_DestinationReg, EXMEM_MEM_PCValueForJAL, EXMEM_MEM_LoadStoreByte, EXMEM_MEM_LoadStoreHalf, EXMEM_MEM_NotZero, EXMEM_MEM_Jump, EXMEM_MEM_Instruction);
    MemoryUnit MemoryUnit_1(Clk, EXMEM_MEM_Branch, EXMEM_MEM_MemRead, EXMEM_MEM_MemWrite, EXMEM_MEM_RegWrite, EXMEM_MEM_MemToReg, EXMEM_MEM_LoadStoreByte, EXMEM_MEM_LoadStoreHalf, EXMEM_MEM_BranchTargetAddress, EXMEM_MEM_NotZero, EXMEM_MEM_Jump, EXMEM_MEM_ALU, EXMEM_MEM_Zero, EXMEM_MEM_MemoryWriteData, EXMEM_MEM_DestinationReg, EXMEM_MEM_PCValueForJAL, MEM_MEMWB_RegWrite, MEM_MEMWB_MemToReg, MEM_IFU_PCSrc, MEM_MEMWB_Jump, MEM_IFU_BranchTargetAddress, MEM_MEMWB_ALU, MEM_MEMWB_DataMem, MEM_MEMWB_DestinationReg, MEM_MEMWB_PCValueForJAL);

    Mem_WB_PipeReg Mem_WB_PipeReg_1(MEM_MEMWB_RegWrite, MEM_MEMWB_MemToReg, MEM_MEMWB_Jump, MEM_MEMWB_ALU, MEM_MEMWB_DataMem, MEM_MEMWB_DestinationReg, MEM_MEMWB_PCValueForJAL, Clk, MEMWB_WB_RegWrite, MEMWB_WB_MemToReg, MEMWB_WB_Jump, MEMWB_WB_ALU, MEMWB_WB_DataMem, MEMWB_WB_DestinationReg, MEMWB_WB_PCValueForJAL);
    WriteBackUnit WriteBackUnit_1(MEMWB_WB_RegWrite, MEMWB_WB_MemToReg, MEMWB_WB_Jump, MEMWB_WB_ALU, MEMWB_WB_DataMem, MEMWB_WB_DestinationReg, MEMWB_WB_PCValueForJAL, WB_IDU_RegWrite, WB_IDU_WriteData, WB_IDU_DestinationReg);    
	
	ForwardingUnit ForwardingUnit_1(IDU_IDEX_Instruction[25:21], IDU_IDEX_Instruction[20:16], IDEX_EXU_Instruction[25:21], IDEX_EXU_Instruction[20:16], EXMEM_MEM_DestinationReg, EXMEM_MEM_RegWrite, WB_IDU_DestinationReg, MEMWB_WB_RegWrite, EXU_ReadData1MEMOverwrite, EXU_ReadData2MEMOverwrite, EXU_ReadData1WBOverwrite, EXU_ReadData2WBOverwrite, IDU_ReadData1Overwrite, IDU_ReadData2Overwrite, IDU_ReadData1WBOverwrite, IDU_ReadData2WBOverwrite);
	HazardDetectionUnit HazardDetectionUnit(Reset, IDEX_EXU_MemRead, IFID_IDU_Instruction[25:21], IFID_IDU_Instruction[20:16], EXU_EXMEM_DestinationReg, Stall, IDU_IDEX_Jump, IDU_IDEX_Instruction, EXU_EXMEM_Instruction, EXMEM_MEM_Instruction);
    // need to add flush signal to old stuff when jumps are taken
	
	assign IF_ID_Flush = (IDU_IDEX_Jump[1] | IDU_IDEX_Jump[0] | MEM_IFU_PCSrc); 
	assign ID_EX_Flush = MEM_IFU_PCSrc | Stall; 
	assign EX_MEM_Flush = MEM_IFU_PCSrc; 
    assign ProgramCount = IFU_IFID_PCValue - 4;
    assign XOut = XOutWire;
    assign YOut = YOutWire;
    assign CurrentMin = CurrentMinWire;
    
endmodule