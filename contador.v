module ff ( input data, input c, input r, output q);
reg q;
always @(posedge c or negedge r) 
begin
 if(r==1'b0)
  q <= 1'b0; 
 else 
  q <= data; 
end 
endmodule 

module stateMem(input clk,input res, input [1:0] A, output [2:0] C);
reg [5:0] StateMachine [0:31];
initial
begin
StateMachine[0] = 6'h12;
StateMachine[1] = 6'h23;
StateMachine[2] = 6'h30;
StateMachine[3] = 6'h14;
StateMachine[4] = 6'h12;
StateMachine[6] = 6'h21;
StateMachine[8] = 6'h12;
StateMachine[9] = 6'h23;
StateMachine[10] = 6'h20;
StateMachine[11] = 6'h14;
StateMachine[12] = 6'h32;
StateMachine[14] = 6'h01;
StateMachine[16] = 6'h0A;
StateMachine[17] = 6'h0B;
StateMachine[18] = 6'h08;
StateMachine[19] = 6'h0C;
StateMachine[20] = 6'h0A;
StateMachine[22] = 6'h09;
StateMachine[24] = 6'h1A;
StateMachine[25] = 6'h1B;
StateMachine[26] = 6'h08;
StateMachine[27] = 6'h14;
StateMachine[28] = 6'h12;
StateMachine[30] = 6'h11;
end

wire [4:0] address;  
wire [5:0] dout;  
assign dout = StateMachine[address]; 
assign C = {dout[2],dout[1],dout[0]};
ff st0(dout[3],clk,res,address[0]);
ff st1(dout[4],clk,res,address[1]);
ff st2(dout[5],clk,res,address[2]);
assign address[3] = A[0];
assign address[4] = A[1];
endmodule
