`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - RegisterFile.v
// Description - Test the register_file
// Suggested test case - First write arbitrary values into 
// the saved and temporary registers (i.e., register 8 through 25). Then, 2-by-2, 
// read values from these registers.
////////////////////////////////////////////////////////////////////////////////


module RegisterFile_tb();

	reg [4:0] ReadRegister1;
	reg [4:0] ReadRegister2;
	reg	[4:0] WriteRegister;
	reg [31:0] WriteData;
	reg RegWrite;
	reg Clk;

	wire [31:0] ReadData1;
	wire [31:0] ReadData2;


	RegisterFile u0(
		.ReadRegister1(ReadRegister1), 
		.ReadRegister2(ReadRegister2), 
		.WriteRegister(WriteRegister), 
		.WriteData(WriteData), 
		.RegWrite(RegWrite), 
		.Clk(Clk), 
		.ReadData1(ReadData1), 
		.ReadData2(ReadData2)
	);

	initial begin
		Clk <= 1'b0;
		forever #10 Clk <= ~Clk;
	end

	initial begin
	
    /* Please fill in the implementation here... */
    // Initialize the RegisterBank with arbitrary values
    RegWrite <= 1;
    #5;                      
        for (i=8; i<25; i=i+1) begin           
           WriteRegister <= i * 10; 
           #10;
        end
    
    // Read back values from the RegisterBank
    RegWrite <= 0; 
    #5;                    
        for (i=8; i<25; i=i+2) begin           
            ReadRegister1 <= i;
            ReadRegister2 <= i+1; 
            #10;
           // $display("Register1 Fetched = %h", ReadData1);
           // $display("Register2 Fetched = %h", ReadData2);
        end    
        
	end

endmodule
