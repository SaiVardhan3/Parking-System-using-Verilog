module parkingsystem_tb;

	// Inputs
	reg clk;
	reg reset;
	reg entry;
	reg exit;
	reg [3:0] password;

	// Outputs
	wire status;

	// Instantiate the Unit Under Test (UUT)
	parkingsystem uut (
		.clk(clk), 
		.reset(reset), 
		.entry(entry), 
		.exit(exit), 
		.password(password), 
		.status(status)
	);

	initial begin
		reset = 0;
		entry = 0;
		exit = 0;
		password = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		reset =1;
		entry = 1;
		#100
		password = 4'b0000;
		#100;
		entry =1;
		exit=1;
		password =4'b0011;
      #100;
      password = 4'b0000;


	end
      
endmodule

