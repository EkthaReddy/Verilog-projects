
module rom_verilog_tb;
  reg clk; 
  reg en; 
  reg [2:0] adr;
  wire [2:0] data;
  
  rom r1(.clk(clk),.en(en),.adr(adr),.data(data));
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);       
      
      clk=1'b1;
      forever #5 clk = ~clk;
    end
  
  initial
    begin
      en = 1'b1;
      #10;                  
      
      en = 1'b0;      
      adr = 3'b101;
      #10;
      
      adr = 3'b011;
      #10;
      
      adr = 3'b001;
      #10;
      
      en = 1'b1;
      adr = 3'b111;
      #10;
            
      adr = 3'b100;
      #10;
      
      en = 1'b1;
      adr = 3'b000;
      #10;
      
      adr = 3'bxxx;
      #10;
    end
  
  initial
    begin
      #80 $stop;
    end
  
endmodule  
