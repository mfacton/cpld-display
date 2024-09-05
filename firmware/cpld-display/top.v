`timescale 1ns / 1ps

module top(clk, din, d1, d2, d3);
	input clk;
	input din;
	output [6:0]d1;
	output [6:0]d2;
	output [6:0]d3;
	
	wire [3:0]bcd1;
	wire carry1;
	dabble_reg seg1(
		.clk(clk),
		.in(din),
		.bcd(bcd1),
		.out(carry1)
	);
	bcd_display disp1(
		.in(bcd1),
		.out(d1)
	);
	
	wire [3:0]bcd2;
	wire carry2;
	dabble_reg seg2(
		.clk(clk),
		.in(carry1),
		.bcd(bcd2),
		.out(carry2)
	);
	bcd_display disp2(
		.in(bcd2),
		.out(d2)
	);
	
	wire [3:0]bcd3;
	dabble_reg seg3(
		.clk(clk),
		.in(carry2),
		.bcd(bcd3)
	);
	bcd_display disp3(
		.in(bcd3),
		.out(d3)
	);
endmodule
