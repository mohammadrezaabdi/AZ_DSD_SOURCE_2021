`define ST_INIT     3'b000
`define ST_ADD      3'b001
`define ST_SUB      3'b010
`define ST_END      3'b100
`define ST_SHIFT1   3'b011
`define ST_SHIFT2   3'b111


module CU(clk, signal , out_state, rstn);
    
    input [1:0] signal;
    input clk;
    input rstn;
    output [1:0] out_state;

    wire B0,FIN;
    reg[2:0] state;

    assign B0=signal[1];
    assign FIN=signal[0];
    assign out_state=state[1:0];

    always @(posedge clk, negedge rstn) begin
        if (!rstn) begin
            state = `ST_INIT;  
        end else begin
            case (state)
                `ST_INIT:
                    state <= (B0)?`ST_SUB:`ST_SHIFT2;
                `ST_ADD:
                    state <= `ST_SHIFT2;
                `ST_SUB:
                    state <= `ST_SHIFT1;
                `ST_SHIFT1:
                    state <= (FIN)?`ST_END:(B0)?`ST_SHIFT1:`ST_ADD;
                `ST_SHIFT2:
                    state <= (FIN)?`ST_END:(B0)?`ST_SUB:`ST_SHIFT2;               
                default:
                    state <= `ST_END; 
            endcase
        end
    end

endmodule

