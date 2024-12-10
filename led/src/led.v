module led(
	input nrst,
	input clk,
	output [3:0] led
	);
	
	reg [31:0] counter;	
	reg clk2;
	
	reg [3:0] led_reg;
	
	assign led = ~led_reg;
	
	always@(posedge clk, negedge nrst) begin
		if(!nrst) begin
			counter <= 0;
			clk2 <= 0;
		end
		else if (counter == 2500000) begin
			counter <= 0;
			clk2 = ~clk2;
		end
		else
			counter <= counter + 32'd1;
	end

	always@(posedge clk2, negedge nrst) begin
		if(!nrst)
			led_reg <= 4'd0;
		else
			led_reg <= led_reg +4'd1;
	end
	
endmodule
