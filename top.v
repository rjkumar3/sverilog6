`timescale 1ns / 1ns

module TOP(count, AASD_reset, clock, reset, load, enable, data);
	input clock, reset, load, enable;
	input [7:0]data;
	output [7:0]count;
	output [7:0]AASD_reset;
	wire rst;
		//count, clock, reset, load, enable, data
		counter M0 (count, clock, reset, load, enable, data);
		//rst, clock, reset
		AASD M1(reset, clock, AASD_reset);
endmodule
