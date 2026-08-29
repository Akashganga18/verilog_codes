`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:09:17 10/22/2024
// Design Name:   siso_4bit
// Module Name:   /home/ankith/Desktop/lab5/siso_4bit_tb.v
// Project Name:  lab5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: siso_4bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module siso_4bit_tb;

	// Inputs
	reg clk;
	reg rst;
	reg serial_in;

	// Outputs
	wire serial_out;

	// Instantiate the Unit Under Test (UUT)
	siso_4bit uut (
		.clk(clk), 
		.rst(rst), 
		.serial_in(serial_in), 
		.serial_out(serial_out)
	);

	initial
	begin
		clk = 0;
		forever #10 clk=~clk;
	end
	
	task initialize;
	begin
	serial_in=1'b0;
	end 
	endtask
	
	task reset;
	begin
	@(negedge clk)
	rst=1'b1;
	@(negedge clk)
	rst=1'b0;
	end 
	endtask
   
	task in(input i);
	begin
	@(negedge clk)
	serial_in=i;
	end 
	endtask
	
	initial 
	begin
	initialize;
	reset;
	in(1);#10;
	in(0);#10;
	in(1);#10;
	in(0);#10;
	in(1);
	#100;$finish;
	end
endmodule

