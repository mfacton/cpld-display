`timescale 1ns / 1ps

module top(clk, din, d1, d2, d3);
	input clk;
	input din;
	output [6:0]d1;
	output [6:0]d2;
	output [6:0]d3;
	
	/*
	reg [3:0]bcd1;
	reg [3:0]bcd2;
	reg [3:0]bcd3;
	
	bcd_display disp1(
		.in(bcd1),
		.out(d1)
	);
	bcd_display disp2(
		.in(bcd2),
		.out(d2)
	);
	bcd_display disp3(
		.in(bcd3),
		.out(d3)
	);

	always @(posedge clk) begin
		bcd1 <= {bcd1[2:0], din};
		bcd2 <= {bcd2[2:0], bcd1[2]};
		bcd3 <= {bcd3[2:0], bcd2[2]};
	end
	*/
	
	//
	
	wire [3:0]bcd1;
	wire [3:0]bcd2;
	wire [3:0]bcd3;

	wire carry1;
	wire carry2;
	
	
	dabble_reg seg1(
		.clk(clk),
		.in(sdat),
		.bcd(bcd1),
		.out(carry1)
	);
	bcd_display disp1(
		.in(bcd1),
		.out(d1)
	);
	/*
	dabble_reg seg2(
		.clk(clk),
		.in(carry1),
		.bcd(bcd2),
		.out(carry2)
	);
	*/
	bcd_display disp2(
		.in(bcd2),
		.out(d2)
	);
	/*
	dabble_reg seg3(
		.clk(clk),
		.in(carry2),
		.bcd(bcd3)
	);
	*/
	bcd_display disp3(
		.in(bcd3),
		.out(d3)
	);
	/* counter //////////////////////////////////////
	
	reg [3:0]bcd1;
	reg [3:0]bcd2;
	reg [3:0]bcd3;
	
	always @(posedge clk) begin
		if (bcd1 == 15) begin
			bcd2 <= bcd2+1;
			bcd1 <= 0;
		end else begin
			bcd1 <= bcd1+1;
		end
		
		if (bcd2 == 15) begin
			bcd3 <= bcd3+1;
			bcd2 <= 0;
		end
	end
	
	bcd_display disp1(
		.in(bcd1),
		.out(d1)
	);
	bcd_display disp2(
		.in(bcd2),
		.out(d2)
	);
	bcd_display disp3(
		.in(bcd3),
		.out(d3)
	);
	*//////////////////////////////////////
endmodule
