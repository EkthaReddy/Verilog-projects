module vending_machine_tb;

reg clk;
reg rst;
reg [2:0] coin;
wire nw_pa;
wire ret5;
wire ret10;
wire ret20;

   
vending_machine_verilog vm(.nw_pa(nw_pa),.coin(coin),.clk(clk),.rst(rst),.ret5(ret5),.ret10(ret10),.ret20(ret20));

initial begin
$dumpfile("dump.vcd");
$dumpvars(0);

        clk = 1'b0;
        rst = 1'b1;
        coin = 3'b000;

        #5 rst = 1'b0;
        #5 coin = 3'b001; // Insert coin of value 5
        #10 coin = 3'b010; // Insert coin of value 10
        #10 coin = 3'b011; // Insert coin of value 20
        #10 coin = 3'b100; // Insert coin of value 50

        #10 $finish();
    end

    always #1 clk = ~clk;



endmodule
   
