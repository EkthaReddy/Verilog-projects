module dual_port_ram_tb;
  reg [7:0] data1, data2; 
  reg [5:0] adr1, adr2; 
  reg we1, we2; 
  reg clk; 
  wire [7:0] q1, q2; 
  
  dual_port_ram dpr1( .data1(data1), .data2(data2), .adr1(adr1), .adr2(adr2), .we1(we1), .we2(we2), .clk(clk), .q1(q1), .q2(q2));
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);       
      
      clk=1'b1;
      forever #5 clk = ~clk;
    end
  
  initial
    begin
      data1 = 8'h33;
      adr1 = 6'h01;
      
      data2 = 8'h44;
      adr2 = 6'h02;
      
      we1 = 1'b1;
      we2 = 1'b1;
      
      #10;
      
      data1 = 8'h55;
      adr1 = 6'h03;
      
      adr2 = 6'h01;
      
      we2 = 1'b0;
      
      #10;          
            
      adr1 = 6'h02;
      
      adr2 = 6'h03;
      
      we1 = 1'b0;
      
      #10;
      
      adr1 = 6'h01;
      
      data2 = 8'h77;
      adr2 = 6'h02;
      
      we2 = 1'b1;
      
      #10;
    end
  
  initial	
    #40 $stop;
  
endmodule
