module vending_machine_verilog (
    input [2:0] coin,
    input clk, rst,
    output reg nw_pa,
    output reg ret5,
    output reg ret10,
    output reg ret20
);

    reg [2:0] state;
    reg [2:0] next_state;

    parameter [2:0] s0 = 3'b000;
    parameter [2:0] s5 = 3'b001;
    parameter [2:0] s10 = 3'b010;
    parameter [2:0] s20 = 3'b011;
    parameter [2:0] s50 = 3'b100;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= s0;
            nw_pa <= 1'b0;
            ret5 <= 1'b0;
            ret10 <= 1'b0;
            ret20 <= 1'b0;
        end else begin
            state <= next_state;
        end
    end

    always @(*) begin
        next_state = state;
        nw_pa = 1'b0;
        ret5 = 1'b0;
        ret10 = 1'b0;
        ret20 = 1'b0;

        case (state)
            s0: begin
                if (coin == 3'b001) next_state = s5;
                else if (coin == 3'b010) next_state = s10;
                else if (coin == 3'b011) next_state = s20;
                else if (coin == 3'b100) next_state = s50;
            end
            s5: begin
                nw_pa = 1'b1;
                if (coin == 3'b010) ret5 = 1'b1;
                else if (coin == 3'b011) begin
                    ret5 = 1'b1;
                    ret10 = 1'b1;
                end else if (coin == 3'b100) begin
                    ret5 = 1'b1;
                    ret20 = 1'b1;
                end
            end
            s10: begin
                nw_pa = 1'b1;
                if (coin == 3'b011) ret10 = 1'b1;
            end
            s20: begin
                nw_pa = 1'b1;
            end
            s50: begin
                nw_pa = 1'b1;
                if (coin == 3'b100) begin
                    ret20 = 1'b1;
                end
            end
            default: next_state = s0;
        endcase
    end

endmodule

