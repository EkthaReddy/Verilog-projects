module single_port_ram(input [7:0] data, input [6:0] adr, input we, input clk, output [7:0] q );
  
  reg [7:0] ram [127:0]; 
  reg [6:0] adr_reg; 
  
  always @ (posedge clk) 
    begin
      if(we) begin
        ram[adr] <= data;
      end else begin
        adr_reg <= adr; 
      end  
    end
 
  assign q = ram[adr_reg];
  
endmodule
