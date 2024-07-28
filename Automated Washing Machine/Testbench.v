
module Automatic_Washing_Machine_Test_Bench; 
reg Clock, Reset, Start, Door_Close, Filled, Drained, Detergent_Added, Cycle_Timeout, Spin_Timeout;
wire Motor_on, Fill_valve_on, Drained_valve_on, Door_Lock, Done;
Automatic_Washing_Machine uut (Clock,Reset,Start,Door_Close,Filled,Drained,Detergent_Added,Cycle_Timeout,Spin_Timeout,Motor_on,Fill_valve_on,Drained_valve_on,Door_Lock,Done); 
  
initial begin
  $dumpfile("dump.vcd");
  $dumpvars(0);
 $monitor("Time=%d, Clock=%b, Reset=%b, Start=%b, Door_Close=%b, Filled=%b, Drained=%b, Dete rgent_Added=%b, Cycle_Timeout=%b, Spin_Timeout=%b, Motor_on=%b, Fill_valve_on=%b, Drain ed_valve_on=%b, Door_Lock=%b, Done=%b", $time, Clock, Reset, Start, Door_Close, Filled, Drained, Detergent_Added, Cycle_Timeout, Spin_Timeout, Motor_on, Fill_valve_on, Drained_valve_on, Door_Lock, Done) ; 
end 
initial begin
 
Clock=0;
Reset=1;
Start=0; 
Door_Close=0;
Filled=0; 
Drained=0; 
Detergent_Added=0; 
Cycle_Timeout=0;
Spin_Timeout=0;
#10
Reset=1;
#10 
Start=1;
Door_Close=1;
#10
Filled=1;
Start=0;
Door_Close=0;
#10
Detergent_Added=1;
Filled=0;
#10 
Cycle_Timeout=1;
Detergent_Added=0; 
#10
Drained=1;
Cycle_Timeout=0;
#10 
Spin_Timeout=1;
Drained=0;
#10
Spin_Timeout=0;
end 
always @(posedge Clock)
begin
Clock = ~Clock; 
end 
endmodule
