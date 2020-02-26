module counter ( out, clk, reset ) ;

   input clk, reset;
   output [3:0] out;
   reg [3:0] 	out;
   wire [3:0] 	next;

   // This statement implements reset and increment
   assign next = reset ? 4'b0 : (out + 4'b1);

   // This implements the flip-flops
   always @ ( posedge clk ) begin
      out <= #1 next;
   end
endmodule // counter 
