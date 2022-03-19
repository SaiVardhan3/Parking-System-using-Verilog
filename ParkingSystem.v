module ps(
input clk,reset,entry,exit,    
input [3:0] password,
output reg status
    );
 parameter IDLE = 3'b00, PASSWORD_ENTRY = 3'b01, RIGHT_PASS = 3'b010;
 reg[1:0] current_state, next_state;

	 always @(posedge clk or negedge reset)
	 begin
	 if(~reset) 
	 current_state = IDLE;
	 else
	 current_state = next_state;
	 end
 
		 always @(*)
		 begin
		 case(current_state)
		 IDLE: begin
		 if(entry == 1)
		 next_state = PASSWORD_ENTRY;
		 else
		 next_state = IDLE;
		 end
		 PASSWORD_ENTRY: begin
		 if(password==4'b0000)
		 next_state = RIGHT_PASS;
		 else
		 next_state = PASSWORD_ENTRY;
		 end
		 RIGHT_PASS: begin
		 if(entry==1 && exit == 1)
		 next_state = PASSWORD_ENTRY;
		 else if(exit == 1)
		 next_state = IDLE;
		 end
		 default: next_state = IDLE;
		 endcase
		 end
		 
			 always @(posedge clk)
			 begin 
			 case(current_state)
			 IDLE: begin
			 status = 0;
			 end
			 PASSWORD_ENTRY: begin
			 status = 0;
			 end
			 RIGHT_PASS: begin
			 status =1;
			 end
			 endcase
			 end


endmodule
