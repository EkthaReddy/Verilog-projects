module Automatic_Washing_Machine (Clock,Reset,Start,Door_Close,Filled,Drained,Detergent_Added, Cycle_Timeout, Spin_Timeout, Motor_on, Fill_valve_on, Drained_valve_on, Door_Lock, Done); 
input Clock, Reset, Start, Door_Close, Filled, Drained, Detergent_Added, Cycle_Timeout, Spin_Timeout; 
output reg Motor_on,Fill_valve_on,Drained_valve_on,Door_Lock,Done;
parameter Check_Door=3'b000;
parameter Fill_Water=3'b001;
parameter Add_Detergent=3'b010; 
parameter Cycle=3'b011; 
parameter Drain_Water=3'b100; 
parameter Spin=3'b101; 
reg[2:0] Current_State,Next_State; 
always@(Current_State or Start or Door_Close or Filled or Drained or Detergent_Added or Cycle_Timeout or Spin_Timeout)
begin
case(Current_State) 
Check_Door:
if(Start==1 && Door_Close==1)
begin
Next_State=Fill_Water; 
Motor_on=0; 
Fill_valve_on=0; 
Drained_valve_on=0;
Door_Lock=1; 
Done=0; 
end 
else 
begin
Next_State=Current_State;
Motor_on=0; 
Fill_valve_on=0; 
Drained_valve_on=0;
Door_Lock=0; 
Done=0; 
end 

Fill_Water: 
if(Filled==1) 
begin 
Next_State=Add_Detergent;
Motor_on=0; 
Fill_valve_on=0; 
Drained_valve_on=0;
Door_Lock=1;
Done=0; 
end 
else
begin 
Next_State=Current_State;
Motor_on=0; 
Fill_valve_on=1; 
Drained_valve_on=0;
Door_Lock=1; 
Done=0; 
end 

Add_Detergent:
if(Detergent_Added==1)
begin
Next_State=Cycle; 
Motor_on=0;
Fill_valve_on=0; 
Drained_valve_on=0;
Door_Lock=1;
Done=0; 
end 
else
begin 
Next_State=Current_State;
Motor_on=0; 
Fill_valve_on=0; 
Drained_valve_on=0;
Door_Lock=1;
Done=0; 
end

Cycle:
if(Cycle_Timeout==1)
begin
Next_State=Drain_Water;
Motor_on=0; 
Fill_valve_on=0; 
Drained_valve_on=0;
Door_Lock=1; 
Done=0; 
end
else
begin 
Next_State=Current_State;
Motor_on=1; 
Fill_valve_on=0;
Drained_valve_on=0; 
Door_Lock=1;
Done=0; 
end 

Drain_Water: 
if(Drained==1)
begin 
Next_State=Spin; 
Motor_on=0;
Fill_valve_on=0; 
Drained_valve_on=1; 
Door_Lock=1; 
Done=0; 
end 
else
begin
Next_State=Current_State; 
Motor_on=0; 
Fill_valve_on=0; 
Drained_valve_on=1;
Door_Lock=1; 
Done=0; 
end 

Spin: 
if(Spin_Timeout==1)
begin
Next_State=Check_Door; 
Motor_on=0; 
Fill_valve_on=0; 
Drained_valve_on=0; 
Door_Lock=0;
Done=1; 
end 
else 
begin
Next_State=Current_State;
Motor_on=0; 
Fill_valve_on=0;
Drained_valve_on=1;
Door_Lock=1; 
Done=0; 
end 
default: 
Next_State=Check_Door;
endcase
end 
always@(posedge Clock or negedge Reset) 
begin 
if (Reset)
Current_State<=0; 
else 
Current_State<=Next_State;
end 
endmodule 

