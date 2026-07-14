Task TC_02_Basic_Addition;
begin
  
  $display("Running TC_02");
  
  send_transection(32'd5 , 32'd3);  //5+3=8
  
  check_result (32'd8);
  
end

endtask
