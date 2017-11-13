`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - data_memory.v
// Description - 32-Bit wide data memory.
//
// INPUTS:-
// Address: 32-Bit address input port.
// WriteData: 32-Bit input port.
// Clk: 1-Bit Input clock signal.
// MemWrite: 1-Bit control signal for memory write.
// MemRead: 1-Bit control signal for memory read.
//
// OUTPUTS:-
// ReadData: 32-Bit registered output port.
//
// FUNCTIONALITY:-
// Design the above memory similar to the 'RegisterFile' model in the previous 
// assignment.  Create a 1K memory, for which we need 10 bits.  In order to 
// implement byte addressing, we will use bits Address[11:2] to index the 
// memory location. The 'WriteData' value is written into the address 
// corresponding to Address[11:2] in the positive clock edge if 'MemWrite' 
// signal is 1. 'ReadData' is the value of memory location Address[11:2] if 
// 'MemRead' is 1, otherwise, it is 0x00000000. The reading of memory is not 
// clocked.
//
// you need to declare a 2d array. in this case we need an array of 1024 (1K)  
// 32-bit elements for the memory.   
// for example,  to declare an array of 256 32-bit elements, declaration is: reg[31:0] memory[0:255]
// if i continue with the same declaration, we need 8 bits to index to one of 256 elements. 
// however , address port for the data memory is 32 bits. from those 32 bits, least significant 2 
// bits help us index to one of the 4 bytes within a single word. therefore we only need bits [9-2] 
// of the "Address" input to index any of the 256 words. 
////////////////////////////////////////////////////////////////////////////////

module DataMemory(Address, WriteData, Clk, MemWrite, MemRead, ReadData, LoadStoreByte, LoadStoreHalf); 

    input [31:0] Address; 	// Input Address 
    input [31:0] WriteData; // Data that needs to be written into the address 
    input Clk;
    input MemWrite; 		// Control signal for memory write 
    input MemRead; 			// Control signal for memory read
    input LoadStoreByte;    // Control signal for byte
    input LoadStoreHalf;    // Control signal for Half

    output reg[31:0] ReadData; // Contents of memory location at Address

    /* Please fill in the implementation here */
    reg [31:0] Memory[0:1023];
    
    integer i;
    
    initial begin
        Memory[0] <= 32'h00000064;
        Memory[1] <= 32'h000000C8;
        Memory[2] <= 32'h0000012C;
        Memory[3] <= 32'h00000190;
        Memory[4] <= 32'h000001F4;
        Memory[5] <= 32'h00000258;
        Memory[6] <= 32'h000002BC;
        Memory[7] <= 32'h00000320;
        Memory[8] <= 32'h00000384;
        Memory[9] <= 32'h000003E8;
        Memory[10] <= 32'h0000044C;
        Memory[11] <= 32'h000004B0;
        
        for(i=12; i < 1024; i = i + 1) begin
           Memory[i] <= 32'b0;    
        end
    end
    
    always@(posedge Clk)begin   //, MemRead
        //If MemWrite is 1, write to the memory address
        if(MemWrite == 1'b1) begin
            if(LoadStoreByte == 1'b1 && LoadStoreHalf == 1'b0) Memory[Address[11:2]][7:0] = WriteData[7:0];
            else if(LoadStoreHalf == 1'b1 && LoadStoreByte == 1'b0) Memory[Address[11:2]][15:0] = WriteData[15:0];
            else Memory[Address[11:2]] = WriteData;
        end
    end
    
    always@(MemRead or Address)begin        
        //If MemRead is 1, Read from the memory address
       if(MemRead == 1'b1) begin
            if(LoadStoreByte == 1'b1 && LoadStoreHalf == 1'b0) ReadData <= {{24{Memory[Address[11:2]][7]}}, Memory[Address[11:2]][7:0]};
            else if(LoadStoreHalf == 1'b1 && LoadStoreByte == 1'b0) ReadData <= {{16{Memory[Address[11:2]][15]}}, Memory[Address[11:2]][15:0]};
            else ReadData <= Memory[Address[11:2]];
        end
       else ReadData <= 'h00000000;
    end

endmodule
