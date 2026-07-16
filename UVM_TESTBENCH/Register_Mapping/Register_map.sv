//Register Map
//________________
Address	Register	             Description
0x00	                        REG_A	Operand A
0x04	                        REG_B	Operand B
0x08	                        TRL	bit0 = Start
0x0C	                        STATUS	bit0 = Data Valid
0x10	                        RESULT	Addition Result




//Register implementation
//__________________________
logic [31:0] reg_a;
logic [31:0] reg_b;
logic        reg_start;

logic [31:0] reg_result;
logic        reg_valid;



//Write Address decode
//___________________
always_ff @(posedge clk)

begin

if(write_enable)

begin

case(awaddr)

32'h00:

reg_a<=wdata;

32'h04:

reg_b<=wdata;

32'h08:

reg_start<=wdata[0];

endcase

end

end


//Read Address Decode
//__________________________
always_comb

begin

case(araddr)

32'h00:rdata=reg_a;

32'h04:rdata=reg_b;

32'h08:rdata={31'd0,reg_start};

32'h0C:rdata={31'd0,reg_valid};

32'h10:rdata=reg_result;

default:rdata=32'h0;

endcase

end
