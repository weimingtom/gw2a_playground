module rom

//#(
//	// Parameter Declarations
//	parameter <param_name> = <default_value>,
//	parameter [<msb>:<lsb>] <param_name> = <default_value>,
//	parameter signed [<msb>:<lsb>] <param_name> = <default_value>
//	...
//)

(
	// Input Ports
	input [3:0] addr,
//	input <port_name>,
//	input wire <port_name>,
//	input [<msb>:<lsb>] <port_name>,
//	input signed [<msb>:<lsb>] <port_name>,
//	...

	// Output Ports
	output [7:0] dout
//	output <port_name>,
//	output [<msb>:<lsb>] <port_name>,
//	output reg [<msb>:<lsb>] <port_name>,
//	output signed [<msb>:<lsb>] <port_name>,
//	output reg signed [<msb>:<lsb>] <port_name>,
//	...

	// Inout Ports
//	inout <port_name>,
//	inout [<msb>:<lsb>] <port_name>,
//	inout signed [<msb>:<lsb>] <port_name>
//	...
);

	// Module Item(s)
	reg [7:0] mem [15:0];

	initial begin
		//TD4-4BIT-CPU-master.zip\TD4-4BIT-CPU-master\software\test\test_0_output.s
		mem[4'b0000] <= 8'b1011_0001; //OUT 0x1
		mem[4'b0001] <= 8'b1011_0010; //OUT 0x2	
		mem[4'b0010] <= 8'b1011_0100;	//OUT 0x4
		mem[4'b0011] <= 8'b1011_1000; //OUT 0x8
		mem[4'b0100] <= 8'b1011_0001; //OUT 0x1
		mem[4'b0101] <= 8'b1011_0010; //OUT 0x2
		mem[4'b0110] <= 8'b1011_0100; //OUT 0x4
		mem[4'b0111] <= 8'b1011_1000; //OUT 0x8
		mem[4'b1000] <= 8'b1011_0001; //OUT 0x1
		mem[4'b1001] <= 8'b1011_0010; //OUT 0x2
		mem[4'b1010] <= 8'b1011_0100; //OUT 0x4
		mem[4'b1011] <= 8'b1011_1000; //OUT 0x8
		mem[4'b1100] <= 8'b1011_0001; //OUT 0x1
		mem[4'b1101] <= 8'b1011_0010; //OUT 0x2
		mem[4'b1110] <= 8'b1011_0100; //OUT 0x4
		mem[4'b1111] <= 8'b1011_1000; //OUT 0x8
	end

	assign dout = mem[addr];
endmodule


module rom_knight2k

//#(
//	// Parameter Declarations
//	parameter <param_name> = <default_value>,
//	parameter [<msb>:<lsb>] <param_name> = <default_value>,
//	parameter signed [<msb>:<lsb>] <param_name> = <default_value>
//	...
//)

(
	// Input Ports
	input [3:0] addr,
//	input <port_name>,
//	input wire <port_name>,
//	input [<msb>:<lsb>] <port_name>,
//	input signed [<msb>:<lsb>] <port_name>,
//	...

	// Output Ports
	output [7:0] dout
//	output <port_name>,
//	output [<msb>:<lsb>] <port_name>,
//	output reg [<msb>:<lsb>] <port_name>,
//	output signed [<msb>:<lsb>] <port_name>,
//	output reg signed [<msb>:<lsb>] <port_name>,
//	...

	// Inout Ports
//	inout <port_name>,
//	inout [<msb>:<lsb>] <port_name>,
//	inout signed [<msb>:<lsb>] <port_name>
//	...
);

	// Module Item(s)
	reg [7:0] mem [15:0];

	initial begin
		//https://vanya.jp.net/td4/
		mem[4'b0000] <= 8'b1011_0011; //out 3
		mem[4'b0001] <= 8'b1011_0110; //out 6
		mem[4'b0010] <= 8'b1011_1100;	//out 12
		mem[4'b0011] <= 8'b1011_1000; //out 8
		mem[4'b0100] <= 8'b1011_1000; //out 8
		mem[4'b0101] <= 8'b1011_1100; //out 12
		mem[4'b0110] <= 8'b1011_0110; //out 6
		mem[4'b0111] <= 8'b1011_0011; //out 3
		mem[4'b1000] <= 8'b1011_0001; //out 1
		mem[4'b1001] <= 8'b1111_0000; //jmp 0
		mem[4'b1010] <= 8'b0000_0000; //
		mem[4'b1011] <= 8'b0000_0000; //
		mem[4'b1100] <= 8'b0000_0000; //
		mem[4'b1101] <= 8'b0000_0000; //
		mem[4'b1110] <= 8'b0000_0000; //
		mem[4'b1111] <= 8'b0000_0000; //
	end

	assign dout = mem[addr];
endmodule



module td4verilog

//#(
//	// Parameter Declarations
//	parameter <param_name> = <default_value>,
//	parameter [<msb>:<lsb>] <param_name> = <default_value>,
//	parameter signed [<msb>:<lsb>] <param_name> = <default_value>
//	...
//)

(
	// Input Ports
	input clk,
	input rst_n,
	input [3:0] btn,
//	input <port_name>,
//	input wire <port_name>,
//	input [<msb>:<lsb>] <port_name>,
//	input signed [<msb>:<lsb>] <port_name>,
//	...

	// Output Ports
	output [3:0] led
//	output [<msb>:<lsb>] <port_name>,
//	output <port_name>,
//	output reg [<msb>:<lsb>] <port_name>,
//	output signed [<msb>:<lsb>] <port_name>,
//	output reg signed [<msb>:<lsb>] <port_name>,
//	...
//
//	// Inout Ports
//	inout <port_name>,
//	inout [<msb>:<lsb>] <port_name>,
//	inout signed [<msb>:<lsb>] <port_name>
//	...
);

	// Module Item(s)
   parameter mov_ai = 4'b0011;
   parameter mov_bi = 4'b0111;
   parameter mov_ab = 4'b0001;
   parameter mov_ba = 4'b0100;
   
	parameter add_ai = 4'b0000;
   parameter add_bi = 4'b0101;
   
	parameter in_a   = 4'b0010;
   parameter in_b   = 4'b0110;
	
   parameter out_i  = 4'b1011;
   parameter out_b  = 4'b1001;
	
   parameter jmp_i  = 4'b1111;
   parameter jmc_i  = 4'b1110;
	 
	reg [31:0] counter;	
	reg clk2;	 
	
	//button input
	wire [3:0] nbtn;
	assign nbtn = ~btn;
	
	//led output
	reg [3:0] out_data = 4'b0000;
	//assign led = ~out_data;
	assign led = out_data;
	
	//rom
	reg [3:0] addr = 4'b0000;	
	wire [7:0] dout;
	//rom(addr, dout);
	rom_knight2k(addr, dout);
	 
	//decoder
	wire [3:0] im;
	assign im = dout[3:0];
	
	wire [3:0] op;
	assign op = dout[7:4];
	
	always @(posedge clk, negedge rst_n) begin
		if (!rst_n) begin
			counter <= 0;
			clk2 <= 0;
		end
		else if (counter == 2500000 /** 4*/) begin
			counter <= 0;
			clk2 = ~clk2;
		end
		else
			counter <= counter + 32'd1;
	end
	
	reg [4:0] a = 5'b00000;
	reg [3:0] b = 4'b0000;
	reg c_flag=1'b0;	
	always @(posedge clk2 or negedge rst_n) begin
		if (!rst_n) begin
			addr <= 4'b0000;
			out_data <= 4'b0000;
      end
		else begin
			case (op)
			mov_ai: a <= im;
			mov_bi: b <= im;		

			mov_ab: a <= b;
			mov_ba: b <= a;		
			
			add_ai: begin
				a <= a + im;
				if (a >= 5'b01111)
					c_flag <= 1'b1;					
				else
					c_flag <= 1'b0;
			end
			add_bi: begin 
				b <= b + im;
				if (b >= 5'b01111)
					c_flag <= 1'b1;					
				else
					c_flag <= 1'b0;
			end
			
			out_i: out_data <= im;
			out_b: out_data <= b;
			
			jmp_i: addr <= im;
			jmc_i: begin				
				if (c_flag == 1'b1) begin
					a <= 5'b00000;
					addr <= addr + 1;
				end				
				else
					addr <= im;
			end			
			default:;
			endcase

			//out_data = 4'b0001;
			//counter
			if (op != jmp_i && op != jmc_i)
				addr <= addr + 1;
		end
	end	
endmodule
