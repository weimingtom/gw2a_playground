//////////////////////////////////////////////////////////////////////////////////
// Company: 武汉芯路恒科技有限公司
// Engineer: 小梅哥团队
// Web: www.corecourse.cn
// 
// Create Date: 2020/07/20 00:00:00
// Design Name: hex8
// Module Name: hc595_driver
// Project Name: hex8
// Description: 驱动hc595，发出数据和选通信号
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module hc595_driver(
	clk,    //本驱动按ACX720代码风格要求，统一代码风格，调整了大小写的表达，移植到其他项目、芯片时需注意
	reset_n,
	data,
	s_en,

	sh_cp,
	st_cp,
	ds
);

	input clk;
	input reset_n;
	input [15:0]data;
	input s_en;
	
	output reg sh_cp;
	output reg st_cp;
	output reg ds;
	
	wire reset=~reset_n;
	parameter CNT_MAX = 2;
	
	reg [15:0]r_data;
	always@(posedge clk)
	if(s_en)
		r_data <= data;

	reg [7:0]divider_cnt;//分频计数器;
	
	always@(posedge clk or posedge reset)
	if(reset)
		divider_cnt <= 0;
	else if(divider_cnt == CNT_MAX - 1'b1)
		divider_cnt <= 0;
	else
		divider_cnt <= divider_cnt + 1'b1;
		
	wire sck_plus;
	assign sck_plus = (divider_cnt == CNT_MAX - 1'b1);
		
	reg [5:0]SHCP_EDGE_CNT;
	
	always@(posedge clk or posedge reset)
	if(reset)
		SHCP_EDGE_CNT <= 0;
	else if(sck_plus)begin
		if(SHCP_EDGE_CNT == 6'd32)
			SHCP_EDGE_CNT <= 0;
		else
			SHCP_EDGE_CNT <= SHCP_EDGE_CNT + 1'b1;
	end
	else
		SHCP_EDGE_CNT <= SHCP_EDGE_CNT;
		
	always@(posedge clk or posedge reset)
	if(reset)begin
		st_cp <= 1'b0;
		ds <= 1'b0;
		sh_cp <= 1'd0;
	end 
	else begin
		case(SHCP_EDGE_CNT)
			0: begin sh_cp <= 0; st_cp <= 1'd0;ds <= r_data[15];end
			1: begin sh_cp <= 1; st_cp <= 1'd0;end
			2: begin sh_cp <= 0; ds <= r_data[14];end
			3: begin sh_cp <= 1; end
			4: begin sh_cp <= 0; ds <= r_data[13];end	
			5: begin sh_cp <= 1; end
			6: begin sh_cp <= 0; ds <= r_data[12];end	
			7: begin sh_cp <= 1; end
			8: begin sh_cp <= 0; ds <= r_data[11];end	
			9: begin sh_cp <= 1; end
			10: begin sh_cp <= 0; ds <= r_data[10];end	
			11: begin sh_cp <= 1; end
			12: begin sh_cp <= 0; ds <= r_data[9];end	
			13: begin sh_cp <= 1; end
			14: begin sh_cp <= 0; ds <= r_data[8];end	
			15: begin sh_cp <= 1; end
			16: begin sh_cp <= 0; ds <= r_data[7];end	
			17: begin sh_cp <= 1; end
			18: begin sh_cp <= 0; ds <= r_data[6];end	
			19: begin sh_cp <= 1; end
			20: begin sh_cp <= 0; ds <= r_data[5];end	
			21: begin sh_cp <= 1; end
			22: begin sh_cp <= 0; ds <= r_data[4];end	
			23: begin sh_cp <= 1; end
			24: begin sh_cp <= 0; ds <= r_data[3];end	
			25: begin sh_cp <= 1; end
			26: begin sh_cp <= 0; ds <= r_data[2];end	
			27: begin sh_cp <= 1; end
			28: begin sh_cp <= 0; ds <= r_data[1];end			
			29: begin sh_cp <= 1; end
			30: begin sh_cp <= 0; ds <= r_data[0];end
			31: begin sh_cp <= 1; end
			32: st_cp <= 1'd1;
			default:		
				begin
					st_cp <= 1'b0;
					ds <= 1'b0;
					sh_cp <= 1'd0;
				end
		endcase
	end

endmodule
	