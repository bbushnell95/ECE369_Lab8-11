`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Team Members:
// Overall percent effort of each team member:
// Brett Bushnell -- 50%
// Derek Mcmullen -- 50% 
// 
////////////////////////////////////////////////////////////////////////////////

module Controller(Instruction, Branch, MemRead, MemWrite, RegWrite, MemToReg, RegDst, ALUOp, ALUSrc, ZeroExtend, AltALUSrc1, ZeroALUSrc1, Swap);
	
    /* Control Signals*/
    output reg Branch; 
    output reg MemRead; 
    output reg MemWrite; 
    output reg RegWrite; 
    output reg MemToReg; 
    output reg RegDst; 
    output reg [3:0] ALUOp; 
    output reg ALUSrc;
	output reg ZeroExtend; 
	output reg AltALUSrc1;
	output reg ZeroALUSrc1;
	output reg Swap; 
	
    input [31:0] Instruction; 
    

    // Decode the Instruction
    always @(Instruction) begin
    
    case (Instruction)
    /* ARITHMETIC OPS */
     32'b000000xxxxxxxxxxxxxxxxxxxx100000:    begin    // ADD Command
        RegWrite <= 1'b1; 
        ALUSrc <= 1'b0;
        ALUOp <= 4'b0010;
        RegDst <= 1'b1; 
        Branch <= 1'b0; 
        MemWrite <= 1'b0; 
        MemRead <= 1'b0; 
        ZeroExtend <= 1'b0; 
        MemToReg <= 1'b1;
        AltALUSrc1 <= 1'b0; 
        ZeroALUSrc1 <= 1'b0; 
        Swap <= 1'b0; 
      end
     32'b001001xxxxxxxxxxxxxxxxxxxxxxxxxx:    begin   // ADDIU Command
        RegWrite <= 1'b1; 
        ALUSrc <= 1'b1;
        ALUOp <= 4'b0010;
        RegDst <= 1'b0; 
        Branch <= 1'b0; 
        MemWrite <= 1'b0; 
        MemRead <= 1'b0; 
        ZeroExtend <= 1'b1; 
        MemToReg <= 1'b1;
        AltALUSrc1 <= 1'b0; 
        ZeroALUSrc1 <= 1'b0; 
        Swap <= 1'b0; 
      end
     32'b000000xxxxxxxxxxxxxxxxxxxx100001:    begin   // ADDU Command
        RegWrite    <= 1'b1; 
        ALUSrc      <= 1'b0;
        ALUOp       <= 4'b0010;
        RegDst      <= 1'b1; 
        Branch      <= 1'b0; 
        MemWrite    <= 1'b0; 
        MemRead     <= 1'b0; 
        ZeroExtend  <= 1'b0; 
        MemToReg    <= 1'b1;
        AltALUSrc1  <= 1'b0; 
        ZeroALUSrc1 <= 1'b0; 
        Swap        <= 1'b0; 
      end
     32'b001000xxxxxxxxxxxxxxxxxxxxxxxxxx:    begin   // ADDI Command
        RegWrite    <= 1'b1; 
        ALUSrc      <= 1'b1;
        ALUOp       <= 4'b0010;
        RegDst      <= 1'b0; 
        Branch      <= 1'b0; 
        MemWrite    <= 1'b0; 
        MemRead     <= 1'b0; 
        ZeroExtend  <= 1'b0; 
        MemToReg    <= 1'b1;
        AltALUSrc1  <= 1'b0; 
        ZeroALUSrc1 <= 1'b0; 
        Swap        <= 1'b0; 
      end
     32'b000000xxxxxxxxxxxxxxxxxxxx100010:    begin   // SUB Command
        RegWrite    <= 1'b1; 
        ALUSrc      <= 1'b0;
        ALUOp       <= 4'b0110;
        RegDst      <= 1'b1; 
        Branch      <= 1'b0; 
        MemWrite    <= 1'b0; 
        MemRead     <= 1'b0; 
        ZeroExtend  <= 1'b0; 
        MemToReg    <= 1'b1;
        AltALUSrc1  <= 1'b0; 
        ZeroALUSrc1 <= 1'b0; 
        Swap        <= 1'b0; 
      end
     32'b011100xxxxxxxxxxxxxxxxxxxx000010:    begin   // MUL Command
        RegWrite    <= 1'b0;
        ALUSrc      <= 1'b0;
        ALUOp       <= 4'bXXXX;
        RegDst      <= 1'b0; 
        Branch      <= 1'b0; 
        MemWrite    <= 1'b0; 
        MemRead     <= 1'b0; 
        ZeroExtend  <= 1'b0; 
        MemToReg    <= 1'b0;
        AltALUSrc1  <= 1'b0; 
        ZeroALUSrc1 <= 1'b0; 
        Swap        <= 1'b0; 
      end
     32'b000000xxxxxxxxxxxxxxxxxxxx011000:    begin   // MULT Command
        RegWrite    <= 1'b0;
        ALUSrc      <= 1'b0;
        ALUOp       <= 4'bXXXX;
        RegDst      <= 1'b0; 
        Branch      <= 1'b0; 
        MemWrite    <= 1'b0; 
        MemRead     <= 1'b0; 
        ZeroExtend  <= 1'b0; 
        MemToReg    <= 1'b0;
        AltALUSrc1  <= 1'b0; 
        ZeroALUSrc1 <= 1'b0; 
        Swap        <= 1'b0; 
      end
     32'b000000xxxxxxxxxxxxxxxxxxxx011001:    begin   // MULTU Command
        RegWrite    <= 1'b0;
        ALUSrc      <= 1'b0;
        ALUOp       <= 4'bXXXX;
        RegDst      <= 1'b0; 
        Branch      <= 1'b0; 
        MemWrite    <= 1'b0; 
        MemRead     <= 1'b0; 
        ZeroExtend  <= 1'b0; 
        MemToReg    <= 1'b0;
        AltALUSrc1  <= 1'b0; 
        ZeroALUSrc1 <= 1'b0; 
        Swap        <= 1'b0; 
      end
     32'b011100xxxxxxxxxxxxxxxxxxxx000000:    begin   // MADD Command
        RegWrite    <= 1'b0;
        ALUSrc      <= 1'b0;
        ALUOp       <= 4'bXXXX;
        RegDst      <= 1'b0; 
        Branch      <= 1'b0; 
        MemWrite    <= 1'b0; 
        MemRead     <= 1'b0; 
        ZeroExtend  <= 1'b0; 
        MemToReg    <= 1'b0;
        AltALUSrc1  <= 1'b0; 
        ZeroALUSrc1 <= 1'b0; 
        Swap        <= 1'b0; 
      end
     32'b011100xxxxxxxxxxxxxxxxxxxx000100:    begin   // MSUB Command
        RegWrite    <= 1'b0;
        ALUSrc      <= 1'b0;
        ALUOp       <= 4'bXXXX;
        RegDst      <= 1'b0; 
        Branch      <= 1'b0; 
        MemWrite    <= 1'b0; 
        MemRead     <= 1'b0; 
        ZeroExtend  <= 1'b0; 
        MemToReg    <= 1'b0;
        AltALUSrc1  <= 1'b0; 
        ZeroALUSrc1 <= 1'b0; 
        Swap        <= 1'b0; 
      end   
    /* LOGICAL OPS*/
    
    endcase
	
	end
    
endmodule

