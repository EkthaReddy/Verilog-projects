module snake_game_verilog_tb;

// Parameters
//parameter clk = 10; // Clock period in nanoseconds

// Signals
reg clk;
reg rst;
wire [7:0] snake_x;
wire [7:0] snake_y;
wire [7:0] fruit_x;
wire [7:0] fruit_y;
wire [1:0] direction;
wire [7:0] color_R;
wire [7:0] color_Y;
wire [7:0] color_G;

// Instantiate the module under test
snake_game_verilog uut (
    .clk(clk),
    .rst(rst),
    .snake_x(snake_x),
    .snake_y(snake_y),
    .fruit_x(fruit_x),
    .fruit_y(fruit_y),
    .direction(direction),
    .color_R(color_R),
    .color_Y(color_Y),
    .color_G(color_G)
);

// Clock generation
//always #((CLK_PERIOD) / 2) clk = ~clk;

// Reset generation
initial begin
    clk =0;
    rst = 1;
    #100;
    rst = 0;
    #50; // Delay before setting initial values
    rst = 1;
    #50;
    rst = 0;
end

always #1.2 clk<=~clk;
endmodule
