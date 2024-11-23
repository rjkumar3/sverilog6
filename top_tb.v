`timescale 1ns / 1ns
module TOP_tb();
		reg clock, reset, load, enable;
		reg [7:0]data;
		wire [7:0]count;
		TOP UUT(count, AASD_reset, clock, reset, load, enable, data);
		
		initial
			begin
				$monitor ("%d count = %b, clock = %b, reset = %b, load = %b, enable = %b, data = %b", $time, count, clock, reset, load, enable, data);
			end
		always #10 clock = ~clock;
		initial
			begin
				$vcdpluson;
				
				clock =1'b0;
				reset =1'b0;
				load =1'b0;
				enable =1'b0;
				data =8'b0;
						
						
						#80 reset = 1'b1; enable = 1'b1; data = 8'b0;
						#160 load = 1'b1; enable = 1'b0; data = 8'b11001100;
						#60 load = 1'b0;
						#340 reset = 1'b0;
						#20 enable = 1'b1; load = 1'b1; data = 8'b11001100;
						#80 reset = 1'b1;
						
						#60 $finish;
					end
endmodule