//=========================================================================
// RTL Model of GCD Unit Control
//-------------------------------------------------------------------------
//

module gcdGCDUnitCtrl
( 
    input clk, reset, operands_val, result_rdy,
    input B_zero, A_lt_B,
    output reg result_val, operands_rdy,
    output reg [1:0] A_mux_sel,
    output reg B_mux_sel, A_en, B_en
);

// Describe the control part as a stage machine

// Define state bits
parameter CALC = 2'b00;
parameter IDLE = 2'b10;
parameter DONE = 2'b11;

// Note that the only flip flop in the design is "state",
// nextstate must also be declared as a reg because
// it is reference from the always @* block, even though
// it isn't actually a register and is only a wire
reg [1:0] state;
reg [1:0] nextstate;



// Combinational logic decides what the next stage should be
always @* begin

    // Start by defining default values
    nextstate = state;// Stay in the same state by default
    // Only want to allow A/B registers to take new values when
    // we are sure the data on their inputs is valid
    A_en = 0;
    B_en = 0;
    result_val = 0;
    operands_rdy = 0;
    B_mux_sel = 0;
    A_mux_sel = 2'b00;
    
    case (state)
    
        //IDLE STATE
        IDLE : begin
            operands_rdy = 1;
            if(operands_val == 1'b1) begin
                nextstate = CALC;
                A_en = 1;
                B_en = 1;
            end else begin
                nextstate = IDLE;
            end
        
        end
        
        //CALC STATE
        CALC : begin
            if(A_lt_B == 1'b1) begin
                //SWAP
                B_mux_sel = 1;
                A_mux_sel = 2'b01;
                A_en = 1;
                B_en = 1;
                nextstate = CALC;
            end else if (B_zero == 1'b0) begin
                //SUBTRACT
                A_mux_sel = 2'b10;
                A_en = 1;
                nextstate = CALC;
            end else begin
                //DONE
                nextstate = DONE;
            end
        
        end
        
        //DONE STATE
        DONE : begin
            // see if outside is ready to take the result
            // if so, send it, and say that operands are ready
            // to take new values
                        result_val = 1;
            if (result_rdy == 1'b1) begin
                nextstate = IDLE;
            // if not, stay in this state until the outside is ready for the result
            end else begin
                nextstate = DONE;
            end
        end
    
    endcase


end


// Sequential part of design.  At each clock edge, advance to the
// nextstate (as determined by combinational logic)
always @(posedge clk) begin

    if(reset)
        state <= IDLE;
    else
        state <= nextstate;

end

endmodule
