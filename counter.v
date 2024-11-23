`timescale 1ns/1ns
module counter(count, clock, reset, load, enable, data);

	input clock, reset, load, enable;
	input [7:0]data;
	output [7:0]count;
	reg [7:0]count;

	always @(posedge clock or negedge reset)
		begin
		if(!reset) begin
			count <= 8'b00;
		end
		else begin
			if(enable) begin
			  if(load) begin
				count <= data;
			end
			else begin
				count <= count+1;
			end
			end
			else begin
				count <= count;
			end
			end
		end
endmodule
