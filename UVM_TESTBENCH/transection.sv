task automatic send_transection
  (
    input logic[31:0] a,
    output logic[31:0]b
  );
  begin
    @(posedge clk)

    A <=a;
    B <=b;
    start_i <= 1'b1;
    @(posedge clk);
    start_i <=1'b0;
  end
endtask

//-------------------------------------------------------//
// common task for checking result                       //
//-------------------------------------------------------//

task automatic check_result
  (
    input logic[31:0] expected
  );
  begin
    wait (Data_valid_0);
    if(Data_O == expected)
        $display("[%0t] PASS Expected=%0d Actual=%0d",
                 $time, expected, Data_O);
    else
        $error("[%0t] FAIL Expected=%0d Actual=%0d",
                $time, expected, Data_O);

end

endtask
    
