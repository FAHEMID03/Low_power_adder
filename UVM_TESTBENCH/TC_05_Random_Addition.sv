task TC_05_Random;

logic [31:0] a,b;

repeat(100)

begin

    a = $urandom();

    b = $urandom();

    send_transaction(a,b);

    check_result(a+b);

end

endtask
