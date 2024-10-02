`timescale 1ns / 1ps

module dabble_reg(clk, in, bcd, out);
	input clk;
	input in;
	output [3:0]bcd;
	output out;
	
	assign bcd = 3;
	
	//assign out = bcd[3];
	
	// out is the carry (x > 4)
	//assign out = bcd[3] | (bcd[2] & (bcd[1] | bcd[0]));
	//reg [2:0] next;
	
	// calculate proper next shift bits
	//always @(*) begin
		//next = bcd[2:0];
		/*
		if (out) begin
			next[0] = !bcd[0];
			next[1] = !bcd[0] ^ bcd[1];
			next[2] = bcd[0] & bcd[3];
		end else begin
			next = bcd[2:0];
		end
		*/
	//end
	
	// shift next bits and carry in
	/*
	always @(posedge clk) begin
		bcd <= {bcd[2:0], in};
	end
	*/
endmodule
