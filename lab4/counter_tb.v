// This stuff just sets up the proper time scale and format for the
// simulation, for now do not modify.
`timescale 1ns/10ps

module timeunit;
   initial $timeformat(-9,1," ns",9);
endmodule


// Here is the testbench proper:
module counter_testbench ( ) ;
   // Test bench gets wires for all device under test (DUT) outputs:
   wire [3:0] out;
   // Regs for all DUT inputs:
   reg 	      clk;
   reg 	      reset;
   counter dut (// (dut means device under test)
		// Outputs
		.out (out[3:0]),
		// Inputs
		.reset (reset),
		.clk (clk));
   // Setup clk to automatically strobe with a period of 20.
   always #10 clk = ~clk;
   initial
     begin
	// First setup up to monitor all inputs and outputs
	$monitor ("time=%5d ns, clk=%b, reset=%b, out=%b", $time, clk, reset, out[3:0]);
	// First initialize all registers
	clk = 1'b0; // what happens to clk if we don't
	// set this?;
	reset = 1'b0;
	@(posedge clk);#1; // this says wait for rising edge
	// of clk and one more tic (to prevent
	// shoot through)
	reset = 1'b1;
	@(posedge clk);#1;
	reset = 1'b0; 
	// Lets watch what happens after 7 cycles
	@(posedge clk);#1;
	@(posedge clk);#1;
	@(posedge clk);#1;
	@(posedge clk);#1;
	@(posedge clk);#1;
	@(posedge clk);#1;
	@(posedge clk);#1;
	// At this point we should have a 4'b0110 coming out out because
	  // the counter should have counted for 7 cycles from 0
	  if (out != 4'b0110) begin
	     $display("ERROR 1: Out is not equal to 4'b0110");
	     $finish;
	  end
	// We got this far so all tests passed.
	$display("All tests completed sucessfully\n\n");
	$finish;
     end
   // This is to create a dump file for offline viewing.
   initial
     begin
	$dumpfile ("counter.dump");
	$dumpvars (0, counter_testbench);
     end // initial begin
   
endmodule // counter_testbench 
