  
module rom_verilog ( input clk, input en, input [2:0] adr, output reg [2:0] data );
  
  reg [2:0] mem [7:0]; 
  
  always @ (posedge clk) 
    begin
      if (en)
        data <= mem[adr];
      else 
        data <= 3'bxxx;
    end
  
  initial 
    begin    
      mem[0] = 3'b000;
      mem[1] = 3'b001;
      mem[2] = 3'b010;
      mem[3] = 3'b011;
      mem[4] = 3'b100;
      mem[5] = 3'b101;
      mem[6] = 3'b110;
      mem[7] = 3'b111;
     
    end    

endmodule
