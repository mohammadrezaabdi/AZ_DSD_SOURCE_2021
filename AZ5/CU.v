`define ST_INIT     3'b000
`define ST_ADD      3'b001
`define ST_SUB      3'b010
`define ST_SHIFT    3'b011
`define ST_CHOOSE   3'b100

module CU(clk,
          status,
          control,
          rstn,
          start);
    
    input [2:0] status;
    input clk, rstn, start;
    output [2:0] control;
    
    wire B0, BO, FIN;
    reg [2:0] state;
    reg [2:0] next_state;
    
    assign B0      = status[2];
    assign BO      = status[1];
    assign FIN     = status[0];
    assign control = state;
    
    always @(posedge clk or negedge rstn) begin
        if (!rstn)
            state <= `ST_INIT;
        else
            state <= next_state;
    end
    
    
    always @(state or B0 or BO or FIN or start) begin
        case (state)
            `ST_INIT:
            begin
                if (start) begin
                    next_state <= `ST_CHOOSE;
                end
            end
            `ST_ADD:
            begin
                next_state <= `ST_SHIFT;
            end
            `ST_SUB:
            begin
                next_state <= `ST_SHIFT;
            end
            `ST_SHIFT:
            begin
                if (FIN)
                    next_state <= `ST_INIT;
                else
                    next_state <= `ST_CHOOSE;
            end
            `ST_CHOOSE:
            begin
                if (B0 && !BO)
                    next_state <= `ST_SUB;
                else if (!B0 && BO)
                    next_state <= `ST_ADD;
                else
                    next_state <= `ST_SHIFT;
            end
        endcase
    end
    
endmodule
    
