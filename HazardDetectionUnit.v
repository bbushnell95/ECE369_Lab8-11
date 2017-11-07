`timescale 1ns / 1ps

module HazardDetectionUnit(EXU_MemRead, IDU_RsReg, IDU_RtReg, EXU_RtReg, Stall, Reset);

	input EXU_MemRead, Reset;
	input [4:0] IDU_RsReg, IDU_RtReg, EXU_RtReg;

	output Stall;

	reg Stall;
	
	always @(EXU_MemRead, IDU_RsReg, IDU_RtReg, EXU_RtReg, Reset) begin
		if (Reset == 0) begin
			if (EXU_MemRead == 1 && (IDU_RsReg == EXU_RtReg || IDU_RtReg == EXU_RtReg)) begin    // hazard detected
				Stall <= 1;
			end else begin      // hazard not detected
				Stall <= 0;
			end
		end else begin
			Stall <= 1;
		end
	end
	
	
endmodule