`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// ECE369A - Computer Architecture
// Laboratory 1
// Module - ExecuteUnit_tb.v
// Description - Test the 'ExecuteUnit.v' module.
////////////////////////////////////////////////////////////////////////////////


module Controller_tb();

	wire Branch, MemRead, MemWrite, RegWrite, MemToReg, RegDst, ALUSrc, HiLoALUControl, AddToHi, AddToLo, MoveToHi, MoveToLo, HiLoSel;
	wire ZeroExtend, AltALUSrc1, ZeroALUSrc1, Swap, ALUHiLoSelect;
	wire [3:0] ALUOp;

	reg [31:0] Instruction;


	Controller u0   (
		.Instruction(Instruction), 
		.Branch(Branch), 
		.MemRead(MemRead), 
		.MemWrite(MemWrite), 
		.RegWrite(RegWrite), 
		.MemToReg(MemToReg), 
		.RegDst(RegDst), 
		.ALUOp(ALUOp), 
		.ALUSrc(ALUSrc), 
		.HiLoALUControl(HiLoALUControl), 
		.AddToHi(AddToHi), 
		.AddToLo(AddToLo), 
		.MoveToHi(MoveToHi), 
		.MoveToLo(MoveToLo), 
		.HiLoSel(HiLoSel), 
		.ZeroExtend(ZeroExtend), 
		.AltALUSrc1(AltALUSrc1), 
		.ZeroALUSrc1(ZeroALUSrc1), 
		.Swap(Swap), 
		.ALUHiLoSelect(ALUHiLoSelect)
	);

	initial begin
		Instruction <= 32'b00100000000100000000000000000001; // addi: $s0, $zero, 1
		/*Display each output on own line for readability*/
		$display("-------------------Test 1--------------------");
		$display("Branch = %b", Branch);       				// 0
		$display("MemRead = %b", MemRead);     				// 0
		$display("MemWrite = %b", MemWrite);   				// 0
		$display("RegWrite = %b", RegWrite);   				// 1
		$display("MemToReg = %b", MemToReg);   				// 1
		$display("RegDst = %b", RegDst);       				// 0
		$display("ALUOp = %b", ALUOp);         				// 0010
		$display("ALUSrc = %b", ALUSrc);       				// 1
		$display("HiLoALUControl = %b", HiLoALUControl);    // X
		$display("AddToHi = %b", AddToHi);                  // X
		$display("AddToLo = %b", AddToLo);					// X
		$display("MoveToHi = %b", MoveToHi);				// X
		$display("MoveToLo = %b", MoveToLo);				// X
		$display("HiLoSel = %b", HiLoSel);					// X
		$display("ZeroExtend = %b", ZeroExtend);			// 0
		$display("AltALUSrc1 = %b", AltALUSrc1);			// 0
		$display("ZeroALUSrc1 = %b", ZeroALUSrc1);			// X
		$display("Swap = %b", Swap);						// 0
		$display("ALUHiLoSelect = %b", ALUHiLoSelect);		// X
		$display("-----------------End Test 1------------------");
	
		Instruction <= 32'b00000000000000000000000000000000; // nop
		/*Display each output on own line for readability*/
		$display("-------------------Test 2--------------------");
		$display("Branch = %b", Branch);					// 0
		$display("MemRead = %b", MemRead);					// 0
		$display("MemWrite = %b", MemWrite);				// 0
		$display("RegWrite = %b", RegWrite);				// 0
		$display("MemToReg = %b", MemToReg);				// 0
		$display("RegDst = %b", RegDst);					// 0
		$display("ALUOp = %b", ALUOp);						// 0
		$display("ALUSrc = %b", ALUSrc);					// 0
		$display("HiLoALUControl = %b", HiLoALUControl);	// 0
		$display("AddToHi = %b", AddToHi);					// 0
		$display("AddToLo = %b", AddToLo);					// 0
		$display("MoveToHi = %b", MoveToHi);				// 0
		$display("MoveToLo = %b", MoveToLo);				// 0
		$display("HiLoSel = %b", HiLoSel);					// 0
		$display("ZeroExtend = %b", ZeroExtend);			// 0
		$display("AltALUSrc1 = %b", AltALUSrc1);			// 0
		$display("ZeroALUSrc1 = %b", ZeroALUSrc1);			// 0
		$display("Swap = %b", Swap);						// 0
		$display("ALUHiLoSelect = %b", ALUHiLoSelect);		// 0
		$display("-----------------End Test 2------------------");

		Instruction <= 32'b00000010001100100000000000011000;    // mult    $s1, $s2
		/*Display each output on own line for readability*/
		$display("-------------------Test 3--------------------");
		$display("Branch = %b", Branch);					// 0
		$display("MemRead = %b", MemRead);					// 0
		$display("MemWrite = %b", MemWrite);				// 0
		$display("RegWrite = %b", RegWrite);				// 0
		$display("MemToReg = %b", MemToReg);				// x
		$display("RegDst = %b", RegDst);					// x
		$display("ALUOp = %b", ALUOp);						// 1000
		$display("ALUSrc = %b", ALUSrc);					// 0
		$display("HiLoALUControl = %b", HiLoALUControl);	// x
		$display("AddToHi = %b", AddToHi);					// 0
		$display("AddToLo = %b", AddToLo);					// 0
		$display("MoveToHi = %b", MoveToHi);				// 1
		$display("MoveToLo = %b", MoveToLo);				// 1
		$display("HiLoSel = %b", HiLoSel);					// x
		$display("ZeroExtend = %b", ZeroExtend);			// 0
		$display("AltALUSrc1 = %b", AltALUSrc1);			// 0
		$display("ZeroALUSrc1 = %b", ZeroALUSrc1);			// 0
		$display("Swap = %b", Swap);						// 0
		$display("ALUHiLoSelect = %b", ALUHiLoSelect);		// 0
		$display("-----------------End Test 3------------------");
	end
endmodule // Controller_tb