module single_port_ram_tb;
  reg [7:0] data; 
  reg [5:0] adr; 
  reg we; 
  reg clk; 
  wire [7:0] q; 	
  
  single_port_ram spr1(.data(data), .adr(adr), .we(we), .clk(clk), .q(q)  );
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);       
      
      clk=1'b1;
      forever #5 clk = ~clk;
    end
  
  initial
    begin
      data = 8'h01;
      adr = 5'd0;
      we = 1'b1;
      #10;
           
	  data = 8'h02;
      adr = 5'd1;     
      #10;
      
      data = 8'h03;
      adr = 5'd2;     
      #10;
      
      adr = 5'd0;
      we = 1'b0;
      #10;
      
      adr = 5'd1;
      #10;
      
      adr = 5'd2;
      #10;
      
      data = 8'h04;
      adr = 5'd1;
      we = 1'b1;
      #10;
      
      adr = 5'd1;
      we = 1'b0;
      #10;
      
      adr = 5'd3;
      #10;
    end
  
  initial
    #90 $stop;
  
endmodule
