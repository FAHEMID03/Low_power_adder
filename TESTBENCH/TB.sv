`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: SK ABDUL FAHEMID
// Create Date:  20:15:56 11/07/2026 
// Design Name:  LOW POWER ADDER
// Module Name:  LOW POWER TB
// Project Name: LOW POWER ADDER
// Target Devices: None
// Tool versions: 
// Description: 
// Dependencies: 
// Revision: 
// Revision 1.02 - File Created
// Additional Comments: 
//////////////////////////////////////////////////////////////////////////////////

module tb_low_power_adder;

parameter WIDTH   = 32;
parameter LATENCY = 3;

//_____________________________________________________//
//                  DUT SIGNAL                         //
//_____________________________________________________//

logic              clk;
logic              rst_n;
logic              start_i;
logic [WIDTH-1:0]  A;
logic [Width-1:0]  B;
logic [WIDTH-1:0]  Data_0;
logic              Data_Valid_0;

//-------------------------------------------------------//
//               DUT Instruction                         //
//-------------------------------------------------------//

low_power_adder #(.WIDTH(WIDTH),.LATENCY(LATENCY))
dut 
(.clk(clk),.rst_n(rst_n),.start_i(start_i),.A(A),.B(B),.data_0(data_0),.data_valid_0(data_valid_0));
  
//--------------------------------------------------------//
//        Clock Generation 100 MHZ                        //
//--------------------------------------------------------//

initial
  begin
    clk=0;
    forever #5 clk = ~clk;
  end

  //--------------------------------------------------------//
  //            Reset                                       //
  //--------------------------------------------------------//

  task reset_dut();
    begin
      rst_n = 0;
      start_i =0;
      a       =0;
      b       =0;
      repet(5) @(posedge clk);
      rst_n  =1;
    end
  endtask
  //------------------------------------------------------------//
  //    Send transection                                        //
  //------------------------------------------------------------//

  task send_data
    (input[31:0] a,
     input[31:0] b
    );
 begin
   @(Posedge clk);
       A       <= a;
       B       <= b;
    start_i    <= 1;
   @(posedge clk);
    start_i <= 0;
 end
  endtask
//-----------------------------------------------------------------//
//                Wait for Output                                  //
//----------------------------------------------------------------//

  task wait_for_result();
    begin
      wait(data_valid_0);
      if(Data_0 == (A+B))
        begin
          $display("--------------------------------");
          $display("PASS");
          $display("A=%0d",A);
          $display("B=%0d",B);
          $display("SUM=%0d",Data_O);
          $display("--------------------------------");
        end
    else
       begin
         $display("--------------------------------");
         $display("FAIL");
         $display("Expected=%0d",A+B);
         $display("Received=%0d",Data_O);
         $display("--------------------------------");
        end

    @(posedge clk);
    end
  endtask
//----------------------------------------------
// Test Sequence
//----------------------------------------------

initial
begin

    reset_dut();

    //------------------------------------------
    // Test-1
    //------------------------------------------

    send_data(5,3);
    wait_for_result();

    //------------------------------------------
    // Test-2
    //------------------------------------------

    send_data(10,20);
    wait_for_result();

    //------------------------------------------
    // Test-3
    //------------------------------------------

    send_data(100,300);
    wait_for_result();

    //------------------------------------------
    // Test-4
    //------------------------------------------

    send_data(32'hFFFFFFFF,1);
    wait_for_result();

    //------------------------------------------
    // Random Tests
    //------------------------------------------

    repeat(20)
    begin

        send_data($urandom,$urandom);
        wait_for_result();

    end

    $display("Simulation Completed.");

    #50;

    $finish;

end

//----------------------------------------------
// Monitor
//----------------------------------------------

initial
begin

    $display(" Time\tStart\tA\tB\tValid\tOutput");

    forever
    begin

        @(posedge clk);

        $display("%0t\t%b\t%0d\t%0d\t%b\t%0d",
        $time,
        Start_i,
        A,
        B,
        Data_Valid_O,
        Data_O);

    end

end

endmodule
          






  
    



















  
