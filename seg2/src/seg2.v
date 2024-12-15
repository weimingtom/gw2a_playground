module seg2 (
	clk,
	reset_n,
	sh_cp,
	st_cp,
	ds
);

	input clk;	//50M
	input reset_n;
	
	output sh_cp;
	output st_cp;
	output ds;
	
	wire [7:0] sel;
	wire [7:0] seg;

	hc595_driver hc595_driver(
		.clk(clk),
		.reset_n(reset_n),
		.data({seg,1'b0,1'b0,~sel[5:0]}),
		.s_en(1'b1),
		.sh_cp(sh_cp),
		.st_cp(st_cp),
		.ds(ds)
	);
	
	seg2_old seg2_old(
        .sys_clk(clk),
        .sys_rst_n(reset_n),
        .sel(sel[5:0]),
        .seg_led(seg)
	);
	
endmodule
