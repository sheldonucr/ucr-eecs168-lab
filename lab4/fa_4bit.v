module fa_4bit( cin, cout, ain, bin, sum );

	input cin;
	input [3:0] ain, bin;
	output [3:0] sum;
	output cout;

	assign {cout,sum} = ain + bin + cin;

endmodule // fa_4bit