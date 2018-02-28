//=========================================================================
// Top level RTL Model of GCD Unit
//-------------------------------------------------------------------------
//

// W is a parameter specifying the bit width of the module
module gcdGCDUnit_rtl#( parameter W = 16 ) 
( 
  input          clk,
  input          reset,

  input  [W-1:0] operands_bits_A,
  input  [W-1:0] operands_bits_B,  
  input          operands_val,
  output         operands_rdy,

  output [W-1:0] result_bits_data,
  output         result_val,
  input          result_rdy
);

// At this top level, hook together the 
// datapath part and control part only

// In verilog, multi-bit wires will only be
// a single bit wide if they are not declared
wire B_mux_sel, A_en, B_en, B_zero, A_lt_B;
wire [1:0] A_mux_sel;

// Notice W parameter is sent to the datapath
// module as well
gcdGCDUnitDpath#(W) GCDdpath0(

    // external
    .operands_bits_A(operands_bits_A),
    .operands_bits_B(operands_bits_B),
    .result_bits_data(result_bits_data),

    // system
    .clk(clk), 
    .reset(reset),

    // internal (between ctrl and dpath)
    .A_mux_sel(A_mux_sel), 
    .A_en(A_en), 
    .B_en(B_en),
    .B_mux_sel(B_mux_sel),
    .B_zero(B_zero),
    .A_lt_B(A_lt_B)
);

gcdGCDUnitCtrl GCDctrl0(

    // external
    .operands_rdy(operands_rdy),
    .operands_val(operands_val), 
    .result_rdy(result_rdy),
    .result_val(result_val), 

    // system
    .clk(clk), 
    .reset(reset), 

    // internal (between ctrl and dpath)
    .B_zero(B_zero), 
    .A_lt_B(A_lt_B),
    .A_mux_sel(A_mux_sel), 
    .A_en(A_en), 
    .B_en(B_en),
    .B_mux_sel(B_mux_sel)

);

endmodule
