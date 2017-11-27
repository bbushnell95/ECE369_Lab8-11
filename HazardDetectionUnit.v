`timescale 1ns / 1ps

module HazardDetectionUnit(Reset, EXU_MemRead, IDU_RsReg, IDU_RtReg, EXU_RtReg, Stall, IDU_Jump, IDU_Instruction, EXU_Instruction, MEM_Instruction);

	input EXU_MemRead, Reset;
	input [1:0] IDU_Jump; 
	input [4:0] IDU_RsReg, IDU_RtReg, EXU_RtReg;
	input [31:0] IDU_Instruction, EXU_Instruction, MEM_Instruction; 

	output Stall;

	reg Stall;
	
	always @(EXU_MemRead, IDU_RsReg, IDU_RtReg, EXU_RtReg, Reset) begin
		if (Reset == 0 && IDU_Jump == 0) begin
			if (EXU_MemRead == 1 && (IDU_RsReg == EXU_RtReg || IDU_RtReg == EXU_RtReg)) begin    // hazard detected
				Stall <= 1;
			end else begin      // hazard not detected
				Stall <= 0;
			end
		end else if (Reset == 1) begin
			Stall <= 1;
		end else begin
		    Stall <= 0; 
        end
	end
	
	always @(*) begin
	   if (IDU_Jump != 0) begin
	       if ((EXU_Instruction[31:26] == 6'b000001 && EXU_Instruction[20:16] == 5'b00001) || (MEM_Instruction[31:26] == 6'b000001 && MEM_Instruction[20:16] == 5'b00001)) begin           // BGEZ command
	           Stall <= 1; 
           end else if ((EXU_Instruction[31:26] == 6'b000111 && EXU_Instruction[20:16] == 5'b00000) || (MEM_Instruction[31:26] == 6'b000111 && MEM_Instruction[20:16] == 5'b00000)) begin           // BGTZ command
               Stall <= 1; 
           end else if(EXU_Instruction[31:26] == 6'b000100 || MEM_Instruction[31:26] == 6'b000100) begin           // BEQ command
               Stall <= 1; 
           end else if(EXU_Instruction[31:26] == 6'b000101 || MEM_Instruction[31:26] == 6'b000101) begin           // BNE command
               Stall <= 1; 
	       end else if ((EXU_Instruction[31:26] == 6'b000110 && EXU_Instruction[20:16] == 5'b00000) || (MEM_Instruction[31:26] == 6'b000110 && MEM_Instruction[20:16] == 5'b00000)) begin           // BLEZ command
               Stall <= 1; 
           end else if ((EXU_Instruction[31:26] == 6'b000001 && EXU_Instruction[20:16] == 5'b00000) || (MEM_Instruction[31:26] == 6'b000001 && MEM_Instruction[20:16] == 5'b00000)) begin           // BLTZ command
               Stall <= 1;  
           end else if (EXU_Instruction[31:26] == 6'b000011 || MEM_Instruction[31:26] == 6'b000011) begin           // JAL command
               Stall <= 1;
           end
       end
	end
	
	
endmodule