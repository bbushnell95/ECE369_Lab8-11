`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - ALU32Bit_tb.v
// Description - Test the 'ALU32Bit.v' module.
// ADD  | 0010
// SUB  | 0110
// AND  | 0000
// OR   | 0001
// SLT  | 0111
////////////////////////////////////////////////////////////////////////////////

module ALU32Bit_tb(); 

	reg [3:0] ALUControl;   // control bits for ALU operation
	reg [31:0] A, B;	        // inputs

	wire [31:0] ALUResult;	// answer
	wire Zero;	        // Zero=1 if ALUResult == 0

    ALU32Bit u0(
        .ALUControl(ALUControl), 
        .A(A), 
        .B(B), 
        .ALUResult(ALUResult), 
        .Zero(Zero)
    );

	initial begin
	
    /* Please fill in the implementation here... */
    
    /* ADD Tests */
    $display("ADD Tests");
    //ADD 'h00000001 + 'h00000001 (result should be 'h00000002, zero=0)
    #100 A<='h00000001; B<='h00000001; ALUControl<=4'b0010;
    #20 $display("ALUResult=%h, Zero=%b", ALUResult, Zero);

    //ADD 'hFFFF0001 + 'h00000001 (result should be 'hFFFF0002, zero=0)
    #100 A<='hFFFF0001; B<='h00000001; ALUControl<=4'b0010;
    #20 $display("ALUResult=%h, Zero=%b", ALUResult, Zero);
    
    //ADD 'h00000000 + 'h00000000 (reuslt should be 'h00000000, zero=1)
    #100 A<='h00000000; B<='h00000000; ALUControl<=4'b0010;
    #20 $display("ALUResult=%h, Zero=%b", ALUResult, Zero);
    
    //ADD 'hFFFFFFFF + 'h00000001 (result should be 'h00000000, zero=1)
    #100 A<='hFFFFFFFF; B<='h00000001; ALUControl<=4'b0010;
    #20 $display("ALUResult=%h, Zero=%b", ALUResult, Zero);
    /* End Add Tests */
    
    /* Sub Tests */
    $display("SUB Tests");
    //SUB 'h00000001 - 'h00000001 (reuslt should be 'h00000000, zero=1)
    #100 A<='h00000001; B<='h00000001; ALUControl<=4'b0110;
    #20 $display("ALUResult=%h, Zero=%b", ALUResult, Zero);
    
    //SUB 'hFFFFFFFF - 'hFFFFFFFF (result should be 'h00000000, zero = 1)
    #100 A<='hFFFFFFFF; B<='hFFFFFFFF; ALUControl<=4'b0110;
    #20 $display("ALUResult=%h, Zero=%b", ALUResult, Zero);
    
    //SUB 'hFFFFFFFF - 'h00000001 (result should be 'hFFFFFFFE, zero=0)
    #100 A<='hFFFFFFFF; B<='h00000001; ALUControl<=4'b0110;
    #20 $display("ALUResult=%h, Zero=%b", ALUResult, Zero);
    
    //SUB 'h00000000 - 'h00000001 (result should be 'hFFFFFFFF, zero=0)
    #100 A<='h00000000; B<='h00000001; ALUControl<=4'b0110;
    #20 $display("ALUResult=%h, Zero=%b", ALUResult, Zero);
    /* End Sub Tests */
    
    /* And Tests */
    $display("AND Tests");
    //AND 'h00000001 & 'h00000001 (reuslt should be 'h00000001, zero=0)
    #100 A<='h00000001; B<='h00000001; ALUControl<=4'b0000;
    #20 $display("ALUResult=%h, Zero=%b", ALUResult, Zero);

    //AND 'h00000001 & 'h00000000 (result should be 'h00000000, zero=1)    
    #100 A<='h00000001; B<='h00000000; ALUControl<=4'b0000;
    #20 $display("ALUResult=%h, Zero=%b", ALUResult, Zero);
    

    //AND 'hFFFF0000 & 'h0000FFFF (result should be 'h00000000, zero=1)    
    #100 A<='hFFFF0000; B<='h0000FFFF; ALUControl<=4'b0000;
    #20 $display("ALUResult=%h, Zero=%b", ALUResult, Zero);
    
    //AND 'hFFFFFFFF & 'hFFFFFFFF (result should be 'hFFFFFFFF, zero=0)    
    #100 A<='hFFFFFFFF; B<='hFFFFFFFF; ALUControl<=4'b0000;
    #20 $display("ALUResult=%h, Zero=%b", ALUResult, Zero);
    
    //AND 'h0000000A & 'h0000000B (result should be 'h0000000A, zero=0)    
    #100 A<='h0000000A; B<='h0000000B; ALUControl<=4'b0000;
    #20 $display("ALUResult=%h, Zero=%b", ALUResult, Zero);  
    
           
    /* End And Tests */
    
    /* Or Tests */
    $display("OR Tests");
    //OR 'h00000001 | 'h00000001 (result should be 'h00000001, zero=0)
    #100 A<='h00000001; B<='h00000001; ALUControl<=4'b0001;
    #20 $display("ALUResult=%h, Zero=%b", ALUResult, Zero);
    
    //OR 'h00000001 | 'h00000000 (result should be 'h00000001, zero=0)
    #100 A<='h00000001; B<='h00000000; ALUControl<=4'b0001;
    #20 $display("ALUResult=%h, Zero=%b", ALUResult, Zero);
    
    //OR 'hFFFF0000 | 'h0000FFFF (rsult should be 'hFFFFFFFF, zero=0)
    #100 A<='hFFFF0000; B<='h0000FFFF; ALUControl<=4'b0001;
    #20 $display("ALUResult=%h, Zero=%b", ALUResult, Zero);
    
    //OR 'h00000000 | 'h00000000 (result should be 'h00000000, zero=1)
    #100 A<='h00000001; B<='h00000000; ALUControl<=4'b0001;
    #20 $display("ALUResult=%h, Zero=%b", ALUResult, Zero);
    
    //OR 'h0000000A | 'h0000000B (result should be 'h0000000B, zero=0)
    #100 A<='h0000000A; B<='h0000000B; ALUControl<=4'b0001;
    #20 $display("ALUResult=%h, Zero=%b", ALUResult, Zero);
    /* End Or Tests */
    
	/* SLT Tests */
	$display("SLT Tests");
	//SLT 'h000000001 < 'h00000001 (result should be 'h00000000, zero=1)
	#100 A<='h00000001; B<='h00000001; ALUControl<=4'b0111;
    #20 $display("ALUResult=%h, Zero=%b", ALUResult, Zero);
    
    //SLT 'hFFFFFFFF < 'h00000000 (result should be 'h00000001, zero=0)
    #100 A<='hFFFFFFFF; B<='h00000000; ALUControl<=4'b0111;
    #20 $display("ALUResult=%h, Zero=%b", ALUResult, Zero);
    
    //SLT 'hFFFFFFFF < 'hFFFFFFFE (result should be 'h00000000, zero=1)
    #100 A<='hFFFFFFFF; B<='hFFFFFFFE; ALUControl<=4'b0111;
    #20 $display("ALUResult=%h, Zero=%b", ALUResult, Zero);
    
    //SLT 'h0000000A < 'h0000000B (result should be 'h00000001, zero=0)
    #100 A<='h0000000A; B<='h0000000B; ALUControl<=4'b0111;
    #20 $display("ALUResult=%h, Zero=%b", ALUResult, Zero);
    
    //SLT 'hFFFFFFFF < 'h0000000A (result should be 'h00000001, zero=0)
    #100 A<='hFFFFFFFF; B<='h0000000A; ALUControl<=4'b0111;
    #20 $display("ALUResult=%h, Zero=%b", ALUResult, Zero);
    
    /* End SLT tests */
	end

endmodule

