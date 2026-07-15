`timescale 1ns/1ps

module low_power_adder_wrapper
(
    input  logic         clk,
    input  logic         rst_n,

    //-------------------------
    // AXI WRITE CHANNEL
    //-------------------------

    input  logic [31:0]  awaddr,
    input  logic         awvalid,
    output logic         awready,

    input  logic [31:0]  wdata,
    input  logic [3:0]   wstrb,
    input  logic         wvalid,
    output logic         wready,

    output logic [1:0]   bresp,
    output logic         bvalid,
    input  logic         bready,

    //-------------------------
    // AXI READ CHANNEL
    //-------------------------

    input  logic [31:0]  araddr,
    input  logic         arvalid,
    output logic         arready,

    output logic [31:0]  rdata,
    output logic [1:0]   rresp,
    output logic         rvalid,
    input  logic         rready
);

///////////////////////////////////////////////////////
// Register File
///////////////////////////////////////////////////////

logic [31:0] reg_a;
logic [31:0] reg_b;
logic        reg_start;

logic [31:0] reg_result;
logic        reg_valid;

///////////////////////////////////////////////////////
// DUT Instance
///////////////////////////////////////////////////////

low_power_adder DUT
(
    .clk          (clk),
    .rst_n        (rst_n),

    .A            (reg_a),
    .B            (reg_b),
    .Start_i      (reg_start),

    .Data_O       (reg_result),
    .Data_Valid_O (reg_valid)
);

///////////////////////////////////////////////////////
// AXI WRITE
///////////////////////////////////////////////////////

always_ff @(posedge clk or negedge rst_n)
begin

    if(!rst_n)
    begin
        reg_a     <= 0;
        reg_b     <= 0;
        reg_start <= 0;

        awready   <= 0;
        wready    <= 0;
        bvalid    <= 0;
        bresp     <= 2'b00;
    end

    else
    begin

        awready <= 1'b1;
        wready  <= 1'b1;

        if(awvalid && wvalid)
        begin

            case(awaddr)

            32'h0000:
                reg_a <= wdata;

            32'h0004:
                reg_b <= wdata;

            32'h0008:
                reg_start <= wdata[0];

            default:
                ;

            endcase

            bvalid <= 1'b1;

        end

        if(bvalid && bready)
            bvalid <= 0;

        //-------------------------------------------------
        // Automatically clear Start bit
        //-------------------------------------------------

        if(reg_start)
            reg_start <= 0;

    end

end

///////////////////////////////////////////////////////
// AXI READ
///////////////////////////////////////////////////////

always_comb
begin

    arready = 1'b1;

    rvalid  = arvalid;

    rresp   = 2'b00;

    case(araddr)

        32'h0000:
            rdata = reg_a;

        32'h0004:
            rdata = reg_b;

        32'h0008:
            rdata = {31'd0,reg_start};

        32'h000C:
            rdata = {31'd0,reg_valid};

        32'h0010:
            rdata = reg_result;

        default:
            rdata = 32'hDEADBEEF;

    endcase

end

endmodule
