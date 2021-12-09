module dec3to8(
	input 	wire[2:0]	a,
	input 	wire		en,
	output	wire[7:0]	s
);

	wire sel[1:0];
	
	// instance of dec1to2 circuit
	dec1to2 lsb_sel( .a(a[2]), .en(en), .s({sel[0], sel[1]}) );

	dec2to4 msb( .a({a[1], a[0]}), .en(sel[1]), .s({s[7], s[6], s[5], s[4]}) );
	dec2to4 lsb( .a({a[1], a[0]}), .en(sel[0]), .s({s[3], s[2], s[1], s[0]}) );

endmodule
