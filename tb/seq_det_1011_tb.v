module seq_det_1011_tb;
reg clk,rst,in;
wire out;

seq_det_1011 uut(
	.clk(clk),
	.rst(rst),
	.in(in),
	.out(out)
);

always #5 clk=~clk;

initial begin
	clk= 0;
	$monitor("Time=%0t \t clk=%b \t rst=%b \t in=%b \t out=%b", $time,clk,rst,in,out);
	 in=0;rst=0; #10; 
	 rst=1; #10 in=0; #10 in=1; #10 in=0; #10 in=1; #10 in=1;
	 in=1; #10 in=0; #10 in=0; #10 in=1; #10 in=0; #10 in=1;
	 in=1; #10 in=0; #10 in=1; #10 in=0; #10 in=1; #10 in=1;
	 #20; 
	 $finish;
 end

 initial begin
	 $dumpfile("seq_det_1011.vcd");
	 $dumpvars();
 end
 endmodule

