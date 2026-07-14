task TC_10_Idle;

logic [31:0] old_data;

begin

    old_data = Data_O;

    repeat(20)

    begin

        @(posedge clk);

        if(Start_i==0)

            if(Data_O!=old_data)

                $error("Output changed during Idle");

    end

end

endtask
