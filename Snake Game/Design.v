module snake_game_verilog(
    input clk,
    input rst, 
    output reg [7:0] snake_x,
    output reg [7:0] snake_y,
    output reg [7:0] fruit_x,
    output reg [7:0] fruit_y,
    output reg [1:0] direction,
    output reg [7:0] color_R,
    output reg [7:0] color_Y,
    output reg [7:0] color_G
);

parameter WIDTH = 140;
parameter HEIGHT = 140;
parameter initial_length = 1;
parameter max_length = 2159;
parameter [1:0] RIGHT = 2'b00;
parameter [1:0] LEFT = 2'b01;
parameter [1:0] DOWN = 2'b10;
parameter [1:0] UP = 2'b11;

// length of snake will store here
reg [7:0] next_snake_y;

//inital level
initial begin
    snake_x = WIDTH/2;
    snake_y = HEIGHT/2;
    direction = LEFT;
    fruit_x = $random % WIDTH;
    fruit_y = $random % HEIGHT;
end

//snake direction
always @(posedge clk or posedge rst) begin
    if (rst) begin
        snake_x <= WIDTH/2;
        snake_y <= HEIGHT/2;
        direction <= LEFT;
        fruit_x <= $random % WIDTH;
        fruit_y <= $random % HEIGHT;
    end
    else begin
        case(direction)
            RIGHT: snake_x <= snake_x + 1;
            LEFT: snake_x <= snake_x - 1;
            UP: snake_y <= snake_y + 1;
            DOWN: snake_y <= snake_y - 1;
        endcase
    end
end        

//checking different conditions
always @* begin
    //snake eats fruits__yellow color displayed
    if (snake_x == fruit_x && snake_y == fruit_y) begin
        fruit_x <= $random % WIDTH;
        fruit_y <= $random % HEIGHT;
        next_snake_y <= snake_y+1;
        color_R <= 8'b00000000;
        color_Y <= 8'b11111111;
        color_G <= 8'b00000000;
    end
    //if the snake touches the border or itself__game over
    else begin
        if (snake_x == WIDTH || snake_y == HEIGHT || snake_x == 0 || snake_y == 0 || snake_x == snake_y) begin
            color_R <= 8'b11111111;
            color_Y <= 8'b00000000;
            color_G <= 8'b00000000;
            $display("GAME OVER!");
        end  
        //if snake reaches its maximum length__won
        else if (snake_y == max_length) begin
            color_R <= 8'b00000000;
            color_Y <= 8'b00000000;
            color_G <= 8'b11111111;
            $display("CONGRATULATIONS FOR WINNING!");
            $finish;
        end   
        else begin 
            fruit_x <= $random % WIDTH;
            fruit_y <= $random % HEIGHT;
            direction <= RIGHT;
            $display("Missed the fruit!");
        end
    end     
end

endmodule

