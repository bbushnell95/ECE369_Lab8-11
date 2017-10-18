`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Team Members:
// Overall percent effort of each team member:
// Brett Bushnell -- 50%
// Derek Mcmullen -- 50% 
//
////////////////////////////////////////////////////////////////////////////////

module Controller(Instruction, Branch, MemRead, MemWrite, RegWrite, MemToReg, RegDst, ALUOp, ALUSrc, HiLoALUControl, AddToHi, AddToLo, MoveToHi, MoveToLo, HiLoSel, ZeroExtend, AltALUSrc1, ZeroALUSrc1, ZeroALUSrc2, Swap, ALUHiLoSelect);
	
    /* Control Signals*/
    output reg Branch; 
    output reg MemRead; 
    output reg MemWrite; 
    output reg RegWrite; 
    output reg MemToReg; 
    output reg RegDst; 
    output reg [4:0] ALUOp; 
    output reg ALUSrc;
    output reg HiLoALUControl, AddToHi, AddToLo, MoveToHi, MoveToLo, HiLoSel;
	output reg ZeroExtend; 
	output reg AltALUSrc1;
	output reg ZeroALUSrc1;
	output reg ZeroALUSrc2;
	output reg Swap; 
	output reg ALUHiLoSelect; 

	
    input [31:0] Instruction; 
    

    // Decode the Instruction
    always @(Instruction) begin
    
    casex (Instruction)
     32'b00000000000000000000000000000000:    begin   // NOP Command
        RegWrite        <= 1'b0;
        ALUSrc          <= 1'b0;
        ALUOp           <= 4'bxxxx;        
        RegDst          <= 1'b0; 
        Branch          <= 1'b0; 
        MemWrite        <= 1'b0; 
        MemRead         <= 1'b0; 
        ZeroExtend      <= 1'b0; 
        MemToReg        <= 1'b0;
        AltALUSrc1      <= 1'b0; 
        ZeroALUSrc1     <= 1'b0; 
        ZeroALUSrc2     <= 1'b0;
        Swap            <= 1'b0; 
        ALUHiLoSelect   <= 1'b0; 
        HiLoALUControl  <= 1'b0; 
        AddToHi         <= 1'b0; 
        AddToLo         <= 1'b0; 
        MoveToHi        <= 1'b0; 
        MoveToLo        <= 1'b0; 
        HiLoSel         <= 1'b0; 
      end
    
    /* ARITHMETIC OPS */
     32'b000000xxxxxxxxxxxxxxxxxxxx100000:    begin    // ADD Command
        RegWrite        <= 1'b1; 
        ALUSrc          <= 1'b0;
        ALUOp           <= 4'b0010;
        RegDst          <= 1'b1; 
        Branch          <= 1'b0; 
        MemWrite        <= 1'b0; 
        MemRead         <= 1'b0; 
        ZeroExtend      <= 1'b0; 
        MemToReg        <= 1'b1;
        AltALUSrc1      <= 1'b0; 
        ZeroALUSrc1     <= 1'b0;
        ZeroALUSrc2     <= 1'b0; 
        Swap            <= 1'b0; 
        ALUHiLoSelect   <= 1'b0; 
        HiLoALUControl  <= 1'b0; 
        AddToHi         <= 1'b0; 
        AddToLo         <= 1'b0; 
        MoveToHi        <= 1'b0; 
        MoveToLo        <= 1'b0; 
        HiLoSel         <= 1'b0; 
      end
     32'b001001xxxxxxxxxxxxxxxxxxxxxxxxxx:    begin   // ADDIU Command
        RegWrite        <= 1'b1; 
        ALUSrc          <= 1'b1;
        ALUOp           <= 4'b0010;
        RegDst          <= 1'b0; 
        Branch          <= 1'b0; 
        MemWrite        <= 1'b0; 
        MemRead         <= 1'b0; 
        ZeroExtend      <= 1'b1; 
        MemToReg        <= 1'b1;
        AltALUSrc1      <= 1'b0; 
        ZeroALUSrc1     <= 1'b0;
        ZeroALUSrc2     <= 1'b0; 
        Swap            <= 1'b0; 
        ALUHiLoSelect   <= 1'b0; 
        HiLoALUControl  <= 1'b0; 
        AddToHi         <= 1'b0; 
        AddToLo         <= 1'b0; 
        MoveToHi        <= 1'b0; 
        MoveToLo        <= 1'b0; 
        HiLoSel         <= 1'b0; 
      end
     32'b000000xxxxxxxxxxxxxxxxxxxx100001:    begin   // ADDU Command
        RegWrite        <= 1'b1; 
        ALUSrc          <= 1'b0;
        ALUOp           <= 4'b0010;
        RegDst          <= 1'b1; 
        Branch          <= 1'b0; 
        MemWrite        <= 1'b0; 
        MemRead         <= 1'b0; 
        ZeroExtend      <= 1'b0; 
        MemToReg        <= 1'b1;
        AltALUSrc1      <= 1'b0; 
        ZeroALUSrc1     <= 1'b0;
        ZeroALUSrc2     <= 1'b0; 
        Swap            <= 1'b0; 
        ALUHiLoSelect   <= 1'b0; 
        HiLoALUControl  <= 1'b0; 
        AddToHi         <= 1'b0; 
        AddToLo         <= 1'b0; 
        MoveToHi        <= 1'b0; 
        MoveToLo        <= 1'b0; 
        HiLoSel         <= 1'b0; 
      end
     32'b001000xxxxxxxxxxxxxxxxxxxxxxxxxx:    begin   // ADDI Command
        RegWrite        <= 1'b1; 
        ALUSrc          <= 1'b1;
        ALUOp           <= 4'b0010;
        RegDst          <= 1'b0; 
        Branch          <= 1'b0; 
        MemWrite        <= 1'b0; 
        MemRead         <= 1'b0; 
        ZeroExtend      <= 1'b0; 
        MemToReg        <= 1'b1;
        AltALUSrc1      <= 1'b0; 
        ZeroALUSrc1     <= 1'b0;
        ZeroALUSrc2     <= 1'b0; 
        Swap            <= 1'b0; 
        ALUHiLoSelect   <= 1'b0; 
        HiLoALUControl  <= 1'b0; 
        AddToHi         <= 1'b0; 
        AddToLo         <= 1'b0; 
        MoveToHi        <= 1'b0; 
        MoveToLo        <= 1'b0; 
        HiLoSel         <= 1'b0; 
      end
     32'b000000xxxxxxxxxxxxxxxxxxxx100010:    begin   // SUB Command
        RegWrite        <= 1'b1; 
        ALUSrc          <= 1'b0;
        ALUOp           <= 4'b0110;
        RegDst          <= 1'b1; 
        Branch          <= 1'b0; 
        MemWrite        <= 1'b0; 
        MemRead         <= 1'b0; 
        ZeroExtend      <= 1'b0; 
        MemToReg        <= 1'b1;
        AltALUSrc1      <= 1'b0; 
        ZeroALUSrc1     <= 1'b0;
        ZeroALUSrc2     <= 1'b0; 
        Swap            <= 1'b0;
        ALUHiLoSelect   <= 1'b0; 
        HiLoALUControl  <= 1'b0; 
        AddToHi         <= 1'b0; 
        AddToLo         <= 1'b0; 
        MoveToHi        <= 1'b0; 
        MoveToLo        <= 1'b0; 
        HiLoSel         <= 1'b0; 
      end
     32'b011100xxxxxxxxxxxxxxxxxxxx000010:    begin   // MUL Command
        RegWrite        <= 1'b1;
        ALUSrc          <= 1'b0;
        ALUOp           <= 4'b1000;
        RegDst          <= 1'b1; 
        Branch          <= 1'b0; 
        MemWrite        <= 1'b0; 
        MemRead         <= 1'b0; 
        ZeroExtend      <= 1'b0; 
        MemToReg        <= 1'b1;
        AltALUSrc1      <= 1'b0; 
        ZeroALUSrc1     <= 1'b0;
        ZeroALUSrc2     <= 1'b0; 
        Swap            <= 1'b0; 
        ALUHiLoSelect   <= 1'b0; 
        HiLoALUControl  <= 1'b0; 
        AddToHi         <= 1'b0; 
        AddToLo         <= 1'b0; 
        MoveToHi        <= 1'b0; 
        MoveToLo        <= 1'b0; 
        HiLoSel         <= 1'b0; 
      end
     32'b000000xxxxxxxxxxxxxxxxxxxx011000:    begin   // MULT Command
        RegWrite        <= 1'b0;
        ALUSrc          <= 1'b0;
        ALUOp           <= 4'b1000;
        RegDst          <= 1'b0; 
        Branch          <= 1'b0; 
        MemWrite        <= 1'b0; 
        MemRead         <= 1'b0; 
        ZeroExtend      <= 1'b0; 
        MemToReg        <= 1'b0;
        AltALUSrc1      <= 1'b0; 
        ZeroALUSrc1     <= 1'b0; 
        ZeroALUSrc2     <= 1'b0;
        Swap            <= 1'b0; 
        ALUHiLoSelect   <= 1'b0; 
        HiLoALUControl  <= 1'b0; 
        AddToHi         <= 1'b0; 
        AddToLo         <= 1'b0; 
        MoveToHi        <= 1'b1; 
        MoveToLo        <= 1'b1; 
        HiLoSel         <= 1'b0; 
      end
     32'b000000xxxxxxxxxxxxxxxxxxxx011001:    begin   // MULTU Command
        RegWrite        <= 1'b0;
        ALUSrc          <= 1'b0;
        ALUOp           <= 4'b1000;
        RegDst          <= 1'b0; 
        Branch          <= 1'b0; 
        MemWrite        <= 1'b0; 
        MemRead         <= 1'b0; 
        ZeroExtend      <= 1'b0; 
        MemToReg        <= 1'b0;
        AltALUSrc1      <= 1'b0; 
        ZeroALUSrc1     <= 1'b0; 
        ZeroALUSrc2     <= 1'b0;
        Swap            <= 1'b0; 
        ALUHiLoSelect   <= 1'b0; 
        HiLoALUControl  <= 1'b0; 
        AddToHi         <= 1'b0; 
        AddToLo         <= 1'b0; 
        MoveToHi        <= 1'b1; 
        MoveToLo        <= 1'b1; 
        HiLoSel         <= 1'b0; 
      end
     32'b011100xxxxxxxxxxxxxxxxxxxx000000:    begin   // MADD Command
        RegWrite        <= 1'b0;
        ALUSrc          <= 1'b0;
        ALUOp           <= 4'b1000;
        RegDst          <= 1'b0; 
        Branch          <= 1'b0; 
        MemWrite        <= 1'b0; 
        MemRead         <= 1'b0; 
        ZeroExtend      <= 1'b0; 
        MemToReg        <= 1'b0;
        AltALUSrc1      <= 1'b0; 
        ZeroALUSrc1     <= 1'b0; 
        ZeroALUSrc2     <= 1'b0;
        Swap            <= 1'b0; 
        ALUHiLoSelect   <= 1'b0; 
        HiLoALUControl  <= 1'b0; 
        AddToHi         <= 1'b1; 
        AddToLo         <= 1'b1; 
        MoveToHi        <= 1'b0; 
        MoveToLo        <= 1'b0; 
        HiLoSel         <= 1'b0; 
      end
     32'b011100xxxxxxxxxxxxxxxxxxxx000100:    begin   // MSUB Command
        RegWrite        <= 1'b0;
        ALUSrc          <= 1'b0;
        ALUOp           <= 4'b1000;
        RegDst          <= 1'b0; 
        Branch          <= 1'b0; 
        MemWrite        <= 1'b0; 
        MemRead         <= 1'b0; 
        ZeroExtend      <= 1'b0; 
        MemToReg        <= 1'b0;
        AltALUSrc1      <= 1'b0; 
        ZeroALUSrc1     <= 1'b0;
        ZeroALUSrc2     <= 1'b0;
        Swap            <= 1'b0; 
        ALUHiLoSelect   <= 1'b0; 
        HiLoALUControl  <= 1'b1; 
        AddToHi         <= 1'b1; 
        AddToLo         <= 1'b1; 
        MoveToHi        <= 1'b0; 
        MoveToLo        <= 1'b0; 
        HiLoSel         <= 1'b0; 
      end   
      
    /* LOGICAL OPS*/
    32'b000000xxxxxxxxxxxxxxxxxxxx100100:    begin   // AND Command
        RegWrite        <= 1'b1;
        ALUSrc          <= 1'b0;
        ALUOp           <= 4'b0000;
        RegDst          <= 1'b1; 
        Branch          <= 1'b0; 
        MemWrite        <= 1'b0; 
        MemRead         <= 1'b0; 
        ZeroExtend      <= 1'b0; 
        MemToReg        <= 1'b1;
        AltALUSrc1      <= 1'b0; 
        ZeroALUSrc1     <= 1'b0; 
        ZeroALUSrc2     <= 1'b0;
        Swap            <= 1'b0; 
        ALUHiLoSelect   <= 1'b0; 
        HiLoALUControl  <= 1'b0; 
        AddToHi         <= 1'b0; 
        AddToLo         <= 1'b0; 
        MoveToHi        <= 1'b0; 
        MoveToLo        <= 1'b0; 
        HiLoSel         <= 1'b0; 
      end
    32'b001100xxxxxxxxxxxxxxxxxxxxxxxxxx:    begin   // ANDI Command
        RegWrite        <= 1'b1;
        ALUSrc          <= 1'b1;
        ALUOp           <= 4'b0000;
        RegDst          <= 1'b0; 
        Branch          <= 1'b0; 
        MemWrite        <= 1'b0; 
        MemRead         <= 1'b0; 
        ZeroExtend      <= 1'b0; 
        MemToReg        <= 1'b1;
        AltALUSrc1      <= 1'b0; 
        ZeroALUSrc1     <= 1'b0; 
        ZeroALUSrc2     <= 1'b0;
        Swap            <= 1'b0; 
        ALUHiLoSelect   <= 1'b0; 
        HiLoALUControl  <= 1'b0; 
        AddToHi         <= 1'b0; 
        AddToLo         <= 1'b0; 
        MoveToHi        <= 1'b0; 
        MoveToLo        <= 1'b0; 
        HiLoSel         <= 1'b0; 
      end   
    32'b000000xxxxxxxxxxxxxxxxxxxx100101:    begin   // OR Command
        RegWrite        <= 1'b1;
        ALUSrc          <= 1'b0;
        ALUOp           <= 4'b0001;
        RegDst          <= 1'b1; 
        Branch          <= 1'b0; 
        MemWrite        <= 1'b0; 
        MemRead         <= 1'b0; 
        ZeroExtend      <= 1'b0; 
        MemToReg        <= 1'b1;
        AltALUSrc1      <= 1'b0; 
        ZeroALUSrc1     <= 1'b0; 
        ZeroALUSrc2     <= 1'b0;
        Swap            <= 1'b0; 
        ALUHiLoSelect   <= 1'b0; 
        HiLoALUControl  <= 1'b0; 
        AddToHi         <= 1'b0; 
        AddToLo         <= 1'b0; 
        MoveToHi        <= 1'b0; 
        MoveToLo        <= 1'b0; 
        HiLoSel         <= 1'b0; 
      end
     32'b000000xxxxxxxxxxxxxxxxxxxx100111:    begin   // NOR Command
        RegWrite        <= 1'b1;
        ALUSrc          <= 1'b0;
        ALUOp           <= 4'b0011;
        RegDst          <= 1'b1; 
        Branch          <= 1'b0; 
        MemWrite        <= 1'b0; 
        MemRead         <= 1'b0; 
        ZeroExtend      <= 1'b0; 
        MemToReg        <= 1'b1;
        AltALUSrc1      <= 1'b0; 
        ZeroALUSrc1     <= 1'b0; 
        ZeroALUSrc2     <= 1'b0;
        Swap            <= 1'b0; 
        ALUHiLoSelect   <= 1'b0;  
        HiLoALUControl  <= 1'b0; 
        AddToHi         <= 1'b0; 
        AddToLo         <= 1'b0; 
        MoveToHi        <= 1'b0; 
        MoveToLo        <= 1'b0; 
        HiLoSel         <= 1'b0; 
      end   
    32'b000000xxxxxxxxxxxxxxxxxxxx100110:    begin   // XOR Command
        RegWrite        <= 1'b1;
        ALUSrc          <= 1'b0;
        ALUOp           <= 4'b0100;
        RegDst          <= 1'b1; 
        Branch          <= 1'b0; 
        MemWrite        <= 1'b0; 
        MemRead         <= 1'b0; 
        ZeroExtend      <= 1'b0; 
        MemToReg        <= 1'b1;
        AltALUSrc1      <= 1'b0; 
        ZeroALUSrc1     <= 1'b0; 
        ZeroALUSrc2     <= 1'b0;
        Swap            <= 1'b0; 
        ALUHiLoSelect   <= 1'b0; 
        HiLoALUControl  <= 1'b0; 
        AddToHi         <= 1'b0; 
        AddToLo         <= 1'b0; 
        MoveToHi        <= 1'b0; 
        MoveToLo        <= 1'b0; 
        HiLoSel         <= 1'b0; 
      end
    32'b001101xxxxxxxxxxxxxxxxxxxxxxxxxx:    begin   // ORI Command
        RegWrite        <= 1'b1;
        ALUSrc          <= 1'b1;
        ALUOp           <= 4'b0001;
        RegDst          <= 1'b0; 
        Branch          <= 1'b0; 
        MemWrite        <= 1'b0; 
        MemRead         <= 1'b0; 
        ZeroExtend      <= 1'b0; 
        MemToReg        <= 1'b1;
        AltALUSrc1      <= 1'b0; 
        ZeroALUSrc1     <= 1'b0; 
        ZeroALUSrc2     <= 1'b0;
        Swap            <= 1'b0; 
        ALUHiLoSelect   <= 1'b0;
        HiLoALUControl  <= 1'b0; 
        AddToHi         <= 1'b0; 
        AddToLo         <= 1'b0; 
        MoveToHi        <= 1'b0; 
        MoveToLo        <= 1'b0; 
        HiLoSel         <= 1'b0; 
      end        
    32'b001110xxxxxxxxxxxxxxxxxxxxxxxxxx:    begin   // XORI Command
        RegWrite        <= 1'b1;
        ALUSrc          <= 1'b1;
        ALUOp           <= 4'b0100;       //need XOR
        RegDst          <= 1'b0; 
        Branch          <= 1'b0; 
        MemWrite        <= 1'b0; 
        MemRead         <= 1'b0; 
        ZeroExtend      <= 1'b0; 
        MemToReg        <= 1'b1;
        AltALUSrc1      <= 1'b0; 
        ZeroALUSrc1     <= 1'b0; 
        ZeroALUSrc2     <= 1'b0;
        Swap            <= 1'b0; 
        ALUHiLoSelect   <= 1'b0; 
        HiLoALUControl  <= 1'b0; 
        AddToHi         <= 1'b0; 
        AddToLo         <= 1'b0; 
        MoveToHi        <= 1'b0; 
        MoveToLo        <= 1'b0; 
        HiLoSel         <= 1'b0; 
      end
    32'b01111100000xxxxxxxxxx11000100000:    begin   // SEH Command
        RegWrite        <= 1'b1;
        ALUSrc          <= 1'b0;
        ALUOp           <= 4'b1001;       //need SEH
        RegDst          <= 1'b1; 
        Branch          <= 1'b0; 
        MemWrite        <= 1'b0; 
        MemRead         <= 1'b0; 
        ZeroExtend      <= 1'b0; 
        MemToReg        <= 1'b1;
        AltALUSrc1      <= 1'b0; 
        ZeroALUSrc1     <= 1'b0; 
        ZeroALUSrc2     <= 1'b0;
        Swap            <= 1'b0; 
        ALUHiLoSelect   <= 1'b0; 
        HiLoALUControl  <= 1'b0; 
        AddToHi         <= 1'b0; 
        AddToLo         <= 1'b0; 
        MoveToHi        <= 1'b0; 
        MoveToLo        <= 1'b0; 
        HiLoSel         <= 1'b0; 
      end   
    32'b000000xxxxxxxxxxxxxxxxxxxx000000:    begin   // SLL Command
        RegWrite        <= 1'b1;
        ALUSrc          <= 1'b1;
        ALUOp           <= 4'b1011;      //need SLL
        RegDst          <= 1'b1; 
        Branch          <= 1'b0; 
        MemWrite        <= 1'b0; 
        MemRead         <= 1'b0; 
        ZeroExtend      <= 1'b0; 
        MemToReg        <= 1'b1;
        AltALUSrc1      <= 1'b1; 
        ZeroALUSrc1     <= 1'b0;
        ZeroALUSrc2     <= 1'b0;
        Swap            <= 1'b0; 
        ALUHiLoSelect   <= 1'b0; 
        HiLoALUControl  <= 1'b0; 
        AddToHi         <= 1'b0; 
        AddToLo         <= 1'b0; 
        MoveToHi        <= 1'b0; 
        MoveToLo        <= 1'b0; 
        HiLoSel         <= 1'b0; 
      end
    32'b00000000000xxxxxxxxxxxxxxx000010:    begin   // SRL Command
        RegWrite        <= 1'b1;
        ALUSrc          <= 1'b1;
        ALUOp           <= 4'b1100;      //need SRL
        RegDst          <= 1'b1; 
        Branch          <= 1'b0; 
        MemWrite        <= 1'b0; 
        MemRead         <= 1'b0; 
        ZeroExtend      <= 1'b0; 
        MemToReg        <= 1'b1;
        AltALUSrc1      <= 1'b1; 
        ZeroALUSrc1     <= 1'b0; 
        ZeroALUSrc2     <= 1'b0;
        Swap            <= 1'b0; 
        ALUHiLoSelect   <= 1'b0; 
        HiLoALUControl  <= 1'b0; 
        AddToHi         <= 1'b0; 
        AddToLo         <= 1'b0; 
        MoveToHi        <= 1'b0; 
        MoveToLo        <= 1'b0; 
        HiLoSel         <= 1'b0; 
      end  
    32'b000000xxxxxxxxxxxxxxxxxxxx000100:    begin   // SLLV Command
        RegWrite        <= 1'b1;
        ALUSrc          <= 1'b0;
        ALUOp           <= 4'b0101;     //need SLLV
        RegDst          <= 1'b1; 
        Branch          <= 1'b0; 
        MemWrite        <= 1'b0; 
        MemRead         <= 1'b0; 
        ZeroExtend      <= 1'b0; 
        MemToReg        <= 1'b1;
        AltALUSrc1      <= 1'b0; 
        ZeroALUSrc1     <= 1'b0; 
        ZeroALUSrc2     <= 1'b0;
        Swap            <= 1'b1; 
        ALUHiLoSelect   <= 1'b0; 
        HiLoALUControl  <= 1'b0; 
        AddToHi         <= 1'b0; 
        AddToLo         <= 1'b0; 
        MoveToHi        <= 1'b0; 
        MoveToLo        <= 1'b0; 
        HiLoSel         <= 1'b0; 
      end
    32'b000000xxxxxxxxxxxxxxx00000000110:    begin   // SRLV Command
        RegWrite        <= 1'b1;
        ALUSrc          <= 1'b0;
        ALUOp           <= 4'b1111;     //need SRL
        RegDst          <= 1'b1; 
        Branch          <= 1'b0; 
        MemWrite        <= 1'b0; 
        MemRead         <= 1'b0; 
        ZeroExtend      <= 1'b0; 
        MemToReg        <= 1'b1;
        AltALUSrc1      <= 1'b0; 
        ZeroALUSrc1     <= 1'b0; 
        ZeroALUSrc2     <= 1'b0;
        Swap            <= 1'b1; 
        ALUHiLoSelect   <= 1'b0; 
        HiLoALUControl  <= 1'b0; 
        AddToHi         <= 1'b0; 
        AddToLo         <= 1'b0; 
        MoveToHi        <= 1'b0; 
        MoveToLo        <= 1'b0; 
        HiLoSel         <= 1'b0; 
      end     
    32'b000000xxxxxxxxxxxxxxxxxxxx101010:    begin   // SLT Command
        RegWrite        <= 1'b1;
        ALUSrc          <= 1'b0;
        ALUOp           <= 4'b0111;    
        RegDst          <= 1'b1; 
        Branch          <= 1'b0; 
        MemWrite        <= 1'b0; 
        MemRead         <= 1'b0; 
        ZeroExtend      <= 1'b0; 
        MemToReg        <= 1'b1;
        AltALUSrc1      <= 1'b0; 
        ZeroALUSrc1     <= 1'b0; 
        ZeroALUSrc2     <= 1'b0;
        Swap            <= 1'b0; 
        ALUHiLoSelect   <= 1'b0; 
        HiLoALUControl  <= 1'b0; 
        AddToHi         <= 1'b0; 
        AddToLo         <= 1'b0; 
        MoveToHi        <= 1'b0; 
        MoveToLo        <= 1'b0; 
        HiLoSel         <= 1'b0; 
      end
    32'b001010xxxxxxxxxxxxxxxxxxxxxxxxxx:    begin   // SLTI Command
        RegWrite        <= 1'b1;
        ALUSrc          <= 1'b1;
        ALUOp           <= 4'b0111;     
        RegDst          <= 1'b0; 
        Branch          <= 1'b0; 
        MemWrite        <= 1'b0; 
        MemRead         <= 1'b0; 
        ZeroExtend      <= 1'b0; 
        MemToReg        <= 1'b1;
        AltALUSrc1      <= 1'b0; 
        ZeroALUSrc1     <= 1'b0; 
        ZeroALUSrc2     <= 1'b0;
        Swap            <= 1'b0; 
        ALUHiLoSelect   <= 1'b0; 
        HiLoALUControl  <= 1'b0; 
        AddToHi         <= 1'b0; 
        AddToLo         <= 1'b0; 
        MoveToHi        <= 1'b0; 
        MoveToLo        <= 1'b0; 
        HiLoSel         <= 1'b0; 
      end
    32'b000000xxxxxxxxxxxxxxxxxxxx001011:    begin   // MOVN Command
        RegWrite        <= 1'b1;
        ALUSrc          <= 1'b0;
        ALUOp           <= 4'b0010;     // need ADD
        RegDst          <= 1'b1; 
        Branch          <= 1'b0; 
        MemWrite        <= 1'b0; 
        MemRead         <= 1'b0; 
        ZeroExtend      <= 1'b0; 
        MemToReg        <= 1'b1;
        AltALUSrc1      <= 1'b1; 
        ZeroALUSrc1     <= 1'b1; 
        ZeroALUSrc2     <= 1'b1;
        Swap            <= 1'b0; 
        ALUHiLoSelect   <= 1'b0; 
        HiLoALUControl  <= 1'b0; 
        AddToHi         <= 1'b0; 
        AddToLo         <= 1'b0; 
        MoveToHi        <= 1'b0; 
        MoveToLo        <= 1'b0; 
        HiLoSel         <= 1'b0; 
      end
    32'b000000xxxxxxxxxxxxxxxxxxxx001010:    begin   // MOVZ Command
        RegWrite        <= 1'b1;
        ALUSrc          <= 1'b0;
        ALUOp           <= 4'b0010;     // need ADD
        RegDst          <= 1'b1; 
        Branch          <= 1'b0; 
        MemWrite        <= 1'b0; 
        MemRead         <= 1'b0; 
        ZeroExtend      <= 1'b0; 
        MemToReg        <= 1'b1;
        AltALUSrc1      <= 1'b1; 
        ZeroALUSrc1     <= 1'b1; 
        ZeroALUSrc2     <= 1'b1;
        Swap            <= 1'b0; 
        ALUHiLoSelect   <= 1'b0; 
        HiLoALUControl  <= 1'b0; 
        AddToHi         <= 1'b0; 
        AddToLo         <= 1'b0; 
        MoveToHi        <= 1'b0; 
        MoveToLo        <= 1'b0; 
        HiLoSel         <= 1'b0; 
      end     
    32'b000000xxxxxxxxxxxxxxx00001000110:    begin   // ROTRV Command
        RegWrite        <= 1'b1;
        ALUSrc          <= 1'b1;
        ALUOp           <= 4'b1101;     //need ROTR
        RegDst          <= 1'b1; 
        Branch          <= 1'b0; 
        MemWrite        <= 1'b0; 
        MemRead         <= 1'b0; 
        ZeroExtend      <= 1'b0; 
        MemToReg        <= 1'b1;
        AltALUSrc1      <= 1'b0; 
        ZeroALUSrc1     <= 1'b0; 
        ZeroALUSrc2     <= 1'b0;
        Swap            <= 1'b0; 
        ALUHiLoSelect   <= 1'b0; 
        HiLoALUControl  <= 1'b0; 
        AddToHi         <= 1'b0; 
        AddToLo         <= 1'b0; 
        MoveToHi        <= 1'b0; 
        MoveToLo        <= 1'b0; 
        HiLoSel         <= 1'b0; 
      end
    32'b00000000001xxxxxxxxxxxxxxx000010:    begin   // ROTR Command
        RegWrite        <= 1'b1;
        ALUSrc          <= 1'b1;
        ALUOp           <= 4'b1101;     //need ROTR
        RegDst          <= 1'b1; 
        Branch          <= 1'b0; 
        MemWrite        <= 1'b0; 
        MemRead         <= 1'b0; 
        ZeroExtend      <= 1'b0; 
        MemToReg        <= 1'b1;
        AltALUSrc1      <= 1'b1; 
        ZeroALUSrc1     <= 1'b0; 
        ZeroALUSrc2     <= 1'b0;
        Swap            <= 1'b1; 
        ALUHiLoSelect   <= 1'b0; 
        HiLoALUControl  <= 1'b0; 
        AddToHi         <= 1'b0; 
        AddToLo         <= 1'b0; 
        MoveToHi        <= 1'b0; 
        MoveToLo        <= 1'b0; 
        HiLoSel         <= 1'b0; 
      end
    32'b000000xxxxxxxxxxxxxxxxxxxx000011:    begin   // SRA Command
        RegWrite        <= 1'b1;
        ALUSrc          <= 1'b0;
        ALUOp           <= 4'b1110;     //need SRA
        RegDst          <= 1'b1; 
        Branch          <= 1'b0; 
        MemWrite        <= 1'b0; 
        MemRead         <= 1'b0; 
        ZeroExtend      <= 1'b0; 
        MemToReg        <= 1'b1;
        AltALUSrc1      <= 1'b1; 
        ZeroALUSrc1     <= 1'b0; 
        ZeroALUSrc2     <= 1'b0;
        Swap            <= 1'b0; 
        ALUHiLoSelect   <= 1'b0; 
        HiLoALUControl  <= 1'b0; 
        AddToHi         <= 1'b0; 
        AddToLo         <= 1'b0; 
        MoveToHi        <= 1'b0; 
        MoveToLo        <= 1'b0; 
        HiLoSel         <= 1'b0; 
      end
    32'b000000xxxxxxxxxxxxxxxxxxxx000111:    begin   // SRAV Command
        RegWrite        <= 1'b1;
        ALUSrc          <= 1'b0;
        ALUOp           <= 4'b1110;     //need SRA
        RegDst          <= 1'b1; 
        Branch          <= 1'b0; 
        MemWrite        <= 1'b0; 
        MemRead         <= 1'b0; 
        ZeroExtend      <= 1'b0; 
        MemToReg        <= 1'b1;
        AltALUSrc1      <= 1'b0; 
        ZeroALUSrc1     <= 1'b0; 
        ZeroALUSrc2     <= 1'b0;
        Swap            <= 1'b1; 
        ALUHiLoSelect   <= 1'b0; 
        HiLoALUControl  <= 1'b0; 
        AddToHi         <= 1'b0; 
        AddToLo         <= 1'b0; 
        MoveToHi        <= 1'b0; 
        MoveToLo        <= 1'b0; 
        HiLoSel         <= 1'b0; 
      end    
    32'b01111100000xxxxxxxxxx10000100000:    begin   // SEB Command
        RegWrite        <= 1'b1;
        ALUSrc          <= 1'b0;
        ALUOp           <= 4'b1010;     //need SEB
        RegDst          <= 1'b1; 
        Branch          <= 1'b0; 
        MemWrite        <= 1'b0; 
        MemRead         <= 1'b0; 
        ZeroExtend      <= 1'b0; 
        MemToReg        <= 1'b1;
        AltALUSrc1      <= 1'b0; 
        ZeroALUSrc1     <= 1'b0; 
        ZeroALUSrc2     <= 1'b0;
        Swap            <= 1'b0; 
        ALUHiLoSelect   <= 1'b0; 
        HiLoALUControl  <= 1'b0; 
        AddToHi         <= 1'b0; 
        AddToLo         <= 1'b0; 
        MoveToHi        <= 1'b0; 
        MoveToLo        <= 1'b0; 
        HiLoSel         <= 1'b0; 
      end
    32'b001011xxxxxxxxxxxxxxxxxxxxxxxxxx:    begin   // SLTIU Command
        RegWrite        <= 1'b1;
        ALUSrc          <= 1'b1;
        ALUOp           <= 4'b0111;        
        RegDst          <= 1'b0; 
        Branch          <= 1'b0; 
        MemWrite        <= 1'b0; 
        MemRead         <= 1'b0; 
        ZeroExtend      <= 1'b1; 
        MemToReg        <= 1'b1;
        AltALUSrc1      <= 1'b0; 
        ZeroALUSrc1     <= 1'b0; 
        ZeroALUSrc2     <= 1'b0;
        Swap            <= 1'b0; 
        ALUHiLoSelect   <= 1'b0; 
        HiLoALUControl  <= 1'b0; 
        AddToHi         <= 1'b0; 
        AddToLo         <= 1'b0; 
        MoveToHi        <= 1'b0; 
        MoveToLo        <= 1'b0; 
        HiLoSel         <= 1'b0; 
      end      
    32'b000000xxxxxxxxxxxxxxxxxxxx101011:    begin   // SLTU Command
        RegWrite        <= 1'b1;
        ALUSrc          <= 1'b0;
        ALUOp           <= 4'b0111;        
        RegDst          <= 1'b1; 
        Branch          <= 1'b0; 
        MemWrite        <= 1'b0; 
        MemRead         <= 1'b0; 
        ZeroExtend      <= 1'b0; 
        MemToReg        <= 1'b1;
        AltALUSrc1      <= 1'b0; 
        ZeroALUSrc1     <= 1'b0; 
        ZeroALUSrc2     <= 1'b0;
        Swap            <= 1'b0; 
        ALUHiLoSelect   <= 1'b0; 
        HiLoALUControl  <= 1'b0; 
        AddToHi         <= 1'b0; 
        AddToLo         <= 1'b0; 
        MoveToHi        <= 1'b0; 
        MoveToLo        <= 1'b0; 
        HiLoSel         <= 1'b0; 
      end      
    endcase
	
	end
    
endmodule

