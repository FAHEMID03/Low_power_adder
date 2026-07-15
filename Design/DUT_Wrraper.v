module low_power_adder_top
(

input clk,
input rst_n,

//---------------------
// AXI Slave Interface
//---------------------

input [31:0] s_axi_awaddr,
input        s_axi_awvalid,
output       s_axi_awready,

input [31:0] s_axi_wdata,
input        s_axi_wvalid,
output       s_axi_wready,

output [1:0] s_axi_bresp,
output       s_axi_bvalid,

input        s_axi_bready,

input [31:0] s_axi_araddr,
input        s_axi_arvalid,

output       s_axi_arready,

output [31:0] s_axi_rdata,
output        s_axi_rvalid,

input         s_axi_rready

);
