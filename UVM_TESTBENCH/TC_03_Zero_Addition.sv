class zero_add_seq extends uvm_sequence #(adder_seq_item);

   adder_seq_item req;

   `uvm_object_utils(zero_add_seq)

   task body();

      req=adder_seq_item::type_id::create("req");

      start_item(req);

      req.A=0;
      req.B=0;
      req.Start_i=1;

      finish_item(req);

   endtask

endclass
