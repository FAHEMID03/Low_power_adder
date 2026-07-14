class start_pulse_seq extends uvm_sequence #(adder_seq_item);

   adder_seq_item req;

   `uvm_object_utils(start_pulse_seq)

   task body();

      req=adder_seq_item::type_id::create("req");

      start_item(req);

      req.A=15;
      req.B=25;
      req.Start_i=1;

      finish_item(req);

   endtask

endclass
