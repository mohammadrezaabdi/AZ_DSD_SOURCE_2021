`define ST_INIT     3'b000
`define ST_ADD      3'b001
`define ST_SUB      3'b010
`define ST_SHIFT1   3'b011
`define ST_SHIFT2   3'b111

module CU(clk,
          status,
          control,
          rstn,
          start);
    
    input [1:0] status;
    input clk, rstn, start;
    output [1:0] control;
    
    wire B0, FIN;
    reg [2:0] state;
    reg [2:0] next_state;
    
    assign B0      = status[1];
    assign FIN     = status[0];
    assign control = state[1:0];
    
    always @(posedge clk or negedge rstn) begin
        if (!rstn)
            state <= `ST_INIT;
        else
            state <= next_state;
    end
    
    
    always @(state or B0 or FIN or start) begin
        case (state)
            `ST_INIT:
            begin
                if (start) begin
                    if (B0)
                        next_state <= `ST_SUB;
                    else
                        next_state <= `ST_SHIFT2;
                end
            end
            `ST_ADD:
            begin
                next_state <= `ST_SHIFT2;
            end
            `ST_SUB:
            begin
                next_state <= `ST_SHIFT1;
            end
            `ST_SHIFT1:
            begin
                if (FIN)
                    next_state <= `ST_INIT;
                else if (!FIN && B0)
                    next_state <= `ST_SHIFT1;
                else
                    next_state <= `ST_ADD;
            end
            `ST_SHIFT2:
            begin
                if (FIN)
                    next_state <= `ST_INIT;
                else if (!FIN && B0)
                    next_state <= `ST_SUB;
                else
                    next_state <= `ST_SHIFT2;
            end
        endcase
    end
    
    
endmodule
    
