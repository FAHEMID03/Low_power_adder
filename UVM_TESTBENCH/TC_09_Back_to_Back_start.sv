class back_to_back_seq extends uvm_sequence #(adder_seq_item);

   adder_seq_item req;

   `uvm_object_utils(back_to_back_seq)

   task body();

      repeat(10)

      begin

         req=adder_seq_item::type_id::create("req");

         start_item(req);

         assert(req.randomize());

         req.Start_i=1;

         finish_item(req);

         // No idle cycle

      end

   endtask

endclass
