task TC_08_Multiple_transection;

begin

    send_transaction(10,20);

    check_result(30);

    send_transaction(50,60);

    check_result(110);

    send_transaction(500,600);

    check_result(1100);

end

endtask
