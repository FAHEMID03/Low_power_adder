task TC_09_Back_to_Back;

begin

    @(posedge clk);

    A<=10;

    B<=20;

    Start_i<=1;

    @(posedge clk);

    A<=30;

    B<=40;

    Start_i<=1;

    @(posedge clk);

    Start_i<=0;

end

endtask
