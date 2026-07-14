task TC_06_Start_Pulse;

begin

    $display("Running TC_06");

    send_transaction(20,30);

    @(posedge clk);

    if(Start_i)
        $error("Start_i should be LOW");

end

endtask
