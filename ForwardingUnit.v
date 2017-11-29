`timescale 1ns / 1ps

module ForwardingUnit(IDU_RsReg, IDU_RtReg, EXU_RsReg, EXU_RtReg, MEM_DestinationRegAddress, MEM_RegWrite, WB_DestinationRegAddress, WB_RegWrite, EXU_ReadData1MEMOverwrite, EXU_ReadData2MEMOverwrite, EXU_ReadData1WBOverwrite, EXU_ReadData2WBOverwrite, IDU_ReadData1Overwrite, IDU_ReadData2Overwrite, IDU_ReadData1WBOverwrite, IDU_ReadData2WBOverwrite);

	input [4:0] IDU_RsReg, IDU_RtReg, EXU_RsReg, EXU_RtReg, MEM_DestinationRegAddress, WB_DestinationRegAddress;
	input MEM_RegWrite, WB_RegWrite;

	output IDU_ReadData1Overwrite, IDU_ReadData2Overwrite;
	output IDU_ReadData1WBOverwrite, IDU_ReadData2WBOverwrite; 
	output EXU_ReadData1MEMOverwrite, EXU_ReadData2MEMOverwrite; 
	output EXU_ReadData1WBOverwrite, EXU_ReadData2WBOverwrite; 

	reg IDU_ReadData1Overwrite, IDU_ReadData2Overwrite;
	reg IDU_ReadData1WBOverwrite, IDU_ReadData2WBOverwrite;
	reg EXU_ReadData1MEMOverwrite, EXU_ReadData2MEMOverwrite; 
    reg EXU_ReadData1WBOverwrite, EXU_ReadData2WBOverwrite; 
	
	
	always @(IDU_RsReg, IDU_RtReg, EXU_RsReg, EXU_RtReg, MEM_DestinationRegAddress, WB_DestinationRegAddress, MEM_RegWrite, WB_RegWrite) begin
	   EXU_ReadData1MEMOverwrite <= 0; 
	   EXU_ReadData2MEMOverwrite <= 0; 
	   IDU_ReadData1Overwrite <= 0; 
	   IDU_ReadData2Overwrite <= 0; 
		
		if (EXU_RsReg == MEM_DestinationRegAddress && MEM_RegWrite == 1) begin
			EXU_ReadData1MEMOverwrite <= 1;
			EXU_ReadData1WBOverwrite <= 0; 
		end else if (EXU_RsReg == WB_DestinationRegAddress && WB_RegWrite == 1) begin
			EXU_ReadData1WBOverwrite <= 1;
		end else begin
			EXU_ReadData1MEMOverwrite <= 0;
			EXU_ReadData1WBOverwrite <= 0; 
		end
		
		if (EXU_RtReg == MEM_DestinationRegAddress && MEM_RegWrite == 1) begin
			EXU_ReadData2MEMOverwrite <= 1;
            EXU_ReadData2WBOverwrite <= 0; 
		end else if (EXU_RtReg == WB_DestinationRegAddress && WB_RegWrite == 1) begin
			EXU_ReadData2WBOverwrite <= 1;
		end else begin
			EXU_ReadData2MEMOverwrite <= 0;
			EXU_ReadData2WBOverwrite <= 0;
		end
		
		// IDU 
		if (IDU_RsReg == MEM_DestinationRegAddress && MEM_RegWrite == 1 && MEM_DestinationRegAddress != 0) begin
			IDU_ReadData1Overwrite <= 1;
			IDU_ReadData1WBOverwrite <= 0;
        end else if (IDU_RsReg == WB_DestinationRegAddress && WB_RegWrite == 1 && WB_DestinationRegAddress != 0) begin
            IDU_ReadData1WBOverwrite <= 1;
		end else begin
			IDU_ReadData1Overwrite <= 0;
            IDU_ReadData1WBOverwrite <= 0;
		end
		
		if (IDU_RtReg == MEM_DestinationRegAddress && MEM_RegWrite == 1 && MEM_DestinationRegAddress != 0) begin
			IDU_ReadData2Overwrite <= 1;
            IDU_ReadData2WBOverwrite <= 0;
        end else if (IDU_RtReg == WB_DestinationRegAddress && WB_RegWrite == 1 && WB_DestinationRegAddress != 0) begin
            IDU_ReadData2WBOverwrite <= 1;
		end else begin
			IDU_ReadData2Overwrite <= 0;
            IDU_ReadData2WBOverwrite <= 0;
		end
		

	end
	
	
	
endmodule