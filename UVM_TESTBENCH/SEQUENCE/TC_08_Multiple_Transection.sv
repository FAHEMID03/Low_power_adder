class multiple_transaction_seq extends uvm_sequence #(adder_seq_item);

   adder_seq_item req;

   `uvm_object_utils(multiple_transaction_seq)

   task body();

      repeat(20)

      begin

         req=adder_seq_item::type_id::create("req");

         start_item(req);

         assert(req.randomize());

         req.Start_i=1;

         finish_item(req);

      end

   endtask

endclass
