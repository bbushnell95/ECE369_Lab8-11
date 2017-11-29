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
        Memory[0] = 32'd16;
        Memory[1] = 32'd16;
        Memory[2] = 32'd4;
        Memory[3] = 32'd4;
        Memory[4] = 32'd0;
        Memory[5] = 32'd1;
        Memory[6] = 32'd2;
        Memory[7] = 32'd3;
        Memory[8] = 32'd0;
        Memory[9] = 32'd0;
        Memory[10] = 32'd0;
        Memory[11] = 32'd0;
        Memory[12] = 32'd0;
        Memory[13] = 32'd0;
        Memory[14] = 32'd0;
        Memory[15] = 32'd0;
        Memory[16] = 32'd0;
        Memory[17] = 32'd0;
        Memory[18] = 32'd0;
        Memory[19] = 32'd0;
        Memory[20] = 32'd1;
        Memory[21] = 32'd2;
        Memory[22] = 32'd3;
        Memory[23] = 32'd4;
        Memory[24] = 32'd4;
        Memory[25] = 32'd5;
        Memory[26] = 32'd6;
        Memory[27] = 32'd7;
        Memory[28] = 32'd8;
        Memory[29] = 32'd9;
        Memory[30] = 32'd10;
        Memory[31] = 32'd11;
        Memory[32] = 32'd12;
        Memory[33] = 32'd13;
        Memory[34] = 32'd14;
        Memory[35] = 32'd15;
        Memory[36] = 32'd2;
        Memory[37] = 32'd3;
        Memory[38] = 32'd32;
        Memory[39] = 32'd1;
        Memory[40] = 32'd2;
        Memory[41] = 32'd3;
        Memory[42] = 32'd12;
        Memory[43] = 32'd14;
        Memory[44] = 32'd16;
        Memory[45] = 32'd18;
        Memory[46] = 32'd20;
        Memory[47] = 32'd22;
        Memory[48] = 32'd24;
        Memory[49] = 32'd26;
        Memory[50] = 32'd28;
        Memory[51] = 32'd30;
        Memory[52] = 32'd3;
        Memory[53] = 32'd4;
        Memory[54] = 32'd1;
        Memory[55] = 32'd2;
        Memory[56] = 32'd3;
        Memory[57] = 32'd4;
        Memory[58] = 32'd18;
        Memory[59] = 32'd21;
        Memory[60] = 32'd24;
        Memory[61] = 32'd27;
        Memory[62] = 32'd30;
        Memory[63] = 32'd33;
        Memory[64] = 32'd36;
        Memory[65] = 32'd39;
        Memory[66] = 32'd42;
        Memory[67] = 32'd45;
        Memory[68] = 32'd0;
        Memory[69] = 32'd4;
        Memory[70] = 32'd2;
        Memory[71] = 32'd3;
        Memory[72] = 32'd4;
        Memory[73] = 32'd5;
        Memory[74] = 32'd24;
        Memory[75] = 32'd28;
        Memory[76] = 32'd32;
        Memory[77] = 32'd36;
        Memory[78] = 32'd40;
        Memory[79] = 32'd44;
        Memory[80] = 32'd48;
        Memory[81] = 32'd52;
        Memory[82] = 32'd56;
        Memory[83] = 32'd60;
        Memory[84] = 32'd0;
        Memory[85] = 32'd5;
        Memory[86] = 32'd3;
        Memory[87] = 32'd4;
        Memory[88] = 32'd5;
        Memory[89] = 32'd6;
        Memory[90] = 32'd30;
        Memory[91] = 32'd35;
        Memory[92] = 32'd40;
        Memory[93] = 32'd45;
        Memory[94] = 32'd50;
        Memory[95] = 32'd55;
        Memory[96] = 32'd60;
        Memory[97] = 32'd65;
        Memory[98] = 32'd70;
        Memory[99] = 32'd75;
        Memory[100] = 32'd0;
        Memory[101] = 32'd6;
        Memory[102] = 32'd12;
        Memory[103] = 32'd18;
        Memory[104] = 32'd24;
        Memory[105] = 32'd30;
        Memory[106] = 32'd36;
        Memory[107] = 32'd42;
        Memory[108] = 32'd48;
        Memory[109] = 32'd54;
        Memory[110] = 32'd60;
        Memory[111] = 32'd66;
        Memory[112] = 32'd72;
        Memory[113] = 32'd78;
        Memory[114] = 32'd84;
        Memory[115] = 32'd90;
        Memory[116] = 32'd0;
        Memory[117] = 32'd4;
        Memory[118] = 32'd14;
        Memory[119] = 32'd21;
        Memory[120] = 32'd28;
        Memory[121] = 32'd35;
        Memory[122] = 32'd42;
        Memory[123] = 32'd49;
        Memory[124] = 32'd56;
        Memory[125] = 32'd63;
        Memory[126] = 32'd70;
        Memory[127] = 32'd77;
        Memory[128] = 32'd84;
        Memory[129] = 32'd91;
        Memory[130] = 32'd98;
        Memory[131] = 32'd105;
        Memory[132] = 32'd0;
        Memory[133] = 32'd8;
        Memory[134] = 32'd16;
        Memory[135] = 32'd24;
        Memory[136] = 32'd32;
        Memory[137] = 32'd40;
        Memory[138] = 32'd48;
        Memory[139] = 32'd56;
        Memory[140] = 32'd64;
        Memory[141] = 32'd72;
        Memory[142] = 32'd80;
        Memory[143] = 32'd88;
        Memory[144] = 32'd96;
        Memory[145] = 32'd104;
        Memory[146] = 32'd112;
        Memory[147] = 32'd120;
        Memory[148] = 32'd0;
        Memory[149] = 32'd9;
        Memory[150] = 32'd18;
        Memory[151] = 32'd27;
        Memory[152] = 32'd36;
        Memory[153] = 32'd45;
        Memory[154] = 32'd54;
        Memory[155] = 32'd63;
        Memory[156] = 32'd72;
        Memory[157] = 32'd81;
        Memory[158] = 32'd90;
        Memory[159] = 32'd99;
        Memory[160] = 32'd108;
        Memory[161] = 32'd117;
        Memory[162] = 32'd126;
        Memory[163] = 32'd135;
        Memory[164] = 32'd0;
        Memory[165] = 32'd10;
        Memory[166] = 32'd20;
        Memory[167] = 32'd30;
        Memory[168] = 32'd40;
        Memory[169] = 32'd50;
        Memory[170] = 32'd60;
        Memory[171] = 32'd70;
        Memory[172] = 32'd80;
        Memory[173] = 32'd90;
        Memory[174] = 32'd100;
        Memory[175] = 32'd110;
        Memory[176] = 32'd120;
        Memory[177] = 32'd130;
        Memory[178] = 32'd140;
        Memory[179] = 32'd150;
        Memory[180] = 32'd0;
        Memory[181] = 32'd11;
        Memory[182] = 32'd22;
        Memory[183] = 32'd33;
        Memory[184] = 32'd44;
        Memory[185] = 32'd55;
        Memory[186] = 32'd66;
        Memory[187] = 32'd77;
        Memory[188] = 32'd88;
        Memory[189] = 32'd99;
        Memory[190] = 32'd110;
        Memory[191] = 32'd121;
        Memory[192] = 32'd132;
        Memory[193] = 32'd143;
        Memory[194] = 32'd154;
        Memory[195] = 32'd165;
        Memory[196] = 32'd0;
        Memory[197] = 32'd12;
        Memory[198] = 32'd24;
        Memory[199] = 32'd36;
        Memory[200] = 32'd48;
        Memory[201] = 32'd60;
        Memory[202] = 32'd72;
        Memory[203] = 32'd84;
        Memory[204] = 32'd96;
        Memory[205] = 32'd108;
        Memory[206] = 32'd120;
        Memory[207] = 32'd132;
        Memory[208] = 32'd0;
        Memory[209] = 32'd1;
        Memory[210] = 32'd2;
        Memory[211] = 32'd3;
        Memory[212] = 32'd0;
        Memory[213] = 32'd13;
        Memory[214] = 32'd26;
        Memory[215] = 32'd39;
        Memory[216] = 32'd52;
        Memory[217] = 32'd65;
        Memory[218] = 32'd78;
        Memory[219] = 32'd91;
        Memory[220] = 32'd104;
        Memory[221] = 32'd114;
        Memory[222] = 32'd130;
        Memory[223] = 32'd143;
        Memory[224] = 32'd1;
        Memory[225] = 32'd2;
        Memory[226] = 32'd3;
        Memory[227] = 32'd4;
        Memory[228] = 32'd0;
        Memory[229] = 32'd14;
        Memory[230] = 32'd28;
        Memory[231] = 32'd42;
        Memory[232] = 32'd56;
        Memory[233] = 32'd70;
        Memory[234] = 32'd84;
        Memory[235] = 32'd98;
        Memory[236] = 32'd112;
        Memory[237] = 32'd126;
        Memory[238] = 32'd140;
        Memory[239] = 32'd154;
        Memory[240] = 32'd2;
        Memory[241] = 32'd3;
        Memory[242] = 32'd4;
        Memory[243] = 32'd5;
        Memory[244] = 32'd0;
        Memory[245] = 32'd15;
        Memory[246] = 32'd30;
        Memory[247] = 32'd45;
        Memory[248] = 32'd60;
        Memory[249] = 32'd75;
        Memory[250] = 32'd90;
        Memory[251] = 32'd105;
        Memory[252] = 32'd120;
        Memory[253] = 32'd135;
        Memory[254] = 32'd150;
        Memory[255] = 32'd165;
        Memory[256] = 32'd3;
        Memory[257] = 32'd4;
        Memory[258] = 32'd5;
        Memory[259] = 32'd6;
        Memory[260] = 32'd0;
        Memory[261] = 32'd1;
        Memory[262] = 32'd2;
        Memory[263] = 32'd3;
        Memory[264] = 32'd1;
        Memory[265] = 32'd2;
        Memory[266] = 32'd3;
        Memory[267] = 32'd4;
        Memory[268] = 32'd2;
        Memory[269] = 32'd3;
        Memory[270] = 32'd4;
        Memory[271] = 32'd5;
        Memory[272] = 32'd3;
        Memory[273] = 32'd4;
        Memory[274] = 32'd5;
        Memory[275] = 32'd6;
        Memory[276] = 32'd0;
            
        for(i=277; i < 1024; i = i + 1) begin
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
