`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: SK ABDUL FAHEMID
// Create Date:  09:15:56 11/07/2026 
// Design Name: LOW POWER ADDER
// Module Name:    LOW POWER
// Project Name: LOW POWER ADDER
// Target Devices: None
// Tool versions: ISE 14.2
// Description: 
// Dependencies: 
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//////////////////////////////////////////////////////////////////////////////////


module low_power_adder;
  #(parameter WIDTH=32,
   parameter LATENCY=3
   )
  (
  input logic             clk,
  input logic             rst_n,
  input logic             start_i,
  input logic[WIDTH-1:0]   A,
  input logic[WIDTH-1:0]   B,
  output logic[WIDTH-1:0]  data_0,
  output logic             data_valid_0
  );

  logic[WIDTH-1:0]         a_reg;
  logic[WIDTH-1:0]         b_reg;

  logic[$clog2(LATENCY+1)-1:0]counter;
  typedef enum logic[1:0]
  {
    IDEL,
    COMPUTE,
    VALID
  }state_t;
  state_t state;
  always_ff @(posedge clk or negedge rst_n);
  begin
    if(rst_n)
      begin
        state  <= Idel;
        data_0   <='0;
        Data_Valid_0 <=1'b0;
        counter <='0;
        a_reg <='0;
        b_reg <='0;
      end

    else
      begin
        Data_valid_0 <=1'b0;
        case (state)
        
 //-----------------------------------------------------//
 //                    IDEL :                            //
//-------------------------------------------------------//
          
 begin
   if(counter ==LATENCY-1);
   begin
     Data_0 ==a_reg + b_reg;
     state <= VALID;
   end
   else
     begin
       counter <= counter+1;
     end
 end

//________________________________________//
//         VALID:                         //
//________________________________________//
    begin
      Data_valid_0 <= 1'b1;
                  <=IDEL;
    end
        endcase
      end
  end
endmodule
        
  
