module seq_det_1011(
	input clk,rst,in,
	output reg out);

parameter S0=3'b000, S1=3'b001, S2=3'b010, S3=3'b011, S4=3'b100;

reg [2:0] cur_state, next_state;

always @(posedge clk or negedge rst)begin
	if(!rst)
		cur_state<= S0;
	else
		cur_state<= next_state;
end

always @(*) begin
	case(cur_state)
		S0: next_state= in? S1:S0;
		S1: next_state= in? S1:S2;
		S2: next_state= in? S3:S0;
		S3: next_state= in? S4:S2;
		S4: next_state= in? S1:S2;
		default: next_state= S0;
	endcase
end

always @(*) begin
	out<=(cur_state==S4);
end

endmodule


