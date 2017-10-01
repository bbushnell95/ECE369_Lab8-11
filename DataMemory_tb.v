`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - DataMemory_tb.v
// Description - Test the 'DataMemory.v' module.
////////////////////////////////////////////////////////////////////////////////

module DataMemory_tb(); 

    reg     [31:0]  Address;
    reg     [31:0]  WriteData;
    reg             Clk;
    reg             MemWrite;
    reg             MemRead;

    wire [31:0] ReadData;

    DataMemory u0(
        .Address(Address), 
        .WriteData(WriteData), 
        .Clk(Clk), 
        .MemWrite(MemWrite), 
        .MemRead(MemRead), 
        .ReadData(ReadData)
    ); 

	initial begin
		Clk <= 1'b0;
		forever #10 Clk <= ~Clk;
	end

	initial begin
	
    /* Please fill in the implementation here... */
        MemRead <= 1'b0;
        MemWrite <= 1'b0;
    
        /*
          Write Some values to memory (values will be the same as the address
          Then check if values change only on the posedge clock.
        */
        
        /* Start Test 1 */
        //Should be 0
        #1 $display("ReadData before changing MemRead to 1 = %h", ReadData);
        #1 Address <= 'h00000000; MemRead <= 1'b1;
        //Should be X
        #1 $display("ReadData before positive clock = %h", ReadData);
        #5 WriteData <= 'h00000000; MemWrite <= 1'b1;
        #3 $display("ReadData after positive clock = %h", ReadData); MemWrite <= 1'b0;
        #1 MemRead <= 1'b0;
        #8;
        /* End Test 1 */
        
        /* Start Test 2 */
        //Should be 0
        #1 $display("ReadData before changing MemRead to 1 = %h", ReadData);
        #1 Address <= 'h00000011; MemRead <= 1'b1;
        //Should be X
        #1 $display("ReadData before positive clock = %h", ReadData);        
        #5 WriteData <= 'h00000011; MemWrite <= 1'b1;
        #3 $display("ReadData after positive clock = %h", ReadData); MemWrite <= 1'b0;
        #1 MemRead <= 1'b0;
        #8;
        /* End Test 2 */
        
        /* Start Test 3*/
        //Should be 0
        #1 $display("ReadData before changing MemRead to 1 = %h", ReadData);
        #1 Address <= 'hFFFF0078; MemRead <= 1'b1;
        //Should be X
        #1 $display("ReadData before positive clock = %h", ReadData);        
        #5 WriteData <= 'hFFFF0078; MemWrite <= 1'b1;
        #3 $display("ReadData after positive clock = %h", ReadData); MemWrite <= 1'b0;
        #1 MemRead <= 1'b0;
        #8;
        /* End Test 3 */
        
        /* Start Test 4 */
        //Should be 0
        #1 $display("ReadData before changing MemRead to 1 = %h", ReadData);
        #1 Address <= 'h000012AC; MemRead <= 1'b1;
        //Should be X
        #1 $display("ReadData before positive clock = %h", ReadData);        
        #5 WriteData <= 'h000012AC; MemWrite <= 1'b1;
        #3 $display("ReadData after positive clock = %h", ReadData); MemWrite <= 1'b0;
        #1 MemRead <= 1'b0;
        #8;
        /* End Test 4*/

        /* Start Test 5*/
        #1 $display("ReadData before changing MemRead to 1 = %h", ReadData);
        #1 Address <= 'hFFFFFFFF; MemRead <= 1'b1;
        //Should be X
        #1 $display("ReadData before positive clock = %h", ReadData);         
        #5 WriteData <= 'hFFFFFFFF; MemWrite <= 1'b1;
        #3 $display("ReadData after positive clock = %h", ReadData); MemWrite <= 1'b0;
        #1 MemRead <= 1'b0;
        #8;
        /* End Test 5 */    
    end 

endmodule

