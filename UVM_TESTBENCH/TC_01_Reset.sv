Task TC_01_reset;
begin
  $display("Running TC_01 Reset");
  rst_n = 0;
  
  repet(5)@(posedge clk);
  
  if(Data_0 !=0)
    $error(Data_0 is not a Zero);
  
  if(Data_Valid_0 !=0)
    $error ("Data_valid_0 is not Zero");
  
  rst_n = 1;
  
end

endtask
