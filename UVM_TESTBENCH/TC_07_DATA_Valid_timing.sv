task TC_07_data_valid;
  
  integer count;
  
  begin
    $display("Running TC_07");
    send_transection(100,200);
    count=0;
    
    while(!data_valid_0)
      
    begin
      @(posedge clk);
      count++;
    end
    
    if(county==3)
      $display("Latency PASS");
    
    else
      $error("Latency fail count=%0d",count);
    
  end
  
endtask
      
