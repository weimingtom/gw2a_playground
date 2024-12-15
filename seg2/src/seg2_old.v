module seg2_old (
    input sys_clk,
    input sys_rst_n,
    output reg [5:0] sel,
    output reg [7:0] seg_led
);

//original:
//parameter TIME_SHOW = 25'd25000_000;
//parameter TIME_SHOW2 = TIME_SHOW / 16 / 16;

parameter TIME_SHOW = 25'd50000_000; //lesser is refreshing more frequently
parameter TIME_SHOW2 = TIME_SHOW / 2; //larger is changing diplay number slower
reg add_flag;
reg [24:0] cnt;
reg [3:0] num;

reg [3:0] num2;

reg [24:0] cnt2;
reg add_flag2;

always @ (posedge sys_clk or negedge sys_rst_n) begin
    if (!sys_rst_n) begin
        add_flag <= 1'b0;
        cnt  <= 24'b0;
    end
    else if(cnt < TIME_SHOW - 1'b1) begin
        cnt  <= cnt +1'b1;
        add_flag <= 1'b0;
    end
    else begin
        cnt  <= 24'b0;
        add_flag <= 1'b1;
    end

    if (!sys_rst_n) begin
        add_flag2 <= 1'b0;
        cnt2  <= 24'b0;
    end
    else if(cnt2 < TIME_SHOW2 - 1'b1) begin
        cnt2  <= cnt2 +1'b1;
        add_flag2 <= 1'b0;
    end
    else begin
        cnt2  <= 24'b0;
        add_flag2 <= 1'b1;
    end
	 
	 
	 
    if (!sys_rst_n)
        num2 <= 4'h0;
    else if(add_flag2/*add_flag*/) begin
        if (num2 < 4'h6)
            num2 <= num2 + 1'b1;
        else
            num2 <= 4'h0;
    end
    else
        num2 <= num2;  
/*
	 if (!sys_rst_n)
        sel <= 6'b111111;
    else
        sel <= 6'b110000;
*/
    if (!sys_rst_n)
        sel <= 6'b111111;
    else begin
        case (num2)
            4'h0 :    sel <= 6'b111110; //5 segs off, but 1 seg on
            4'h1 :    sel <= 6'b111101;
            4'h2 :    sel <= 6'b111011;
            4'h3 :    sel <= 6'b110111;
            4'h4 :    sel <= 6'b101111;
            4'h5 :    sel <= 6'b011111;
            default : sel <= 6'b000000; //all segs on
        endcase
    end
	 
		  
		  
		  
		  
		  
		  
		  
    if (!sys_rst_n)
        num <= 4'h0;
    else if(add_flag) begin
        if (num < 4'hf)
            num <= num + 1'b1;
        else
            num <= 4'h0;
    end
    else
        num <= num;
		  
		  
		  
    if (!sys_rst_n)
        seg_led <= 8'b0;
    else begin
        case (/*num*/num2)
            4'h0 :    seg_led <= 8'b1100_0000;
            4'h1 :    seg_led <= 8'b1111_1001;
            4'h2 :    seg_led <= 8'b1010_0100;
            4'h3 :    seg_led <= 8'b1011_0000;
            4'h4 :    seg_led <= 8'b1001_1001;
            4'h5 :    seg_led <= 8'b1001_0010;
            4'h6 :    seg_led <= 8'b1000_0010;
            4'h7 :    seg_led <= 8'b1111_1000;
            4'h8 :    seg_led <= 8'b1000_0000;
            4'h9 :    seg_led <= 8'b1001_0000;
            4'ha :    seg_led <= 8'b1000_1000;
            4'hb :    seg_led <= 8'b1000_0011;
            4'hc :    seg_led <= 8'b1100_0110;
            4'hd :    seg_led <= 8'b1010_0001;
            4'he :    seg_led <= 8'b1000_0110;
            4'hf :    seg_led <= 8'b1000_1110;
            default : seg_led <= 8'b1100_0000;
        endcase
    end		  
end


endmodule 
