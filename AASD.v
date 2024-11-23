`timescale 1ns/1 ns
module AASD (
	input reset,
	input clock,
	output AASD_reset
);

reg[1:0] reset_reg;

always @(posedge clock or negedge reset) begin
	if (!reset) begin
		reset_reg <= 1'b0;
	end
	else begin
		reset_reg <= {reset_reg[0], reset};
	end
end

assign AASD_reset = reset_reg[1];

endmodule
