task TC_04_Overflow;

begin

    $display("Running TC_04");

    send_transaction(32'hFFFFFFFF,32'h1);

    check_result(32'h00000000);

end

endtask
