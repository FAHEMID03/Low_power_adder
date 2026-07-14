task TC_03_Zero_Addition;

begin

    $display("Running TC_03");

    send_transaction(0,0);

    check_result(0);

end

endtask
